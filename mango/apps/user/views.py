from django.shortcuts import render, redirect, HttpResponse
from django.core.urlresolvers import reverse
from user.models import User
from django.views.generic import View
from mango import settings
from itsdangerous import TimedJSONWebSignatureSerializer as ts
from django.core.mail import send_mail
from celery_tasks.tasks import send_register_active_email
from django.contrib.auth import authenticate, login, logout
from utils.mixin import LoginRequiredMixin
from movie.models import MovieSKU
from django_redis import get_redis_connection


# Create your views here.

# http://127.0.0.1:8000/user/register
# 注册用户
class RegisterView(View):
    def get(self, request):
        """   显示注册页面   """
        return render(request, "register.html")

    def post(self, request):
        """   处理注册页面的表单   """

        # 接收表单提交过来的参数
        user_name = request.POST.get("user_name")
        pwd = request.POST.get("pwd")
        email = request.POST.get("email")
        allow = request.POST.get("allow")

        # 校验参数
        if not all([user_name, pwd, email, allow]):
            return render(request, "register.html", {"errmsg": "参数不完整"})
        import re

        if not re.match(r'^\w+@[a-z0-9]+\.[a-z]{2,4}$', email):
            return render(request, "register.html", {"errmsg": "邮箱格式不正确"})
        if allow != "on":
            return render(request, "register.html", {"errmsg": "请统统一协议"})

        # 检验用户是否注册过了
        try:
            user = User.objects.get(username=user_name)
        except User.DoesNotExist:
            # 说明用户不存在
            user = None

        if user:
            # user不是None，说明这个用户已经够注册过了
            return render(request, "register.html", {"errmsg": "该用户已存在"})

        # 业务处理===往数据库中添加一条数据，使用django自带的功能添加一条用户数据
        user = User.objects.create_user(user_name, email, pwd)

        # 默认情况下，django给我们已经激活用户了，我不想，我想收到邮件后，在进行激活
        user.is_active = 0  # 表示不激活
        user.save()

        # 发送邮件激活，包含激活链接：http://127.0.0.1:8000/user/active/3   3是用户的id
        # 激活连接中需要包含用户的身份信息，并且要把身份信息进行加密
        s1 = ts(settings.SECRET_KEY, 3600)
        info = {"id": user.id}
        token = s1.dumps(info).decode()

        # 发送邮件
        # subject = "芒果TV"
        # message = ""
        # html_message = "{},欢迎注册芒果TV，单击此链接激活用户：<a href='http://127.0.0.1:8000/user/active/{}'>http://127.0.0.1:8000/user/{}</a>".format(user.username, token, token)
        # from_email = settings.EMAIL_FROM    # 表示发送者信息
        # recipient_list = [email]
        #
        # send_mail(subject, message, from_email, recipient_list, html_message=html_message)

        send_register_active_email.delay(email, user_name, token)

        # 返回应答
        return redirect(reverse("user:login"))


# 激活用户
class ActiveView(View):
    """   激活用户   """

    def get(self, request, token):

        # 解密
        s2 = ts(settings.SECRET_KEY, 3600)

        try:
            info = s2.loads(token)
            print(info)
            s_id = info.get("id")
            print(s_id)
            # 将数据库中对应的id记录的is_active字段进行修改为1
            user = User.objects.get(id=s_id)
            user.is_active = 1
            user.save()
            # 激活成功以后，跳转到登录页面
            return redirect(reverse("user:login"))

        except Exception as e:
            # 激活链接过期，应该再打开一个页面，单击按钮，在此发送邮件
            return HttpResponse("激活链接过期")


# 登录
class LoginView(View):
    def get(self, request):
        """   显示登录页面   """
        # 在显示登录页面的时候需要判断有没有记住用户名
        if "username" in request.COOKIES:
            username = request.COOKIES.get("username")
            checked = "checked"
        else:
            username = ""
            checked = ""
        return render(request, "MTV_login.html", {"username": username, "checked": checked})

    def post(self, request):
        """   处理登录页面表单   """
        # 接收表单的参数
        username = request.POST.get("username")
        pwd = request.POST.get("pwd")
        remember = request.POST.get("remember")

        # 校验参数
        if not all([username, pwd]):
            return render(request, "MTV_login.html", {"errmsg": "参数不完整"})

        user = authenticate(username=username, password=pwd)  # django自带的一个登录函数，判断是账号密码是否正确
        if user is not None:
            # 表示用户名和密码正确
            # 判断用户有没有激活
            if user.is_active:
                # 表示用户已经激活
                login(request, user)  # login这个函数是底层做的，将登录的状态写入到django_session这个表中
                # 获取登陆后要跳转的地址
                # 默认跳转到首页
                next_url = request.GET.get("next")
                # 跳转到next_url
                # 登录成功后，判断有没有记住用户名
                res = redirect(reverse("movie:index"))
                if remember == "on":
                    res.set_cookie("username", username, max_age=60 * 60)
                else:
                    res.delete_cookie("username")
                return res

            else:
                # 表示用户没有激活
                return render(request, "MTV_login.html", {"errmsg": "请激活该用户"})
        else:
            # 表示改用户名和密码不正确
            return render(request, "MTV_login.html", {"errmsg": "用户名或密码不正确"})


# 忘记密码
class ForgetView(View):
    """   忘记密码   """
    pass


# 浏览记录
class RecordView(LoginRequiredMixin, View):
    pass


# 用户信息
class UserInfoView(LoginRequiredMixin, View):
    def get(self, request):
        """   显示   """
        # rr = request.user.is_authenticated()
        # request.user  user是django自带的一个全局变量
        # request.user.is_authenticated()是在视图函数中使用的
        # user.is_authenticated()是在模板中使用的
        # 如果用户未登录返回False，如果登录了返回True
        # 获取用户的个人信息
        user = request.user
        if not user.is_authenticated():
            return redirect(reverse("user:login"))
        else:
            conn = get_redis_connection("default")
            history_key = "history_%s" % user.id

            # 获取用户最新浏览的五个影视的id
            sku_ids = conn.lrange(history_key, 0, 4)

            # 从数据库中查询用户浏览的影视的具体信息
            movie_li = MovieSKU.objects.filter(id__in=sku_ids)
            movies_res = []
            for a_id in sku_ids:
                for movie in movie_li:
                    if a_id.decode() == str(movie.id):
                        movies_res.append(movie)
            return render(request, "user_center_info.html", {"page": "user", "movies_res": movies_res})


# 退出登录
class LogoutView(View):
    def get(self, request):
        # 清除session信息
        logout(request)
        # 跳转到首页
        return redirect(reverse("movie:index"))


# 此文件是用来定义各种任务的

from celery import Celery
from django.core.mail import send_mail
from mango import settings
from movie.models import MovieType, IndexMoviesBanner, Movies, MovieSKU, IndexTypeMoviesBanner
from django.template import loader, RequestContext

# 在任务处理者这一端添加这几句

import os

# import django
# os.environ.setdefault("DJANGO_SETTINGS_MODULE", "mango.settings")
# django.setup()

# 创建Celery对象，第一个参数表示这个任务的地址
# 第二个参数表示指定的中间人
app = Celery("celery_tasks.tasks", broker="redis://192.168.0.105/8")


# 定义异步发送邮件的任务，但凡是使用celery进行异步执行的任务函数都需要这个装饰器进行装饰，这是规定
@app.task
def send_register_active_email(to_email, username, token):
    # 发送邮件
    subject = "芒果TV"
    message = ""
    html_message = "{},欢迎注册芒果TV，单击此链接激活用户：<a href='http://127.0.0.1:8000/user/active/{}'>http://127.0.0.1:8000/user/{}</a>".format(
        username, token, token)
    from_email = settings.EMAIL_FROM  # 表示发送者信息
    recipient_list = [to_email]

    send_mail(subject, message, from_email, recipient_list, html_message=html_message)


@app.task
def generate_static_index_html():
    """   产生首页静态页面   """
    # 获取影视的种类信息
    types = MovieType.objects.all()

    # 获取首页轮播商品的信息
    movie_banner = IndexMoviesBanner.objects.all().order_by("index")

    # 获取所有影视的sku
    move_sku = Movies.objects.all()

    # 获取所有影视的信息
    movie_all = MovieSKU.objects.all()

    # 获取影视展示标题
    movie_logo = IndexTypeMoviesBanner.objects.all().order_by("index")
    # 组织模板上下文
    context = {
        "types": types,
        "movie_banner": movie_banner,
        "move_sku": move_sku,
        "move_all": movie_all,
        "movie_logo": movie_logo
    }

    # 使用模板
    # 1、加载模板文件，返回模板对象
    temp = loader.get_template("index.html")
    # 2、模板渲染
    static_index_html = temp.render(context)

    # 生成首页对应静态文件
    save_path = os.path.join(settings.BASE_DIR, "static/index.html")
    with open(save_path, "w") as f:
        f.write(static_index_html)

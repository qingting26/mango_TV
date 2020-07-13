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

# 浏览记录
class UserRecordView(LoginRequiredMixin, View):
    def get(self, request):

        # 获取用户的个人信息
        user = request.user
        if not user.is_authenticated():
            return redirect(reverse("user:login"))
        else:
            conn = get_redis_connection("default")
            history_key = "history_%s" % user.id

            # 获取用户最新浏览的十二个影视的id
            sku_ids = conn.lrange(history_key, 0, 12)
            # 从数据库中查询用户浏览的影视的具体信息
            movie_li = MovieSKU.objects.filter(id__in=sku_ids)
            movies_res = []
            for a_id in sku_ids:
                for movie in movie_li:
                    if a_id.decode() == str(movie.id):
                        movies_res.append(movie)
            return render(request, "history.html", {"page": "user", "movies_res": movies_res, "user": user})

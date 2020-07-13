from django.shortcuts import render, redirect
from django.http import JsonResponse
from django.core.urlresolvers import reverse
from django.views.generic import View
from movie.models import MovieType, IndexMoviesBanner, Movies, MovieSKU, IndexTypeMoviesBanner, MovieImage, \
    IndexPromotionBanner
from django.core.cache import cache
from django_redis import get_redis_connection
import time


# Create your views here.

# http://127.0.0.1:8000
class IndexView(View):
    def get(self, request):
        """   显示首页页面   """

        # 尝试从缓存中获取数据
        context = cache.get("index_page_data")
        if context is None:
            # 获取影视的种类信息
            types = MovieType.objects.all()

            # 获取首页轮播影视的信息
            movie_banner = IndexMoviesBanner.objects.all().order_by("index")

            # 获取所有影视的sku
            move_sku = Movies.objects.all()

            # 获取所有影视的信息
            movie_all = MovieSKU.objects.all()
            print(movie_all)

            # 获取影视展示标题
            movie_logo = IndexTypeMoviesBanner.objects.all().order_by("index")

            # 获取所有vip影视
            movie_vip = MovieImage.objects.all()

            # 获取活动影视
            active_movie = IndexPromotionBanner.objects.all().order_by("index")

            # 组织模板上下文
            context = {
                "types": types,
                "movie_banner": movie_banner,
                "move_sku": move_sku,
                "move_all": movie_all,
                "movie_logo": movie_logo,
                "movie_vip": movie_vip,
                "active_movie": active_movie
            }

            # 设置缓存
            cache.set("index_page_data", context, 3600)
        return render(request, "index.html", context)

    def post(self, request):
        pass


# 详情页
class DetailView(View):
    """   详情页   """

    def get(self, request, movie_id):
        """   显示详情页   """
        try:
            sku = MovieSKU.objects.get(id=movie_id)
        except MovieSKU.DoesNotExist:
            # 影视不存在
            return redirect(reverse("movie:index"))
        # 获取影视的分类信息
        types = MovieType.objects.all()
        sku_s = MovieSKU.objects.filter(type=sku.type).exclude(id=movie_id)

        user = request.user
        # print(user)
        if user.is_authenticated():
            # print("2")
            # 添加用户的历史记录
            conn = get_redis_connection("default")
            history_key = "history_%s" % user.id
            # 移除列表中的movie_id
            conn.lrem(history_key, 0, movie_id)
            # 把movie_id 插入到列表的左侧
            conn.lpush(history_key, movie_id)
            # 只保存用户最新浏览的五条信息
            conn.ltrim(history_key, 0, 10)

        # 组织模板上下文
        context = {
            "sku": sku,
            "types": types,
            "sku_s": sku_s,
        }

        return render(request, "bofang.html", context)


# 列表页
class ListView(View):
    """   列表页   """

    def get(self, request, type_id, for_id):
        """   显示列表页   """
        # 获取用户信息
        user = request.user
        # 获取种类信息
        try:
            types = MovieType.objects.get(id=type_id)
            type_all = MovieType.objects.all()
        except MovieType.DoesNotExist:
            # 种类不存在
            return redirect(reverse("movie:index"))

        # 获取某一个种类的所有影视
        if for_id == "0":
            try:
                movie_list = MovieSKU.objects.filter(type=types)
            except MovieSKU.DoesNotExist:
                # 获取失败
                return redirect(reverse("movie:index"))
        else:
            try:
                movie_list = MovieSKU.objects.filter(type=types, movies=Movies.objects.get(id=for_id))
            except MovieSKU.DoesNotExist:
                # 获取失败
                return redirect(reverse("movie:index"))

        # 获取所有类型
        try:
            movie_type = Movies.objects.all()
        except Movies.DoesNotExist:
            # 获取失败
            return redirect(reverse("movie:index"))
        aa = request.path_info
        bb = aa.split("/")
        context = {
            "types": types,
            "movie_list": movie_list,
            "movie_type": movie_type,
            "type_all": type_all,
            "bb": bb[2],
            "user": user
        }
        return render(request, "dianying.html", context)
        # return JsonResponse({"cool": 1, "msg": "ok", "data": context})
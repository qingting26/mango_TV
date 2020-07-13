from django.conf.urls import url
from movie import views

urlpatterns = [
    url(r'^$', views.IndexView.as_view(), name="index"),   # 显示首页
    # url(r'test/', views.test, name="test"),  # 测试
    url(r'movie/(?P<movie_id>\d+)$', views.DetailView.as_view(), name="movie"),   # 详情页
    url(r'list/(?P<type_id>\d+)/(?P<for_id>\d+)$', views.ListView.as_view(), name="list") ,   # 列表页
]
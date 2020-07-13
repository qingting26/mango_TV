from django.conf.urls import url
from user import views
from django.contrib.auth.decorators import login_required

urlpatterns = [
    # url(r'^register/', views.register, name="register"),  # 注册
    # url(r'^register_handle/', views.register_handle, name="register_handle"),  # 处理注册订单
    url(r'^register/', views.RegisterView.as_view(), name="register"),  # 基于类的注册
    url(r'^active/(?P<token>.*)$', views.ActiveView.as_view(), name="active"),  # 激活用户
    url(r'^login/', views.LoginView.as_view(), name="login"),  # 登录页面
    url(r'^user/', views.UserInfoView.as_view(), name="user"),  # 浏览记录
    url(r'^logout/', views.LogoutView.as_view(), name="logout"),  # 退出登录
]

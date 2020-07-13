from django.conf.urls import url
from apps.record import views


urlpatterns = [
    url(r'record/', views.UserRecordView.as_view(), name="record"),     # 历史记录
]
from django.db import models


class BaseModel(models.Model):
    """   模型抽象基类   """
    create_time = models.DateTimeField(auto_now_add=True, verbose_name="创建时间")
    update_time = models.DateTimeField(auto_now=True, verbose_name="更新时间")
    is_delete = models.BooleanField(default=False, verbose_name="删除标记")

    # 定义内嵌类
    class Meta:
        # abstract = True说明是一个抽象模型类,不能当作普通的django类来使用
        abstract = True

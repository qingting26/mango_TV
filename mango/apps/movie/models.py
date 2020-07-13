from django.db import models
from db.base_model import BaseModel
from tinymce.models import HTMLField


# Create your models here.

# 影视的种类
class MovieType(BaseModel):
    """   影视类型管理类   """
    name = models.CharField(max_length=20, verbose_name="种类名称")
    logo = models.CharField(max_length=20, verbose_name="标识")
    image = models.ImageField(upload_to='type', verbose_name="商品类型图片")
    cover_image = models.ImageField(upload_to="type", verbose_name="商品类封面图")

    class Meta:
        db_table = "df_movie_type"
        verbose_name = "影视类型"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


# 影视
class Movies(BaseModel):
    """   影视SPU模型类   """
    name = models.CharField(max_length=20, verbose_name="影视SPU名称")
    # 富文本类型： 带有格式的文本
    detail = HTMLField(blank=True, verbose_name="影视详情")

    def __str__(self):
        return self.name

    class Meta:
        db_table = "df_movie"
        verbose_name = "影视SPU"
        verbose_name_plural = verbose_name


# 影视名称
class MovieSKU(BaseModel):
    """   商品SKU模型类   """
    status_choices = (
        (0, "下线"),
        (1, "上线"),
    )
    type = models.ForeignKey("MovieType", verbose_name="影视种类")
    movies = models.ForeignKey("Movies", verbose_name="影视SPU")
    name = models.CharField(max_length=20, verbose_name="影视名称")
    desc = models.CharField(max_length=256, verbose_name="影视简介")
    image = models.ImageField(upload_to='movie', verbose_name="影视图片")
    status = models.SmallIntegerField(default=1, choices=status_choices, verbose_name="影视状态")

    def __str__(self):
        return self.name

    class Meta:
        db_table = 'db_movies_sku'
        verbose_name = "影视"
        verbose_name_plural = verbose_name


# VIP影视
class MovieImage(BaseModel):
    """   影视图片模型类   """
    sku = models.ForeignKey("MovieSKU", verbose_name="影视")
    image = models.ImageField(upload_to="movie", verbose_name="图片路径")
    
    def __str__(self):
        return self.sku.name

    class Meta:
        db_table = "df_movies_image"
        verbose_name = "VIP影视"
        verbose_name_plural = verbose_name


# 首页轮播图
class IndexMoviesBanner(BaseModel):
    """   首页轮播影视展示模型类   """
    sku = models.ForeignKey("MovieSKU", verbose_name="影视")
    image = models.ImageField(upload_to="banner", verbose_name="图片")
    index = models.SmallIntegerField(default=0, verbose_name="展示顺序")

    def __str__(self):
        return self.sku.name

    class Meta:
        db_table = "df_index_banner"
        verbose_name = "首页轮播图影视"
        verbose_name_plural = verbose_name


# 首页分类影视展示模型类
class IndexTypeMoviesBanner(BaseModel):
    """   首页分类影视展示模型类   """
    DISPLAY_TYPE_CHOICES = (
        (0, "标题"),
        (1, "图片")
    )
    type = models.ForeignKey("MovieType", verbose_name="影视类型")
    sku = models.ForeignKey("MovieSKU", verbose_name="影视SKU")
    display_type = models.SmallIntegerField(default=1, choices=DISPLAY_TYPE_CHOICES, verbose_name="影视显示类型")
    index = models.SmallIntegerField(default=0, verbose_name="商品顺序")

    def __str__(self):
        return self.type.name + "---" + self.sku.name

    class Meta:
        db_table = "df_index_type_movies"
        verbose_name = "主页分类展示影视"
        verbose_name_plural = verbose_name


# 影视活动类
class IndexPromotionBanner(BaseModel):
    """   首页活动影视   """
    name = models.CharField(max_length=20, verbose_name="活动名称")
    url = models.CharField(max_length=256, verbose_name="活动连接")
    image = models.ImageField(upload_to="banner", verbose_name='活动图片')
    index = models.SmallIntegerField(default=0, verbose_name="展示顺序")

    def __str__(self):
        return self.name

    class Meta:
        db_table = "df_index_promotion"
        verbose_name = "主页活动"
        verbose_name_plural = verbose_name

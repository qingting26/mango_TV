from django.contrib import admin
from django.core.cache import cache
from movie.models import MovieType, Movies, MovieSKU, MovieImage, IndexPromotionBanner, IndexTypeMoviesBanner, IndexMoviesBanner

# Register your models here.


class IndexPromotionBannerAdmin(admin.ModelAdmin):
    def save_model(self, request, obj, form, change):
        """   新增或者更新表中的数据时调用   """
        super().save_model(request, obj, form, change)

        # 发生任务，让celery worker重新生成首页静态页
        from celery_tasks.tasks import generate_static_index_html
        generate_static_index_html.delay()

        # 清除首页的缓存数据
        cache.delete("index_page_data")

    def delete_model(self, request, obj):
        """   删除表中的数据是调用   """
        super().delete_model(request, obj)
        # 发生任务，让celery worker重新生成首页静态页
        from celery_tasks.tasks import generate_static_index_html
        generate_static_index_html.delay()

        # 清除首页的缓存数据
        cache.delete("index_page_data")


admin.site.register(MovieType, IndexPromotionBannerAdmin)
admin.site.register(Movies, IndexPromotionBannerAdmin)
admin.site.register(MovieSKU, IndexPromotionBannerAdmin)
admin.site.register(MovieImage, IndexPromotionBannerAdmin)
admin.site.register(IndexPromotionBanner, IndexPromotionBannerAdmin)
admin.site.register(IndexTypeMoviesBanner, IndexPromotionBannerAdmin)
admin.site.register(IndexMoviesBanner, IndexPromotionBannerAdmin)
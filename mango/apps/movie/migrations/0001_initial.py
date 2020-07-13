# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import tinymce.models


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='IndexMoviesBanner',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, serialize=False, auto_created=True)),
                ('create_time', models.DateTimeField(verbose_name='创建时间', auto_now_add=True)),
                ('update_time', models.DateTimeField(verbose_name='更新时间', auto_now=True)),
                ('is_delete', models.BooleanField(verbose_name='删除标记', default=False)),
                ('image', models.ImageField(verbose_name='图片', upload_to='banner')),
                ('index', models.SmallIntegerField(verbose_name='展示顺序', default=0)),
            ],
            options={
                'verbose_name': '首页轮播图影视',
                'verbose_name_plural': '首页轮播图影视',
                'db_table': 'df_index_banner',
            },
        ),
        migrations.CreateModel(
            name='IndexPromotionBanner',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, serialize=False, auto_created=True)),
                ('create_time', models.DateTimeField(verbose_name='创建时间', auto_now_add=True)),
                ('update_time', models.DateTimeField(verbose_name='更新时间', auto_now=True)),
                ('is_delete', models.BooleanField(verbose_name='删除标记', default=False)),
                ('name', models.CharField(verbose_name='活动名称', max_length=20)),
                ('url', models.CharField(verbose_name='活动连接', max_length=256)),
                ('image', models.ImageField(verbose_name='活动图片', upload_to='banner')),
                ('index', models.SmallIntegerField(verbose_name='展示顺序', default=0)),
            ],
            options={
                'verbose_name': '主页活动',
                'verbose_name_plural': '主页活动',
                'db_table': 'df_index_promotion',
            },
        ),
        migrations.CreateModel(
            name='IndexTypeMoviesBanner',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, serialize=False, auto_created=True)),
                ('create_time', models.DateTimeField(verbose_name='创建时间', auto_now_add=True)),
                ('update_time', models.DateTimeField(verbose_name='更新时间', auto_now=True)),
                ('is_delete', models.BooleanField(verbose_name='删除标记', default=False)),
                ('display_type', models.SmallIntegerField(verbose_name='影视显示类型', default=1, choices=[(0, '标题'), (1, '图片')])),
                ('index', models.SmallIntegerField(verbose_name='商品顺序', default=0)),
            ],
            options={
                'verbose_name': '主页分类展示影视',
                'verbose_name_plural': '主页分类展示影视',
                'db_table': 'df_index_type_movies',
            },
        ),
        migrations.CreateModel(
            name='MovieImage',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, serialize=False, auto_created=True)),
                ('create_time', models.DateTimeField(verbose_name='创建时间', auto_now_add=True)),
                ('update_time', models.DateTimeField(verbose_name='更新时间', auto_now=True)),
                ('is_delete', models.BooleanField(verbose_name='删除标记', default=False)),
                ('image', models.ImageField(verbose_name='图片路径', upload_to='movie')),
            ],
            options={
                'verbose_name': '影视图片',
                'verbose_name_plural': '影视图片',
                'db_table': 'df_movies_image',
            },
        ),
        migrations.CreateModel(
            name='Movies',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, serialize=False, auto_created=True)),
                ('create_time', models.DateTimeField(verbose_name='创建时间', auto_now_add=True)),
                ('update_time', models.DateTimeField(verbose_name='更新时间', auto_now=True)),
                ('is_delete', models.BooleanField(verbose_name='删除标记', default=False)),
                ('name', models.CharField(verbose_name='影视SPU名称', max_length=20)),
                ('detail', tinymce.models.HTMLField(verbose_name='商品详情', blank=True)),
            ],
            options={
                'verbose_name': '影视SPU',
                'verbose_name_plural': '影视SPU',
                'db_table': 'df_movie',
            },
        ),
        migrations.CreateModel(
            name='MovieSKU',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, serialize=False, auto_created=True)),
                ('create_time', models.DateTimeField(verbose_name='创建时间', auto_now_add=True)),
                ('update_time', models.DateTimeField(verbose_name='更新时间', auto_now=True)),
                ('is_delete', models.BooleanField(verbose_name='删除标记', default=False)),
                ('name', models.CharField(verbose_name='影视名称', max_length=20)),
                ('desc', models.CharField(verbose_name='影视简介', max_length=256)),
                ('image', models.ImageField(verbose_name='影视图片', upload_to='movie')),
                ('status', models.SmallIntegerField(verbose_name='影视状态', default=1, choices=[(0, '下线'), (1, '上线')])),
                ('movie', models.ForeignKey(verbose_name='影视SPU', to='movie.Movies')),
            ],
            options={
                'verbose_name': '影视',
                'verbose_name_plural': '影视',
                'db_table': 'db_movies_sku',
            },
        ),
        migrations.CreateModel(
            name='MovieType',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, serialize=False, auto_created=True)),
                ('create_time', models.DateTimeField(verbose_name='创建时间', auto_now_add=True)),
                ('update_time', models.DateTimeField(verbose_name='更新时间', auto_now=True)),
                ('is_delete', models.BooleanField(verbose_name='删除标记', default=False)),
                ('name', models.CharField(verbose_name='种类名称', max_length=20)),
                ('logo', models.CharField(verbose_name='标识', max_length=20)),
                ('image', models.ImageField(verbose_name='商品类型图片', upload_to='type')),
                ('cover_image', models.ImageField(verbose_name='商品类封面图', upload_to='type')),
            ],
            options={
                'verbose_name': '影视类型',
                'verbose_name_plural': '影视类型',
                'db_table': 'df_movie_type',
            },
        ),
        migrations.AddField(
            model_name='moviesku',
            name='type',
            field=models.ForeignKey(verbose_name='影视种类', to='movie.MovieType'),
        ),
        migrations.AddField(
            model_name='movieimage',
            name='sku',
            field=models.ForeignKey(verbose_name='影视', to='movie.MovieSKU'),
        ),
        migrations.AddField(
            model_name='indextypemoviesbanner',
            name='sku',
            field=models.ForeignKey(verbose_name='影视SKU', to='movie.MovieSKU'),
        ),
        migrations.AddField(
            model_name='indextypemoviesbanner',
            name='type',
            field=models.ForeignKey(verbose_name='影视类型', to='movie.MovieType'),
        ),
        migrations.AddField(
            model_name='indexmoviesbanner',
            name='sku',
            field=models.ForeignKey(verbose_name='影视', to='movie.MovieSKU'),
        ),
    ]

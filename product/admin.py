from django.contrib import admin

# Register your models here.
from django.contrib import admin
from .models import Product

# TODO: customize list_display, search_fields, etc.
# class ProductAdmin(admin.ModelAdmin):
#     list_display = ('id', 'name', 'price', 'display_order')
#     list_filter = ('warranty',)
#     search_fields = ('name', 'spec_cpu')
# admin.site.register(Product, ProductAdmin)

admin.site.register(Product)

# depo/depo/views.py
# main views file
# 2019-11-30 first version
# 2019-12-01 added display_order sort
# TODO: split into separate apps later

from django.shortcuts import render
from product.models import Product
# from django.http import HttpResponse, JsonResponse
# from django.shortcuts import redirect, get_object_or_404
import os  # not sure if needed but leaving it


# home page view
def home(request):
    # get products from DB
    # products = Product.objects.all()  # old version (no sort)
    products = Product.objects.all().order_by('-display_order', 'id')

    # print(len(products))  # debug - check count
    # print(products)  # debug

    # build context
    data = {}
    data['products'] = products
    # data['title'] = 'Encan Depot'  # not used right now

    # FIXME: this is redundant but works
    context = data

    # render
    # template: depo/templates/index.html
    return render(request, 'index.html', context)


# def products_page(request):
#     # TODO: implement separate products page
#     all_products = Product.objects.all()
#     return render(request, 'products.html', {'products': all_products})


# def cart_page(request):
#     # TODO: implement cart
#     pass

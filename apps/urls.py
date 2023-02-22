from django.urls import path
from rest_framework import routers

from apps import apis

# from apps.apis import ProductRecommendApi, AddToCartAPI, BariKoiAutoCompleteSearchAPI, ssl_redirect, \
#     create_ssl_payment_with_order, create_ssl_payment, ssl_redirect_with_order, createOrder, EditCartAPI
#
router = routers.DefaultRouter()
router.register('user', apis.UserViewSet, basename='all_user')
router.register('order', apis.OrderViewSet, basename='all_blog')
router.register('Vehicle', apis.VehicleViewSet, basename='VehicleViewSet')
router.register('bid', apis.BidViewSet, basename='all_blog')
router.register('history', apis.BidViewSet, basename='history')
router.register('notification', apis.NotificationViewSet, basename='all_blog')
router.register('about', apis.AboutUsViewSet, basename='all_blog')
router.register('brand', apis.BrandViewSet, basename='brand')
# router.register('cook', apis.CookViewSet, basename='cook')
# router.register('settings', apis.SettingsViewSet, basename='banner')
router.register('banner', apis.BannerViewSet, basename='banner')
# router.register('cart', apis.CartViewSet, basename='CartViewSet')
#
# router.register('', , basename='get_price')
# BILL_URLS = {
#     'ssl_redirect': 'ssl/redirect/',
#     'ssl_create': 'ssl/payment/create/',
#     'ssl_create_order': 'ssl/payment/order/create/',
#     'ssl_redirect_order': 'ssl/redirect/order/',
#     'generate_report': 'generate/report/',
#     'order_wise_report': 'order/report/',
#     'get_all_user': 'generate/user/',
#     'product_list': 'generate/product/',
#     'generate_sales_report': 'generate/sales/report/'
# }
#
urlpatterns = [
    #
    path('vehicle/details', apis.getPrice.as_view(), name='old'),
    #     path('auto/complete/search/', BariKoiAutoCompleteSearchAPI.as_view(), name='old'),
    #     path('add/cart/', AddToCartAPI.as_view(), name='old'),
    #     path('edit/cart/', EditCartAPI.as_view(), name='old'),
    #
    #     path('order/print/', apis.printView, name='dash_info'),
    #     path('dashboard/', apis.dashboardView, name='dash_info'),
    #     path('food/all/', apis.FoodAllApi.as_view(), name='FoodAllApi'),
    #     path('create/order/', createOrder.as_view(), name='old'),
    #
    #     path(BILL_URLS['ssl_redirect'], ssl_redirect.as_view()),
    #     path(BILL_URLS['ssl_redirect_order'], ssl_redirect_with_order.as_view()),
    #     path(BILL_URLS['ssl_create_order'], create_ssl_payment_with_order.as_view()),
    #     path(BILL_URLS['ssl_create'], create_ssl_payment.as_view()),
]
#
urlpatterns += router.urls

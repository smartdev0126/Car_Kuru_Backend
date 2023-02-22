# # import boto
# # from boto.s3.key import Key
# # from django.utils.crypto import get_random_string
# # from rest_framework import status
# # from rest_framework.permissions import AllowAny
# # # Create your views here.
# # from rest_framework.response import Response
# # from rest_framework.views import APIView
# #
# # from apps.serializers import *
# # from common.apis import FullViewSet
# #
# #
# import json
# import sys
# import uuid
# from datetime import datetime
# from io import BytesIO
#
# import boto
# import requests
# from PIL import Image
# from boto.s3.connection import S3Connection
# from boto.s3.key import Key
# from django.core.files.uploadedfile import InMemoryUploadedFile
# from django.db.models import Count
# from django.shortcuts import redirect
# from django.shortcuts import render
# from rest_framework import status
# # #
# from rest_framework.exceptions import NotAcceptable
# from rest_framework.permissions import AllowAny
# from rest_framework.views import APIView
#
# from apps.helpers import uis_valid_transaction_order, create_payment_ssl
# from apps.serializers import *
# from common.apis import *
# from common.helpers import set_cache_data, get_cache_data
#
#
from datetime import datetime

from rest_framework.exceptions import NotAcceptable
from rest_framework.permissions import AllowAny
from rest_framework.response import Response
from rest_framework.views import APIView

from apps.models import User, Order, SeasonalPricing, Pricing, Banner, Vehicle, Bid, Notifications, AboutUs, Brand
from apps.serializers import UserSerializer, BannerSerializer, OrderSerializer, VehicleSerializer, BidSerializer, \
    NotificationSerializer, AboutUsSerializer, BrandSerializer
from common.apis import FullViewSet


class UserViewSet(FullViewSet):
    permission_classes = (AllowAny,)
    ObjModel = User
    ObjSerializer = UserSerializer

    def obj_filter(self, request):
        email = request.query_params.get('email')
        password = request.query_params.get('password')
        phone = request.query_params.get('phone')
        login_type = request.query_params.get('login_type')

        # if phone:
        #     users = User.objects.filter(phone=phone)
        #     return users
        # if email:
        #     users = User.objects.filter(email=email)
        #     return users

        #     if len(users) > 0:
        #         return users
        #     else:
        #         User.objects.create(phone=phone)
        #         return User.objects.filter(phone=phone)
        if email and password:
            users = User.objects.filter(email=email, password=password)
            if len(users) > 0:
                return users
            else:
                raise NotAcceptable(detail='Not Found')
        return User.objects.all()
        # if email:
        #     users = User.objects.filter(email=email)
        #     if len(users) > 0:
        #         return users
        #     else:
        #         User.objects.create(email=email)
        #         return User.objects.filter(email=email)


#
# class BlogViewSet(FullViewSet):
#     permission_classes = (AllowAny,)
#     ObjModel = Blog
#     ObjSerializer = BlogSerializer
#
#     def obj_filter(self, request):
#         # email = request.query_params.get('email')
#         # password = request.query_params.get('password')
#         # if email:
#         #     return User.objects.filter(email=email, password=password)
#         return Blog.objects.all()
#
#
# class CartViewSet(FullViewSet):
#     permission_classes = (AllowAny,)
#     ObjModel = Cart
#     ObjSerializer = CartSerializer
#
#     def obj_filter(self, request):
#         device_id = request.query_params.get('device_id')
#         user = request.query_params.get('user')
#         if device_id:
#             return Cart.objects.filter(device_id=device_id, status=0)
#         return Cart.objects.filter(user_id=int(user), status=0)
#
#
# class NotificationViewSet(FullViewSet):
#     permission_classes = (AllowAny,)
#     ObjModel = Notification
#     ObjSerializer = NotificationSerializer
#
#     def obj_filter(self, request):
#         # email = request.query_params.get('email')
#         # password = request.query_params.get('password')
#         # if email:
#         #     return User.objects.filter(email=email, password=password)
#         return Notification.objects.all()
#
#
# class FaqViewSet(FullViewSet):
#     permission_classes = (AllowAny,)
#     ObjModel = Faq
#     ObjSerializer = FaqSerializer
#
#     def obj_filter(self, request):
#         token = request.query_params.get('token')
#         # password = request.query_params.get('password')
#         if token:
#             return Faq.objects.filter(question__contains=token)
#         return Faq.objects.all()
#
#
# class AboutUsViewSet(FullViewSet):
#     permission_classes = (AllowAny,)
#     ObjModel = AboutUs
#     ObjSerializer = AboutUsSerializer
#
#     def obj_filter(self, request):
#         return AboutUs.objects.all()
#
#
# class ProductRecommendApi(APIView):
#     permission_classes = (AllowAny,)
#
#     def post(self, request, format=None):
#         raw_image = request.FILES['file']
#         print('333')
#         im = Image.open(raw_image)
#         im = im.convert('RGB')
#         output = BytesIO()
#         # Resize/modify the media
#         # im = im.resize((300, 100))
#         im.thumbnail((800, 800), Image.ANTIALIAS)
#         # after modifications, save it to the output
#         im.save(output, format='JPEG', quality=90)
#         output.seek(0)
#         # change the imagefield value to be the newley modifed media value
#         raw_image = InMemoryUploadedFile(output, 'ImageField', "%s.jpg" % raw_image.name.split('.')[0], 'media/jpeg',
#                                          sys.getsizeof(output), None)
#
#         AWS_ACCESS_KEY_ID = 'AKIA525KOWYZORCTEKVY'
#         AWS_SECRET_ACCESS_KEY = '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'
#         AWS_STORAGE_BUCKET_NAME = 'bite-list'
#         AWS_REGION_NAME = 'us-east-1'
#         conn = boto.s3.connect_to_region(AWS_REGION_NAME,
#                                          aws_access_key_id=AWS_ACCESS_KEY_ID,
#                                          aws_secret_access_key=AWS_SECRET_ACCESS_KEY,
#                                          is_secure=True,  # uncomment if you are not using ssl
#                                          calling_format=boto.s3.connection.OrdinaryCallingFormat(),
#                                          )
#
#         bucket = conn.get_bucket(AWS_STORAGE_BUCKET_NAME)
#
#         # go through each version of the file
#
#         # create a key to keep track of our file in the storage
#
#         k = Key(bucket)
#         k.key = get_random_string(length=10) + raw_image.name.replace(' ', '')
#
#         k.set_contents_from_file(raw_image)
#
#         # we need to make it public so it can be accessed publicly
#
#         # using a URL like http://s3.amazonaws.com/bucket_name/key
#
#         k.make_public()
#         url = 'https://' + AWS_STORAGE_BUCKET_NAME + '.s3.amazonaws.com/' + k.key
#         return Response({'url': str(url)},
#                         status=status.HTTP_201_CREATED)
#
#
# class BariKoiAutoCompleteSearchAPI(APIView):
#     permission_classes = (AllowAny,)
#
#     def get(self, request, format=None):
#         q = request.query_params.get('q')
#
#         x = requests.get('https://barikoi.xyz/v1/api/search/autocomplete/MjgyNzpNUVRPMVpXQjdG/place?q=' + q)
#         print(x.text)
#         return Response(json.loads(x.text),
#                         status=status.HTTP_201_CREATED)
#
#
# class AddToCartAPI(APIView):
#     permission_classes = (AllowAny,)
#
#     def post(self, request, format=None):
#         quantity = request.POST.get("quantity", None)
#         if_canceled = request.POST.get("if_canceled", "")
#         instruction = request.POST.get("instruction", "")
#         food = request.POST.get("food", None)
#         add_on = request.POST.get("add_on", "")
#         sides = request.POST.get("sides", "")
#         device_id = request.POST.get("device_id", "")
#         user = request.POST.get("user", None)
#         total_price = request.POST.get("total_price", None)
#         selected_food = Food.objects.get(id=int(food))
#
#         if quantity is None:
#             quantity = "0"
#
#         if user is None:
#
#             cart = Cart.objects.create(quantity=quantity,
#                                        if_canceled=if_canceled, instruction=instruction,
#                                        food_id=int(food), device_id=device_id, )
#         else:
#
#             cart = Cart.objects.create(quantity=quantity, if_canceled=if_canceled,
#                                        instruction=instruction,
#                                        food_id=int(food), user_id=int(user))
#         for add in json.loads(add_on):
#             try:
#                 ad = AddOn.objects.get(id=add)
#             except:
#                 raise NotAcceptable(detail='Addon not found !')
#
#             cart.add_on.add(ad)
#
#         for side in json.loads(sides):
#             side = Food.objects.get(id=side)
#             cart.sides.add(side)
#
#         cart.total_price = total_price
#         cart.save()
#         return Response(CartSerializer(cart).data,
#                         status=status.HTTP_201_CREATED)
#
#
# class EditCartAPI(APIView):
#     permission_classes = (AllowAny,)
#
#     def post(self, request, format=None):
#         quantity = request.POST.get("quantity", None)
#         cart_id = request.POST.get("cart", None)
#         cart = Cart.objects.get(id=int(cart_id))
#         total_price = 0
#         if quantity is None:
#             quantity = "0"
#
#         for ad in cart.add_on.all():
#             total_price = total_price + ad.price
#         for side in cart.sides.all():
#             total_price = total_price + side.price
#         total_price = total_price + cart.food.price * int(quantity)
#         cart.total_price = total_price
#         cart.quantity = quantity
#         cart.save()
#         return Response(CartSerializer(cart).data,
#                         status=status.HTTP_201_CREATED)
#
#
# class CookViewSet(FullViewSet):
#     permission_classes = (AllowAny,)
#     ObjModel = Cook
#     ObjSerializer = CookSerializer
#
#     def obj_filter(self, request):
#         return Cook.objects.all()
#
#
# #
class OrderViewSet(FullViewSet):
    permission_classes = (AllowAny,)
    ObjModel = Order
    ObjSerializer = OrderSerializer

    def obj_filter(self, request):
        user_id = request.query_params.get('id')
        # password = request.query_params.get('password')
        if user_id:
            return Order.objects.filter(user__id=int(user_id))
        return Order.objects.all()


class BrandViewSet(FullViewSet):
    permission_classes = (AllowAny,)
    ObjModel = Brand
    ObjSerializer = BrandSerializer

    def obj_filter(self, request):
        # user_id = request.query_params.get('id')
        # # password = request.query_params.get('password')
        # if user_id:
        #     return Order.objects.filter(user__id=int(user_id))
        return Brand.objects.all()


class NotificationViewSet(FullViewSet):
    permission_classes = (AllowAny,)
    ObjModel = Notifications
    ObjSerializer = NotificationSerializer

    def obj_filter(self, request):
        user_id = request.query_params.get('user')
        # password = request.query_params.get('password')
        if user_id:
            return Notifications.objects.filter(user__id=int(user_id))
        return Notifications.objects.all()


class AboutUsViewSet(FullViewSet):
    permission_classes = (AllowAny,)
    ObjModel = AboutUs
    ObjSerializer = AboutUsSerializer

    def obj_filter(self, request):
        # user_id = request.query_params.get('user')
        # # password = request.query_params.get('password')
        # if user_id:
        #     return Notifications.objects.filter(user__id=int(user_id))
        return AboutUs.objects.all()


class VehicleViewSet(FullViewSet):
    permission_classes = (AllowAny,)
    ObjModel = Vehicle
    ObjSerializer = VehicleSerializer

    def obj_filter(self, request):
        user_id = request.query_params.get('id')
        text = request.query_params.get('text')
        category = request.query_params.get('category')
        brand = request.query_params.get('brand')
        group = request.query_params.get('group')
        if user_id:
            return Vehicle.objects.filter(user__id=int(user_id))
        if text:
            return Vehicle.objects.filter(title__contains=text)
        if brand:
            return Vehicle.objects.filter(brand__id=int(brand))
        if category:
            return Vehicle.objects.filter(category__id=int(category))
        if group:
            return Vehicle.objects.filter(group=int(group))
        return Vehicle.objects.all()


class BidViewSet(FullViewSet):
    permission_classes = (AllowAny,)
    ObjModel = Bid
    ObjSerializer = BidSerializer

    def obj_filter(self, request):
        user_id = request.query_params.get('user')
        vehi = request.query_params.get('vehicle')
        if vehi:
            return Bid.objects.filter(vehicle__id=int(vehi))
        if user_id:
            return Bid.objects.filter(user__id=int(user_id))
        return Bid.objects.all()


# #
# # class OrderDetailsViewSet(FullViewSet):
# #     permission_classes = (AllowAny,)
# #     ObjModel = Request
# #     # ObjSerializer = RequestDetailsSerializer
# #
# #     # def obj_filter(self, request):
# #     #     status = request.query_params.get('status')
# #     #     user = request.query_params.get('user')
# #     #     payment = request.query_params.get('payment')
# #     #     if payment:
# #     #         if int(payment)==1:
# #     #             return Order.objects.filter(creator_id=int(user), payment_collected=True)
# #     #         else:
# #     #             return Order.objects.filter(creator_id=int(user), payment_collected=False)
# #     #
# #     #     if user:
# #     #         return Order.objects.filter(creator_id=int(user))
# #     #     if status and user:
# #     #         return Order.objects.filter(creator_id=int(user), status=int(status))
# #     #     return Order.objects.all()
# #
# #
# # class AppInfoViewSet(FullViewSet):
# #     permission_classes = (AllowAny,)
# #     ObjModel = AppInfo
# #     ObjSerializer = AppInfoSerializer
# #
# #     def obj_filter(self, request):
# #         return AppInfo.objects.all()
# #
# #
# # class FAQViewSet(FullViewSet):
# #     permission_classes = (AllowAny,)
# #     ObjModel = FAQ
# #     ObjSerializer = FAQSerializer
# #
# #     def obj_filter(self, request):
# #         return FAQ.objects.all()
# #
# #
# # # class VoucherViewSet(FullViewSet):
# # #     permission_classes = (AllowAny,)
# # #     ObjModel = Voucher
# # #     ObjSerializer = VoucherSerializer
# # #
# # #     def obj_filter(self, request):
# # #         code = request.query_params.get('code')
# # #         # password = request.query_params.get('password')
# # #         if code:
# # #             vouchers = Voucher.objects.filter(code__exact=code)
# # #             if len(vouchers) > 0:
# # #                 return Voucher.objects.filter(code__exact=code)
# # #         c
# #
# #
# # # class RaceCategoryViewSet(FullViewSet):
# # #     permission_classes = (AllowAny,)
# # #     ObjModel = RaceCategory
# # #     ObjSerializer = RaceCategorySerializer
# # #
# # #     def obj_filter(self, request):
# # #         return RaceCategory.objects.all()
# # #
# # #
# # # class EntrantViewSet(FullViewSet):
# # #     permission_classes = (AllowAny,)
# # #     ObjModel = Entrant
# # #     ObjSerializer = EntrantSerializer
# # #
# # #     def obj_filter(self, request):
# # #         return Entrant.objects.all()
# # #
# # #
class BannerViewSet(FullViewSet):
    permission_classes = (AllowAny,)
    ObjModel = Banner
    ObjSerializer = BannerSerializer

    def obj_filter(self, request):
        return Banner.objects.all()


# # #
# # # class SettingViewSet(FullViewSet):
# # #     permission_classes = (AllowAny,)
# # #     ObjModel = Setting
# # #     ObjSerializer = SettingSerializer
# # #
# # #     def obj_filter(self, request):
# # #         return Setting.objects.all()
# # #
# # #
# # # #
# # # class SponsorViewSet(FullViewSet):
# # #     permission_classes = (AllowAny,)
# # #     ObjModel = Sponsor
# # #     ObjSerializer = SponsorSerializer
# # #
# # #     def obj_filter(self, request):
# # #         return Sponsor.objects.all()
# # #
# # #
# # # #
# # # #
# # # class NewViewSet(FullViewSet):
# # #     permission_classes = (AllowAny,)
# # #     ObjModel = New
# # #     ObjSerializer = NewSerializer
# # #
# # #     def obj_filter(self, request):
# # #         return New.objects.all()
# #
# # #
# # #
# # # class VideoViewSet(FullViewSet):
# # #     permission_classes = (AllowAny,)
# # #     ObjModel = Video
# # #     ObjSerializer = VideoSerializer
# # #
# # #     def obj_filter(self, request):
# # #         token = request.query_params.get('token')
# # #         category = request.query_params.get('category')
# # #         user = request.query_params.get('user')
# # #         if token:
# # #             return Video.objects.filter(Q(title__contains=token) | Q(description__contains=token))
# # #         elif category:
# # #             return Video.objects.filter(category_id=int(category))
# # #         elif user:
# # #             return Video.objects.filter(user_id=int(user))
# # #
# # #         return Video.objects.all()
# # # class LiveScoreViewSet(FullViewSet):
# # #     permission_classes = (AllowAny,)
# # #     ObjModel = LiveScore
# # #     ObjSerializer = LiveScoreSerializer
# # #
# # #     def obj_filter(self, request):
# # #         return LiveScore.objects.all()
# # #
# # #
# # # class ChatPostViewSet(FullViewSet):
# # #     permission_classes = (AllowAny,)
# # #     ObjModel = Chat
# # #     ObjSerializer = ChatPostSerializer
# # #
# # #     def obj_filter(self, request):
# # #         return Chat.objects.all()
# # #
# # #
# # # class ChatViewSet(FullViewSet):
# # #     permission_classes = (AllowAny,)
# # #     ObjModel = Chat
# # #     ObjSerializer = ChatSerializer
# # #
# # #     def obj_filter(self, request):
# # #         return Chat.objects.all()
# # #
# # #
# # # class FeedCommentViewSet(FullViewSet):
# # #     permission_classes = (AllowAny,)
# # #     ObjModel = FeedComment
# # #     ObjSerializer = FeedCommentSerializer
# # #
# # #     def obj_filter(self, request):
# # #         return FeedComment.objects.all()
# # #
# # # class FeedCommentPostViewSet(FullViewSet):
# # #     permission_classes = (AllowAny,)
# # #     ObjModel = FeedComment
# # #     ObjSerializer = FeedCommentPostSerializer
# # #
# # #     def obj_filter(self, request):
# # #         return FeedComment.objects.all()
# # # #
# # # class NotificationiewSet(FullViewSet):
# # #     permission_classes = (AllowAny,)
# # #     ObjModel = Notification
# # #     ObjSerializer = NotificationSerializer
# # #
# # #     def obj_filter(self, request):
# # #         return Notification.objects.all()
# # #
# # #
# # # #
# # # class FeedViewSetPost(FullViewSet):
# # #     permission_classes = (AllowAny,)
# # #     ObjModel = Feed
# # #     ObjSerializer = FeedPostSerializer
# # #
# # #     def obj_filter(self, request):
# # #         return Feed.objects.all()
# # #
# # #
# class CategoryViewSet(FullViewSet):
#     permission_classes = (AllowAny,)
#     ObjModel = Category
#     ObjSerializer = CategorySerializer
#
#     def obj_filter(self, request):
#         return Category.objects.all()
#
#
# class BannerViewSet(FullViewSet):
#     permission_classes = (AllowAny,)
#     ObjModel = Banner
#     ObjSerializer = BannerSerializer
#
#     def obj_filter(self, request):
#         return Banner.objects.all()
#
#
# class SettingsViewSet(FullViewSet):
#     permission_classes = (AllowAny,)
#     ObjModel = Settings
#     ObjSerializer = SettingsSerializer
#
#     def obj_filter(self, request):
#         return Settings.objects.all()
#
#
# class FoodViewSet(FullViewSet):
#     permission_classes = (AllowAny,)
#     ObjModel = Food
#     ObjSerializer = FoodSerializer
#
#     def obj_filter(self, request):
#         category = request.query_params.get('category')
#         group = request.query_params.get('group')
#         foods = None
#         if category:
#             foods = Food.objects.filter(category_id=int(category))
#         if group:
#             foods = Food.objects.filter(group=int(group))
#         if foods is None:
#             if get_cache_data(None):
#                 foods = get_cache_data(None)
#             else:
#                 set_cache_data(None, foods)
#                 foods = Food.objects.all()[:20]
#         return foods
#
#
# #
# # #
# # #
# # # class ThreadViewSet(FullViewSet):
# # #     permission_classes = (AllowAny,)
# # #     ObjModel = Thread
# # #     ObjSerializer = ThreadSerializer
# # #
# # #     def obj_filter(self, request):
# # #         user_id = request.query_params.get('user')
# # #         if user_id:
# # #             return Thread.objects.filter(Q(user_one_id=int(user_id)) | Q(user_two_id=int(user_id)))
# # #         return Thread.objects.all()
# # #
# # #
# # # class MessageViewSet(FullViewSet):
# # #     permission_classes = (AllowAny,)
# # #     ObjModel = Message
# # #     ObjSerializer = MessageSerializer
# # #
# # #     def obj_filter(self, request):
# # #         thread_id = request.query_params.get('thread')
# # #         if thread_id:
# # #             return Message.objects.filter(Q(thread_id=int(thread_id)))
# # #         return Message.objects.all()
# # #
# # #
# # # class EntrantImageViewSet(FullViewSet):
# # #     permission_classes = (AllowAny,)
# # #     ObjModel = EntrantImage
# # #     ObjSerializer = EntrantImageSerializer
# # #
# # #     def obj_filter(self, request):
# # #         return EntrantImage.objects.all()
# # #
# # #
# # # class ShopOrderViewSet(FullViewSet):
# # #     permission_classes = (AllowAny,)
# # #     ObjModel = ShopOrder
# # #     ObjSerializer = ShopOrderSerializer
# # #
# # #     def obj_filter(self, request):
# # #         return ShopOrder.objects.all()
# # #
# # #
# # # class RaceLevelsViewSet(FullViewSet):
# # #     permission_classes = (AllowAny,)
# # #     ObjModel = RaceLevels
# # #     ObjSerializer = RaceLevelSerializer
# # #
# # #     def obj_filter(self, request):
# # #         return RaceLevels.objects.all()
# # #
# # #
# # # #
# # # #
# # # class ShopViewSet(FullViewSet):
# # #     permission_classes = (AllowAny,)
# # #     ObjModel = Shop
# # #     ObjSerializer = ShopSerializer
# # #
# # #     def obj_filter(self, request):
# # #         return Shop.objects.all()
# # #
# # #
# # # #
# # # #
# # # class ContactUViewSet(FullViewSet):
# # #     permission_classes = (AllowAny,)
# # #     ObjModel = ContactU
# # #     ObjSerializer = ContactUSerializer
# # #
# # #     def obj_filter(self, request):
# # #         return ContactU.objects.all()
# # #
# # #
# # # #
# # # # class VideoCategoryViewSet(FullViewSet):
# # # #     permission_classes = (AllowAny,)
# # # #     ObjModel = VideoCategory
# # # #     ObjSerializer = VideoCategorySerializer
# # # #
# # # #     def obj_filter(self, request):
# # # #         return VideoCategory.objects.all()
# # # #
# # # # class VideoTagViewSet(FullViewSet):
# # # #     permission_classes = (AllowAny,)
# # # #     ObjModel = VideoTag
# # # #     ObjSerializer = VideoTagSerializer
#
#
# # # #
# # # #
# # # # class FighterViewSet(FullViewSet):
# # # #     permission_classes = (AllowAny,)
# # # #     ObjModel = Fighter
# # # #     ObjSerializer = FighterSerializer
# # # #
# # # #     def obj_filter(self, request):
# # # #         user_id = request.query_params.get('user')
# # # #         if user_id:
# # # #             return Fighter.objects.filter(user_id=int(user_id))
# # # #         return Fighter.objects.all()
# # # #
# # # #
# # # # #
# # # # # class BlogViewSet(FullViewSet):
# # # # #     permission_classes = (AllowAny,)
# # # # #     ObjModel = Blog
# # # # #     ObjSerializer = BlogSerializer
# # # # #
# # # # #     def obj_filter(self, request):
# # # # #         return helpers.blog_filter(self, request)
# # # # #
# # # # # class BlogList(APIView):
# # # # #     permission_classes = (AllowAny,)
# # # # #
# # # # #     def get(self, request, format=None):
# # # # #         category = request.query_params.get('category')
# # # # #         email = request.query_params.get('email')
# # # # #         if category is not None:
# # # # #             blogs = Blog.objects.filter(category_id=int(category))
# # # # #         else:
# # # # #             blogs = Blog.objects.all()
# # # # #         print(blogs)
# # # # #         my_objects = BlogSerializer(
# # # # #             blogs,
# # # # #             many=True,
# # # # #             context={'email': email}
# # # # #         ).data
# # # # #         return JsonResponse(my_objects, status=200, safe=False)
# # # # #
# # # # #
# # # # class SocialLogin(APIView):
# # # #     permission_classes = (AllowAny,)
# # # #
# # # #     def get(self, request, format=None):
# # # #
# # # #         email = request.query_params.get('email')
# # # #         name = request.query_params.get('name')
# # # #         type = request.query_params.get('type')
# # # #         image = request.query_params.get('image')
# # # #         users = User.objects.filter(email=email,type=int(type))
# # # #         if len(users) > 0:
# # # #             return JsonResponse(model_to_dict(users[0]))
# # # #         else:
# # # #             user = User.objects.create(name=name, email=email, image_url=image,type=int(type), signup_method=2)
# # # #             return JsonResponse(model_to_dict(user))
# # # #
# # # #
# # # # class SendMessage(APIView):
# # # #     permission_classes = (AllowAny,)
# # # #
# # # #     def get(self, request, format=None):
# # # #
# # # #         sender_id = request.query_params.get('sender')
# # # #         receiver_id = request.query_params.get('receiver')
# # # #         text = request.query_params.get('text')
# # # #         attachment = request.query_params.get('attachment')
# # # #
# # # #         threads = Thread.objects.filter(
# # # #             Q(user_one_id=int(sender_id), user_two_id=int(receiver_id)) | Q(user_one_id=int(receiver_id),
# # # #                                                                             user_two_id=int(sender_id)))
# # # #         if len(threads) > 0:
# # # #             message = Message.objects.create(sender_id=int(sender_id), text=text, attachment=attachment,
# # # #                                              thread=threads[0])
# # # #             return JsonResponse(model_to_dict(message))
# # # #         else:
# # # #             new_thread = Thread.objects.create(user_one_id=int(sender_id), user_two_id=int(receiver_id))
# # # #
# # # #             message = Message.objects.create(sender_id=int(sender_id), text=text, attachment=attachment,
# # # #                                              thread=new_thread)
# # # #             return JsonResponse(model_to_dict(message))
# # # #
# # # #
# # # # class MobileLogin(APIView):
# # # #     permission_classes = (AllowAny,)
# # # #
# # # #     def get(self, request, format=None):
# # # #
# # # #         phone = request.query_params.get('phone')
# # # #         type = request.query_params.get('type')
# # # #         users = User.objects.filter(phone=phone,type=int(type))
# # # #         if len(users) > 0:
# # # #             return JsonResponse(model_to_dict(users[0]))
# # # #         else:
# # # #             user = User.objects.create(phone=phone, signup_method=2,type=int(type))
# # # #             return JsonResponse(model_to_dict(user))
# # # #
# # # #
# # #
# # # class PostCommentSet(FullViewSet):
# # #     permission_classes = (AllowAny,)
# # #     ObjModel = LiveComment
# # #     ObjSerializer = LiveCommentPostSerializer
# # #
# # #     def obj_filter(self, request):
# # #         return LiveComment.objects.all()
# # #
# # #
# # # class LiveCommentSet(FullViewSet):
# # #     permission_classes = (AllowAny,)
# # #     ObjModel = LiveComment
# # #     ObjSerializer = LiveCommentSerializer
# # #
# # #     def obj_filter(self, request):
# # #         return LiveComment.objects.all()
# #
# #
# # class simple_upload(APIView):
# #     permission_classes = (AllowAny,)
# #
# #     def post(self, request, format=None):
# #         if request.method == 'POST' and request.FILES['file']:
# #             raw_image = request.FILES['file']
# #
# #             AWS_ACCESS_KEY_ID = 'AKIATFMQCO22WBHAR675'
# #             AWS_SECRET_ACCESS_KEY = '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'
# #             AWS_STORAGE_BUCKET_NAME = 'sheershares'
# #
# #             conn = boto.s3.connect_to_region('us-west-2',
# #                                              aws_access_key_id=AWS_ACCESS_KEY_ID,
# #                                              aws_secret_access_key=AWS_SECRET_ACCESS_KEY,
# #                                              is_secure=True,  # uncomment if you are not using ssl
# #                                              calling_format=boto.s3.connection.OrdinaryCallingFormat(),
# #                                              )
# #
# #             bucket = conn.get_bucket(AWS_STORAGE_BUCKET_NAME)
# #
# #             # go through each version of the file
# #
# #             # create a key to keep track of our file in the storage
# #
# #             k = Key(bucket)
# #             k.key = get_random_string(length=10) + raw_image.name.replace(' ', '')
# #
# #             k.set_contents_from_file(raw_image)
# #
# #             # we need to make it public so it can be accessed publicly
# #
# #             # using a URL like http://s3.amazonaws.com/bucket_name/key
# #
# #             k.make_public()
# #             url = 'https://sheershares.s3-us-west-2.amazonaws.com/' + k.key
# #             return Response({'url': str(url)},
# #                             status=status.HTTP_201_CREATED)
# #
# #
# # #
# # class PreOrderDetails(APIView):
# #     permission_classes = (AllowAny,)
# #
# #     def get(self, request, format=None):
# #         return
# #         # data = {
# #         #     'area': DeliveryAreaSerializer(Area.objects.all(), many=True).data,
# #         #     'parcel_type': ParcelTypeSerializer(ParcelType.objects.all(), many=True).data,
# #         #     'delivery_type': DeliveryTypeSerializer(VehicleType.objects.all(), many=True).data,
# #         # }
# #         # return JsonResponse(data)
# #
# #
# # # class DashInfo(APIView):
# # #     permission_classes = (AllowAny,)
# # #
# # #     def get(self, request, format=None):
# # #         user_id = request.query_params.get('user')
# # #         if user_id is None:
# # #             raise NotAcceptable(detail='No user id found !')
# # #         orders = Order.objects.filter(creator_id=int(user_id))
# # #
# # #         # "Created": 1,
# # #         # "On Hub": 2,
# # #         # "On The Way": 3,
# # #         # "Delivered": 4,
# # #         # "Canceled": 5,
# # #         pending = 0
# # #         on_the_way = 0
# # #         delivered = 0
# # #         canceled = 0
# # #         pay_due = 0
# # #         pay_done = 0
# # #
# # #         for order in orders:
# # #             if order.status == 1:
# # #                 pending += 1
# # #             elif order.status == 3:
# # #                 on_the_way += 1
# # #             elif order.status == 4:
# # #                 delivered += 1
# # #             elif order.status == 5:
# # #                 canceled += 1
# # #
# # #             if order.payment_collected:
# # #                 pay_done += order.amount_to_be_collected
# # #             else:
# # #                 pay_due += order.amount_to_be_collected
# # #
# # #         data = {
# # #             'pending': pending,
# # #             'on_the_way': on_the_way,
# # #             'delivered': delivered,
# # #             'canceled': canceled,
# # #             'pay_done': pay_done*1.0,
# # #             'pay_due': pay_due*1.0,
# # #         }
# # #         return JsonResponse(data)
# # #
# # #
# # #
# # #
# # # class HomeVideoApi(APIView):
# # #     permission_classes = (AllowAny,)
# # #
# # #     def get(self, request, format=None):
# # #         all_cateogories = VideoCategory.objects.all()
# # #         response = []
# # #         for category in all_cateogories:
# # #             videos = Video.objects.filter(category=category)
# # #             video_res = []
# # #             for video in videos:
# # #                 video_res.append(VideoSerializer(video).data)
# # #                 print(video_res)
# # #             response.append(
# # #                 {"category_id": category.id, "category_name": category.name,
# # #                  "videos": video_res})
# # #
# # #         return Response(data=response)
# # #
# # #
class getPrice(APIView):
    permission_classes = (AllowAny,)

    def get(self, request, format=None):
        vehicle_id = request.query_params.get('id')

        vehicle = Vehicle.objects.get(id=int(vehicle_id))
        data=VehicleSerializer(vehicle).data
        data['avg_bid']=0
        return Response(data={"vehicle": data, 'bids': BidSerializer(Bid.objects.filter(vehicle=vehicle),many=True).data})

        # user_order_count = Order.objects.filter(user_id=int(user_id))
        # sp = SeasonalPricing.objects.filter(is_active=True, start_time__gte=datetime.now(),
        #                                     end_time__lte=datetime.now())
        # if len(sp) > 1:
        #
        # else:
        #     rp = Pricing.objects.all().last()
        #     if rp.is_discount_active:
        #         print(rp.discount_hourly_price)
        #         print(user_order_count)
        #         if rp.discount_order_limit <= len(user_order_count):
        #             return Response(data={"price": rp.discount_hourly_price})
        #         else:
        #             return Response(data={"price": rp.per_hour_price})
        #     else:
        #         return Response(data={"price": rp.per_hour_price})

# # #
# # # class ProductOrderView(APIView):
# # #     permission_classes = (AllowAny,)
# # #
# # #     def get(self, request, format=None):
# # #         user_id = request.query_params.get('user')
# # #         products = request.query_params.get('products')
# # #         address = request.query_params.get('address')
# # #         note = request.query_params.get('note')
# # #         payment_info = request.query_params.get('payment_info')
# # #
# # #         user = User.objects.get(id=int(user_id))
# # #         total_price = 0
# # #         order = ProductOrder.objects.create(user=user, note=note, payment_info=payment_info, address=address)
# # #         for product_id in json.loads(products):
# # #             product = Product.objects.get(id=int(product_id))
# # #             total_price = total_price + product.price
# # #             order.products.add(product)
# # #         order.total_price = total_price
# # #         order.save()
# # #
# # #         return Response(data=ProductOrderSerializer(order).data)
# # #
# # # # class BlogLike(APIView):
# # # #     permission_classes = (AllowAny,)
# # # #
# # # #     def get(self, request, format=None):
# # # #
# # # #         email = request.query_params.get('email')
# # # #         blog_id = request.query_params.get('blog')
# # # #
# # # #         try:
# # # #             user = User.objects.get(email=email)
# # # #             blog = Blog.objects.get(id=int(blog_id))
# # # #             like_list = Like.objects.filter(user=user, blog=blog)
# # # #             if len(like_list) > 0:
# # # #                 like_list.delete()
# # # #
# # # #             else:
# # # #                 like = Like.objects.create(user=user, blog=blog)
# # # #
# # # #             return JsonResponse(BlogSerializer(blog).data, status=200, safe=False)
# # # #         except Exception as e:
# # # #             raise NotAcceptable(detail='User or Blog Not Found !'+str(e))
# # # # class FavList(APIView):
# # # #     permission_classes = (AllowAny,)
# # # #
# # # #     def get(self, request, format=None):
# # # #
# # # #         email = request.query_params.get('email')
# # # #
# # # #         result=[]
# # # #         try:
# # # #             user = User.objects.get(email=email)
# # # #
# # # #             like_list = Like.objects.filter(user=user)
# # # #             for b in like_list:
# # # #                 result.append(b.blog)
# # # #
# # # #             return JsonResponse(BlogSerializer(result,many=True).data, status=200, safe=False)
# # # #         except Exception as e:
# # # #             raise NotAcceptable(detail='User or Blog Not Found !'+str(e))
# # def printView(request):
# #     return
# #     # id = request.GET.get('id')
# #     # order = Order.objects.get(pk=int(id))
# #     #
# #     # context = {
# #     #     'order': order,
# #     #
# #     # }
# #     #
# #     # return render(request, 'print.html', context)
#
#
# class create_ssl_payment(APIView):
#     permission_classes = (AllowAny,)
#
#     def post(self, request, format=None):
#
#         """
#         Sample Submit:
#         ---
#             {
#                 'amount': 2,
#             }
#         """
#         # others = ProductRecommendation.objects.filter(main_product=60)
#         # others.delete()
#         serializer = SSLCreateSerializer(data=request.data)
#         user = request.user
#
#         if serializer.is_valid():
#             payment_log = create_payment_ssl(serializer.data, user)
#             ssl_url = {
#                 'GatewayPageURL': payment_log['GatewayPageURL']
#             }
#
#             return Response(ssl_url, status=200)
#         else:
#             return Response(serializer.errors, status=400)
#
#
# class create_ssl_payment_with_order(APIView):
#     permission_classes = (AllowAny,)
#
#     def post(self, request, format=None):
#         """
#         Sample Submit:
#         ---
#             {
#                 'amount': 2,
#                 'order': 2,
#                 'preorder': 2,
#             }
#
#         """
#         order_serializer = SSLOrderCreateSerializer(data=request.data)
#         pre_order_serializer = SSLPreOrderCreateSerializer(data=request.data)
#
#         if order_serializer.is_valid():
#             amount = order_serializer.data['amount']
#             order_id = order_serializer.data['order']
#             preorder_id = None
#         else:
#             raise NotAcceptable
#
#         payment_uid = str(uuid.uuid4())
#         vendor_uid = str(uuid.uuid4())
#         if order_id or preorder_id:
#             if order_id:
#                 order_qs = OrderDetails.objects.filter(id=int(order_id))
#                 if order_qs.exists():
#                     order = order_qs[0]
#                     payment = Payment.objects.create(
#                         order_id=order.id,
#                         gateway=1,
#                         user=order.ordered_by,
#                         vendor_uid=vendor_uid,
#                         payment_uid=payment_uid,
#                         amount=amount,
#                     )
#
#                     value_a = str(amount) + '<#>' + str(order.id) + '<#>' + payment_uid
#                     url = SSL_CONF["create_url_ssl"]
#                     payload = {
#                         'store_id': SSL_CONF['store_id'],
#                         'store_passwd': SSL_CONF['store_passwd'],
#                         'total_amount': float(amount),
#                         'currency': 'BDT',
#                         'tran_id': str(uuid.uuid4()),
#                         'success_url': SSL_REDIRECT_URL_ORDER,
#                         'fail_url': SSL_REDIRECT_URL_ORDER + '?status=failed',
#                         'cancel_url': SSL_REDIRECT_URL_ORDER + '?status=canceled',
#                         'cus_name': order.ordered_by.name,
#                         'cus_email': order.ordered_by.email,
#                         'cus_phone': order.ordered_by.phone,
#                         'value_a': value_a,
#                     }
#                     response = requests.post(url, data=payload)
#                     payment_log = response.json()
#                     ssl_url = {
#                         'GatewayPageURL': payment_log['GatewayPageURL']
#                     }
#                     return Response(ssl_url, status=200)
#         else:
#             raise NotAcceptable(detail="Order Id or Pre Order ID Not Found !")
#
#
# class ssl_redirect_with_order(APIView):
#     permission_classes = (AllowAny,)
#
#     def post(self, request, format=None):
#         # print(request.POST)
#         value_a = request.POST.get('value_a', False)
#         val_id = request.POST.get('val_id', False)
#         amount, user_id, payment_uid = value_a.split('<#>')
#         try:
#             payment = Payment.objects.get(payment_uid=payment_uid)
#             payment.state = PAYMENT_STATUS_DICT['Created']
#             payment.save()
#             if uis_valid_transaction_order(val_id, payment_uid):
#                 return redirect(
#                     'https://api.biteclubbd.com/v0/ssl/success?val_id=' + val_id + '&payment_uid=' + payment_uid)
#             else:
#                 return redirect(
#                     'https://api.biteclubbd.com/v0/ssl/' + '?status=failed')
#
#         except Exception as e:
#             raise NotAcceptable(str(e))
#
#
# class ssl_redirect(APIView):
#     permission_classes = (AllowAny,)
#
#     def post(self, request, format=None):
#         # print(request.POST)
#         value_a = request.POST.get('value_a', False)
#         val_id = request.POST.get('val_id', False)
#         amount, user_id, payment_uid = value_a.split('<#>')
#         try:
#             payment = Payment.objects.get(payment_uid=payment_uid)
#             payment.state = PAYMENT_STATUS_DICT['Created']
#             payment.save()
#             return redirect(
#                 'https://api.biteclubbd.com/v0/billing/ssl/success?val_id=' + val_id + '&payment_uid=' + payment_uid)
#         except:
#             return redirect(
#                 'https://api.biteclubbd.com/v0/billing/ssl/' + '?status=failed')
#
#
# class OrderDetailsViewSet(FullViewSet):
#     permission_classes = (AllowAny,)
#     ObjModel = OrderDetails
#     ObjSerializer = OrderSerializerCustomer
#
#     def obj_filter(self, request):
#         id = request.query_params.get('user')
#         # password = request.query_params.get('password')
#         if id:
#             return OrderDetails.objects.filter(ordered_by_id=int(id))
#         return OrderDetails.objects.all()
#
#
# class createOrder(APIView):
#     permission_classes = (AllowAny,)
#
#     def post(self, request, format=None):
#         try:
#             total_bill = 0
#             cart = request.POST.get('cart', False)
#             user = request.POST.get('user')
#             note = request.POST.get('note')
#             address = request.POST.get('address')
#             lat = request.POST.get('lat')
#             lng = request.POST.get('lng')
#             order = OrderDetails.objects.create(status=1, delivery_charge=29)
#             for c in json.loads(cart):
#                 cart_item = Cart.objects.get(id=c)
#                 order.cart.add(cart_item)
#                 cart_item.status = 2
#                 cart_item.save()
#                 total_bill = total_bill + cart_item.total_price
#                 print(cart_item.total_price)
#                 print(str(total_bill))
#             order.final_bill = total_bill
#             order.recipient_address = address
#             order.total_bill = total_bill
#             user = User.objects.get(id=int(user))
#             order.ordered_by = user
#             order.recipient_lat = lat
#             order.recipient_lng = lng
#             order.recipient_name = user.name
#             order.recipient_phone = user.phone
#             order.note = note
#             order.save()
#
#             return Response(OrderSerializerCustomer(order).data, status=200)
#         except Exception as e:
#             raise NotAcceptable(str(e))
#
#
# class FoodAllApi(APIView):
#     permission_classes = (AllowAny,)
#
#     def get(self, request, format=None):
#         try:
#             category = request.query_params.get('category')
#             group = request.query_params.get('group')
#             res = None
#             if category:
#
#                 if get_cache_data('category' + category):
#                     res = get_cache_data('category' + category)
#                 else:
#                     foods = Food.objects.filter(category_id=int(category))
#                     res = FoodSerializer(foods, many=True).data
#                     set_cache_data('category' + category, res)
#
#             if group:
#                 print('group' + group)
#                 if get_cache_data('group' + group):
#                     res = get_cache_data('group' + group)
#                 else:
#                     foods = Food.objects.filter(group=int(group))
#                     res = FoodSerializer(foods, many=True).data
#                     set_cache_data('group' + group, res)
#             if res is None:
#                 if get_cache_data(None):
#                     res = get_cache_data(None)
#                 else:
#                     foods = Food.objects.all()[:20]
#                     res = FoodSerializer(foods, many=True).data
#                     set_cache_data(None, res)
#
#             return Response(res, status=200)
#         except Exception as e:
#             raise NotAcceptable(str(e))
#
#
# def dashboardView(request):
#     today_sold = 0
#     month_sold = 0
#     day_order = OrderDetails.objects.filter(ts_created__day=datetime.today().day,
#                                             ts_created__month=datetime.today().month)
#     for o in day_order:
#         today_sold = today_sold + o.final_bill
#     month_order = OrderDetails.objects.filter(ts_created__month=datetime.today().month)
#     for o in month_order:
#         month_sold = month_sold + o.final_bill
#     highest_sale_this_month = Cart.objects.annotate(mc=Count('food')).filter(ts_created__month=datetime.today().month,
#                                                                              status=2).order_by('-mc')
#     highest_sale_this_today = Cart.objects.annotate(mc=Count('food')).filter(ts_created__month=datetime.today().month,
#                                                                              ts_created__day=datetime.today().day,
#                                                                              status=2).order_by('-mc')
#     print(highest_sale_this_month.first().food.title)
#     context = {
#         'highest_sale_this_month': highest_sale_this_month.first().food.title if len(
#             highest_sale_this_month) > 0 else '-',
#         'highest_sale_this_today': highest_sale_this_today.first().food.title if len(
#             highest_sale_this_today) > 0 else '-',
#         'today_sold': today_sold,
#         'month_sold': month_sold,
#
#     }
#
#     return render(request, 'dashboard.html', context)
#
#
# def printView(request):
#     id = request.GET.get('id')
#     order = OrderDetails.objects.get(pk=int(id))
#     # DSR
#     # for regular
#     #     DSU
#     #     for Urgent
#     #         DSP
#     #     for personal
#     print(order.cart.all().first().food.title)
#     context = {
#         'order': order,
#         'item': order.cart.all().first().food.title,
#         'item_price': order.cart.all().first().food.price * order.cart.all().first().quantity,
#         'item_quantity': order.cart.all().first().quantity,
#
#     }
#
#     return render(request, 'invoice.html', context)

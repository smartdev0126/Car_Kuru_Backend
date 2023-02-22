# from rest_framework import serializers
#
# from apps.models import *
# from common.serializers import CustomSerializer
#
#
# class UserSerializer(CustomSerializer):
#     class Meta:
#         model = User
#         fields = '__all__'
#
#
# class SettingsSerializer(CustomSerializer):
#     class Meta:
#         model = Settings
#         fields = '__all__'
#
#
# class BannerSerializer(CustomSerializer):
#     class Meta:
#         model = Banner
#         fields = '__all__'
#
#
# class BlogSerializer(CustomSerializer):
#     class Meta:
#         model = Blog
#         fields = '__all__'
#
#
# class CookSerializer(CustomSerializer):
#     class Meta:
#         model = Cook
#         fields = '__all__'
#
#
# class NotificationSerializer(CustomSerializer):
#     class Meta:
#         model = Notification
#         fields = '__all__'
#
#
# class FaqSerializer(CustomSerializer):
#     class Meta:
#         model = Faq
#         fields = '__all__'
#
#
# class AboutUsSerializer(CustomSerializer):
#     class Meta:
#         model = AboutUs
#         fields = '__all__'
#
#
# class AddOnCatSerializer(CustomSerializer):
#     class Meta:
#         model = AddOnCategory
#         fields = '__all__'
#
#
# class AddOnSerializer(CustomSerializer):
#     add_on_category = AddOnCatSerializer(many=False)
#
#     class Meta:
#         model = AddOn
#         fields = '__all__'
#
#
# class AddOnSerializerSkinny(CustomSerializer):
#     # add_on_category = AddOnCatSerializer(many=False)
#
#     class Meta:
#         model = AddOn
#         fields = ('title', 'price',)
#
#
# class IngredientSerializer(CustomSerializer):
#     class Meta:
#         model = Ingredient
#         fields = '__all__'
#
#
# class CategorySerializer(CustomSerializer):
#     class Meta:
#         model = Category
#         fields = ['title']
#
#
# class SubdomainSerializer(CustomSerializer):
#
#     class Meta:
#         model = SubAddOn
#         fields = ('title','price',)
#
#
# class FoodSerializer(CustomSerializer):
#     total_reviews = serializers.SerializerMethodField()
#     avg_reviews = serializers.SerializerMethodField()
#     is_fav = serializers.SerializerMethodField()
#     ingredient = IngredientSerializer(many=True)
#     category = CategorySerializer(many=False)
#     add_ons = serializers.SerializerMethodField()
#     sides=serializers.SerializerMethodField()
#
#     class Meta:
#         model = Food
#         fields = '__all__'
#
#     def get_total_reviews(self, obj):
#         # print(self.context)
#         # return BazarListItems.objects.get(product=user,bazar_list__user=user).exist()
#         return 0
#
#     def get_avg_reviews(self, obj):
#         # print(self.context)
#         # return BazarListItems.objects.get(product=user,bazar_list__user=user).exist()
#         return 0.0
#
#     def get_add_ons(self, obj):
#         list = []
#         for f in obj.add_ons.all():
#             list.append({
#                 "id": f.id,
#                 "title": f.title,
#                 "price": f.price,
#                 "image": f.image.url,
#                 "group_name": f.add_on_category.title,
#                 "sub_add_on": SubdomainSerializer(SubAddOn.objects.filter(add_on=f), many=True).data
#             })
#
#         return list
#     def get_sides(self, obj):
#         list = []
#         for f in obj.sides.all():
#             list.append({
#                 "id": f.id,
#                 "title": f.title,
#                 "price": f.price,
#                 "image": f.image.url,
#                 "group_name": 'Choice Of Sides',
#                 "sub_add_on": [],
#
#             })
#         return list
#
#     def get_is_fav(self, obj):
#         # print(self.context)
#         # return BazarListItems.objects.get(product=user,bazar_list__user=user).exist()
#         return False
#
#
# class FoodSerializerSkinny(CustomSerializer):
#     class Meta:
#         model = Food
#         fields = ('title', 'price', 'image',)
#
#
# class CartSerializer(CustomSerializer):
#     food = FoodSerializerSkinny(many=False)
#     add_on = AddOnSerializerSkinny(many=True)
#     sides = FoodSerializerSkinny(many=True)
#
#     class Meta:
#         model = Cart
#         fields = '__all__'
#
#
# class CartOrderSerializer(CustomSerializer):
#     food = serializers.SerializerMethodField()
#
#     class Meta:
#         model = Cart
#         fields = ['quantity', 'total_price', 'food', ]
#
#     def get_food(self, obj):
#         return obj.food.title
#
#
# #
#
# #
# #
# # class DeliveryAreaSerializer(CustomSerializer):
# #     class Meta:
# #         model = Area
# #         fields = '__all__'
# #
# #
# # class DeliveryTypeSerializer(CustomSerializer):
# #     class Meta:
# #         model = VehicleType
# #         fields = '__all__'
# #
# #
# # class ParcelTypeSerializer(CustomSerializer):
# #     class Meta:
# #         model = ParcelType
# #         fields = '__all__'
#
#
# # class OrderDetailsSerializer(CustomSerializer):
# #     voucher = VoucherSerializer(many=False)
# #     delivery_type = serializers.SerializerMethodField()
# #     parcel_type = serializers.SerializerMethodField()
# #     delivery_area = serializers.SerializerMethodField()
# #
# #     class Meta:
# #         model = Order
# #         fields = '__all__'
# #
# #     def get_delivery_type(self, obj):
# #         return obj.delivery_type.name
# #     def get_parcel_type(self, obj):
# #         return obj.parcel_type.name
# #     def get_delivery_area(self, obj):
# #         return obj.delivery_area.area_name
#
# #     def create_obj(self, validated_data):
# #         if User.objects.filter(email__contains=validated_data.get('email', None)).exists():
# #             raise ValidationError(detail='User already exists.', )
# #         else:
# #             return self.create(validated_data)
#
# #
# # class VideoTagSerializer(CustomSerializer):
# #     class Meta:
# #         model = VideoTag
# #         fields = '__all__'
# #
# #
# # class VideoSerializer(CustomSerializer):
# #     category_name = serializers.SerializerMethodField()
# #     rate_one = serializers.SerializerMethodField()
# #     rate_two = serializers.SerializerMethodField()
# #     user = UserSerializer(many=False)
# #     tag = VideoTagSerializer(many=True)
# #
# #     class Meta:
# #         model = Video
# #         fields = '__all__'
# #
# #     def get_category_name(self, obj):
# #         return obj.category.name
# #
# #     def get_user_name(self, obj):
# #         return obj.user.name
# #
# #     def get_rate_one(self, obj):
# #         return 0.0
# #
# #     def get_rate_two(self, obj):
# #         return 0.0
# #
# #
# # class VideoPostSerializer(CustomSerializer):
# #     class Meta:
# #         model = Video
# #         fields = '__all__'
# #
# #
# # class CoachSerializer(CustomSerializer):
# #     class Meta:
# #         model = Coach
# #         fields = '__all__'
# #
# #
#
# #
# #
# # class FighterSerializer(CustomSerializer):
# #     class Meta:
# #         model = Fighter
# #         fields = '__all__'
# #
# #
# # class ProductSizeSerializer(CustomSerializer):
# #     class Meta:
# #         model = ProductSize
# #         fields = '__all__'
# #
# #
# # class NotificationSerializer(CustomSerializer):
# #     class Meta:
# #         model = Notification
# #         fields = '__all__'
# #
# #
# # class SupportSerializer(CustomSerializer):
# #     class Meta:
# #         model = Support
# #         fields = '__all__'
# #
# #
# # class ReviewSerializer(CustomSerializer):
# #     class Meta:
# #         model = Review
# #         fields = '__all__'
# #
# #
# # class ReviewDetailsSerializer(CustomSerializer):
# #     fighter = UserSerializer()
# #     reviewer = UserSerializer()
# #
# #     class Meta:
# #         model = Review
# #         fields = '__all__'
# #
# #
# # class ProductCategorySerializer(CustomSerializer):
# #     class Meta:
# #         model = ProductCategory
# #         fields = '__all__'
# #
# #
# # class ProductSerializer(CustomSerializer):
# #     size = ProductSizeSerializer(many=True)
# #     category_name = serializers.SerializerMethodField()
# #
# #     class Meta:
# #         model = Product
# #         fields = '__all__'
# #
# #     def get_category_name(self, obj):
# #         return obj.category.name
# #
# #
# # class ProductOrderSerializer(CustomSerializer):
# #     user = UserSerializer(many=False)
# #     products = ProductSerializer(many=True)
# #
# #     class Meta:
# #         model = ProductOrder
# #         fields = '__all__'
# #
# #
# # class FavouriteSerializer(CustomSerializer):
# #     # favourite = UserSerializer()
# #     # user = UserSerializer()
# #     user_details = serializers.SerializerMethodField()
# #
# #     class Meta:
# #         model = Favourite
# #         fields = '__all__'
# #
# #     def get_user_details(self, obj):
# #         return UserSerializer(obj.favourite).data
# #
# #
# # class VideoCategorySerializer(CustomSerializer):
# #     class Meta:
# #         model = VideoCategory
# #         fields = '__all__'
# #
# #
# # class VideoCommentsSerializer(CustomSerializer):
# #     class Meta:
# #         model = VideoComments
# #         fields = '__all__'
# #
# #
# # class DonateeSerializer(CustomSerializer):
# #     class Meta:
# #         model = Donate
# #         fields = '__all__'
# #
# #
# # class ThreadSerializer(CustomSerializer):
# #     user_one = UserSerializer(many=False)
# #     user_two = UserSerializer(many=False)
# #     last_msg = serializers.SerializerMethodField()
# #
# #     class Meta:
# #         model = Thread
# #         fields = '__all__'
# #
# #     def get_last_msg(self, obj):
# #         msg = Message.objects.filter(thread=obj).last()
# #         return MessageSerializer(msg).data
# #
# # #
# # class RaceCategorySerializer(CustomSerializer):
# #     class Meta:
# #         model = RaceCategory
# #         fields = '__all__'
# #
# #
# # class LiveCommentSerializer(CustomSerializer):
# #     class Meta:
# #         model = LiveComment
# #         fields = '__all__'
# #
# #
from apps.models import User, Banner, Order, Vehicle, Bid, Notifications, AboutUs, Brand
from common.serializers import CustomSerializer


class UserSerializer(CustomSerializer):
    class Meta:
        model = User
        fields = '__all__'
# #
# #
# # class EntrantSerializer(CustomSerializer):
# #     class Meta:
# #         model = Entrant
# #         fields = '__all__'
# #
# #
# # class RaceLevelSerializer(CustomSerializer):
# #     class Meta:
# #         model = RaceLevels
# #         fields = '__all__'
# #
# #
# # class SettingSerializer(CustomSerializer):
# #     class Meta:
# #         model = Setting
# #         fields = '__all__'
# #
# #
# # class SponsorSerializer(CustomSerializer):
# #     class Meta:
# #         model = Sponsor
# #         fields = '__all__'
# #
# #
# # class ShopOrderSerializer(CustomSerializer):
# #     class Meta:
# #         model = ShopOrder
# #         fields = '__all__'
# #
# #
# # class NewSerializer(CustomSerializer):
# #     class Meta:
# #         model = New
# #         fields = '__all__'
# #
# #
# # class LiveScoreSerializer(CustomSerializer):
# #     team_a = UserSerializer(many=False)
# #     team_b = UserSerializer(many=False)
# #
# #     class Meta:
# #         model = LiveScore
# #         fields = '__all__'
# #
# #
# # class NotificationSerializer(CustomSerializer):
# #     class Meta:
# #         model = Notification
# #         fields = '__all__'
# #
# #
# # class FeedSerializer(CustomSerializer):
# #     posted_by = UserSerializer(many=False)
# #
# #     class Meta:
# #         model = Feed
# #         fields = '__all__'
# #
# #
# # class FeedPostSerializer(CustomSerializer):
# #     class Meta:
# #         model = Feed
# #         fields = '__all__'
# #
# #
# # class EntrantImageSerializer(CustomSerializer):
# #     class Meta:
# #         model = EntrantImage
# #         fields = '__all__'
# #
# #
# # class LiveCommentPostSerializer(CustomSerializer):
# #     posted_by = UserSerializer(many=False)
# #
# #     class Meta:
# #         model = LiveComment
# #         fields = '__all__'
# #
# #
# # class ShopSerializer(CustomSerializer):
# #     class Meta:
# #         model = Shop
# #         fields = '__all__'
# #
# #
# # class ContactUSerializer(CustomSerializer):
# #     class Meta:
# #         model = ContactU
# #         fields = '__all__'
# #
# #
class BannerSerializer(CustomSerializer):
    class Meta:
        model = Banner
        fields = '__all__'
# #
# #
# # class ChatSerializer(CustomSerializer):
# #     posted_by = UserSerializer(many=False)
# #
# #     class Meta:
# #         model = Chat
# #         fields = '__all__'
# #
# #
# # class ChatPostSerializer(CustomSerializer):
# #     class Meta:
# #         model = Chat
# #         fields = '__all__'
# #
# # total 450*
# #
class NotificationSerializer(CustomSerializer):
    class Meta:
        model = Notifications
        fields = '__all__'
class AboutUsSerializer(CustomSerializer):
    class Meta:
        model = AboutUs
        fields = '__all__'


class BrandSerializer(CustomSerializer):
    class Meta:
        model = Brand
        fields = '__all__'
# #
# #
# # class FeedCommentPostSerializer(CustomSerializer):
# #     posted_by = UserSerializer(many=False)
# #
# #     class Meta:
# #         model = FeedComment
# #         fields = '__all__'
#
# class SSLCreateSerializer(serializers.Serializer):
#     amount = serializers.FloatField(required=True)
#
#
# class SSLOrderCreateSerializer(serializers.Serializer):
#     amount = serializers.FloatField(required=True)
#     order = serializers.FloatField(required=True)
#
#
class BidSerializer(CustomSerializer):
    # cart = CartOrderSerializer(many=True)

    class Meta:
        model = Bid
        fields = '__all__'
class VehicleSerializer(CustomSerializer):
    # cart = CartOrderSerializer(many=True)

    class Meta:
        model = Vehicle
        fields = '__all__'
class OrderSerializer(CustomSerializer):
    # cart = CartOrderSerializer(many=True)

    class Meta:
        model = Order
        fields = '__all__'

    # def create_obj(self, validated_data):
    #     if validated_data.get('payment_method') == PAYMENT_METHOD_DICT['online_payment']:
    #         if is_valid_transaction(validated_data.get('online_payment_details')['val_id'],
    #                                 validated_data.get('online_payment_details')['payment_uid']):
    #             return helpers.process_order_submit(self, validated_data)
    #         else:
    #             raise NotAcceptable(detail=str())
    #     else:
    #         return helpers.process_order_submit(self, validated_data)
    #
    # def update_obj(self, order, validated_data):
    #     return helpers.process_order_update(self, order, validated_data)
    #
    # def get_item_count(self, obj):
    #     if obj.cart:
    #         return CartItem.objects.filter(cart=obj.cart).count()
    #     else:
    #         return None
#
#
# class SSLPreOrderCreateSerializer(serializers.Serializer):
#     amount = serializers.FloatField(required=True)
#     preorder = serializers.FloatField(required=True)

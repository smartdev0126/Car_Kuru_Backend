from django.contrib import admin
from django.contrib.auth.models import User, Group

import apps.models as model


# Register your models here.
#
#
# class UserInline(admin.TabularInline):
#     model = model.User
#
#     def get_extra(self, request, obj=None, **kwargs):
#         extra = 0
#         # return extra - obj.field.count()
#         return extra
#
#
class UserAdmin(admin.ModelAdmin):
    search_fields = ('name', 'email',)
    list_filter = (
        'ts_created',
    )

    list_display = (
        'name',
        'email',
        'phone',
        'status',
        'ts_created',
    )


# class ScreenAdmin(admin.ModelAdmin):
#     list_filter = (
#         'ts_created',
#
#     )
#
#     list_display = (
#         'screen_title',
#         'title',
#         'description',
#         'parent',
#         'ts_created',
#     )
#
#
# class DropDownAdmin(admin.ModelAdmin):
#     list_filter = (
#         'ts_created',
#         'is_personal',
#         'is_business',
#
#     )
#
#     list_display = (
#         'text',
#         'is_personal',
#         'is_business',
#         'ts_created',
#         'following_screen',
#     )
#
#
# #
# # class CoachAdmin(admin.ModelAdmin):
# #     search_fields = ('name', 'description')
# #     list_filter = (
# #
# #         'ts_created',
# #
# #     )
# #
# #     list_display = (x
# #         'user', 'coach_experience', 'is_fight_sport',
# #         'highest_level_coached',
# #     )
# # #
# # class TransactionAdmin(admin.ModelAdmin):
# #     search_fields = ('sender_name', 'device_serial')
# #     list_filter = (
# #         'status',
# #         'ts_created',
# #         'type',
# #
# #     )
# #
# #     readonly_fields = (
# #         'transaction_id', 'sender', 'receiver', 'payment_total_usd', 'payment_total_crypto', 'type', 'order_total',
# #         'network_fee', 'note', 'device')
# #
# #     list_display = (
# #         'transaction_id', 'sender', 'receiver', 'payment_total_usd', 'payment_total_crypto', 'status', 'type',
# #     )
# #
# #
# # class WithdrawAdmin(admin.ModelAdmin):
# #     search_fields = ('user_name', 'amount')
# #     list_filter = (
# #         'status',
# #         'ts_created',
# #
# #     )
# #
# #     list_display = (
# #         'user', 'status', 'amount',
# #     )
# #
# #
# # class DeviceAdmin(admin.ModelAdmin):
# #     search_fields = ('brand', 'model')
# #     list_filter = (
# #         'brand',
# #         'ts_created',
# #
# #     )
# #
# #     list_display = (
# #         'user', 'brand', 'model', 'serial',
# #     )
# #
# #


# class SettingAdmin(admin.ModelAdmin):
#     list_display = (
#         'company_name',
#         'company_bin',
#         'ts_created',
#     )


# #
# # # class FighterAdmin(admin.ModelAdmin):
# # #     search_fields = ('username','country')
# # #     list_filter = (
# # #         'availability',
# # #         'level',
# # #         'gender',
# # #         'height',
# # #
# # #     )
# # #
# # #     list_display = (
# # #         'user', 'availability',
# # #         'level',
# # #         'gender',
# # #         'height',
# # #     )
# # #
# # # class CommonAdmin(admin.ModelAdmin):
# # #     search_fields = ('name', 'description')
# # #     list_filter = (
# # #
# # #         'ts_created',
# # #
# # #     )
# # #
# # #     list_display = (
# # #         'name', 'description',
# # #     )
# # #
# # #
# # # class VideoAdmin(admin.ModelAdmin):
# # #     search_fields = ('name', 'description')
# # #     list_filter = (
# # #
# # #         'ts_created',
# # #
# # #     )
# # #
# # #     list_display = (
# # #         'name', 'description',
# # #     )
# # #
# # #
#
# class RequestAdmin(admin.ModelAdmin):
#     search_fields = ('sender', 'provider', 'parking_address', 'status')
#     list_filter = (
#         'sender', 'provider', 'status',
#         'ts_created',
#
#     )
#     list_display = (
#         'sender', 'provider', 'parking_address', 'status',
#         'ts_created',
#     )
#     # # change_form_template = "change.html"
#     # def history_view(self, request, object_id, extra_context=None):
#     #     # print(str(object_id))
#     #     return HttpResponseRedirect("/v0/order/print/?id="+str(object_id))
#
#
class CategoryAdmin(admin.ModelAdmin):
    search_fields = ('title', 'description')
    list_filter = (
        'ts_created',

    )
    list_display = (
        'title', 'description',
        'ts_created',
    )

class BidAdmin(admin.ModelAdmin):
    search_fields = ('text', 'description')
    list_filter = (
        'ts_created',

    )
    list_display = (
        'text', 'description',
        'ts_created',
    )

#
# admin.site.register(model.Category, CategoryAdmin)
#
#
# class IngredientAdmin(admin.ModelAdmin):
#     search_fields = ('title', 'description')
#     list_filter = (
#         'ts_created',
#
#     )
#     list_display = (
#         'title', 'description',
#         'ts_created',
#     )
#
#
# admin.site.register(model.Ingredient, IngredientAdmin)
#
#
# class IngredientInline(admin.TabularInline):
#     model = model.Food.ingredient.through
#
#     def get_extra(self, request, obj=None, **kwargs):
#         extra = 0
#         # return extra - obj.field.count()
#         return extra
#
#
# class FoodAdmin(admin.ModelAdmin):
#     search_fields = ('title', 'description')
#     list_filter = (
#         'ts_created',
#
#     )
#
#     inlines = [
#         IngredientInline,
#     ]
#     exclude = ('ingredient',)
#     list_display = (
#         'title', 'description', 'price', 'category',
#         'ts_created',
#     )
#     def save_model(self, request, obj, form, change):
#         clear_cache()
#         foods = model.Food.objects.all()[:20]
#         res = FoodSerializer(foods, many=True).data
#         set_cache_data(None, res)
#         super().save_model(request, obj, form, change)
#
# admin.site.register(model.Food, FoodAdmin)
# admin.site.register(model.Rider)
#
#
# class BannerAdmin(admin.ModelAdmin):
#     search_fields = ('title', 'start_time')
#     list_filter = (
#         'status', 'expire_time',
#
#     )
#
#     list_display = (
#         'title', 'patient', 'employee',
#         'start_time', 'status',
#     )
#
#
# admin.site.register(model.Task, BannerAdmin)


class MedAdmin(admin.ModelAdmin):
    search_fields = ('name', 'v')
    list_filter = (
        'status',

    )

    list_display = (
        'name', 'patient', 'employee',
        'start_date', 'status',
    )


class OrderAdmin(admin.ModelAdmin):
    search_fields = ('addresss',)
    list_filter = (
        'start_time',
        'end_time',
        'status',
        'ts_created',
    )

    list_display = (
        'ts_created', 'user', 'start_time',
        'end_time', 'address', 'duration', 'total_cost', 'status',
    )


# admin.site.register(model.Order, OrderAdmin)


class StandardPricingAdmin(admin.ModelAdmin):
    list_editable = (
        'per_hour_price', 'discount_hourly_price',
        'discount_order_limit', 'is_discount_active',
    )

    list_display = (
        'title', 'per_hour_price', 'discount_hourly_price',
        'discount_order_limit', 'is_discount_active',
    )


# admin.site.register(model.Pricing,StandardPricingAdmin)


class SeasonalPricingPricingAdmin(admin.ModelAdmin):
    list_editable = (
        'per_hour_price', 'start_time',
        'end_time', 'is_active',
    )

    list_display = (
        'note', 'per_hour_price', 'start_time',
        'end_time', 'is_active',
    )

    #
    # = models.FloatField(default='')
    #  = models.DateTimeField(null=True, blank=True)
    #  = models.DateTimeField(null=True, blank=True)
    #  = models.BooleanField(default=False)
    #  = models.TextField(default='')


# admin.site.register(model.SeasonalPricing,SeasonalPricingPricingAdmin)


# admin.site.register(model.Day)
# admin.site.register(model.Medicine, MedAdmin)
# admin.site.register(model.Note)


#
#
# class CookAdmin(admin.ModelAdmin):
#     search_fields = ('first_name', 'primary_region')
#     list_filter = (
#         'ts_created', 'status',
#
#     )
#
#     list_display = (
#         'first_name', 'last_name', 'phone', 'status',
#         'ts_created',
#     )
#
#
# admin.site.register(model.Cook, CookAdmin)
#
# #
# #
# # class DeliveryTypeAdmin(admin.ModelAdmin):
# #     search_fields = ('name', 'description')
# #     list_filter = (
# #         'ts_created',
# #
# #     )
# #     list_display = (
# #         'name', 'description',
# #         'ts_created',
# #     )
# #
# #
# # class VoucherAdmin(admin.ModelAdmin):
# #     search_fields = ('name', 'description', 'amount')
# #     list_filter = (
# #
# #         'is_active',
# #         'ts_created',
# #
# #     )
# #     list_display = (
# #         'name', 'description', 'amount', 'status', 'is_active',
# #     )
# #
# #
# # class AreaAdmin(admin.ModelAdmin):
# #     search_fields = ('area_name',)
# #     list_filter = (
# #         'ts_created',
# #
# #     )
# #     list_display = (
# #         'area_name', 'base_weight', 'extra_price_per_kg', 'base_price', 'weight_limit',
# #         'ts_created',
# #     )
# #
# #
# # # class LiveScoreAdmin(admin.ModelAdmin):
# # #     search_fields = ('team_a', 'team_b' ,)
# # #     list_filter = (
# # #
# # #         'is_race_finish',
# # #
# # #     )
# # #
# # #     list_display = (
# # #         'team_a', 'team_b','team_a_score','team_a_score','is_race_finish','race_time',
# # #     )
class UserAdmin(admin.ModelAdmin):
    search_fields = ('name', 'phone',)
    list_filter = (
        'is_active',
        'ts_created',

    )

    list_display = (
        'name', 'phone', 'email', 'is_active', 'ts_created',
    )


class OrderAdmin(admin.ModelAdmin):
    search_fields = ('first_name', 'last_name',)
    list_filter = (
        'is_active',
        'ts_created',

    )

    list_display = (
        'first_name', 'last_name', 'is_active', 'ts_created',
    )


class AboutAdmin(admin.ModelAdmin):
    search_fields = ('title',)
    list_filter = (
        'title',
        'ts_created',

    )

    list_display = (
        'title',
        'ts_created',
    )

class VehicleAdmin(admin.ModelAdmin):
    search_fields = ('title',)
    list_filter = (
        'title',
        'description',
        'price',
        'brand',
        'year'

    )

    list_display = (
        'title',
        'description',
        'price',
        'brand',
        'year'
    )


# # # #
# # # #
admin.site.unregister(User)
admin.site.unregister(Group)
# # #
admin.site.register(model.User, UserAdmin)
admin.site.register(model.Category, CategoryAdmin)
admin.site.register(model.Vehicle, VehicleAdmin)
admin.site.register(model.Bid, BidAdmin)
admin.site.register(model.Brand)
admin.site.register(model.AboutUs)
admin.site.register(model.Notifications)
# admin.site.register(model.Employee, EmployeeAdmin)
# # #
# # # admin.site.register(model.ParcelType, ParcelTypeAdmin)
# # # admin.site.register(model.Area, AreaAdmin)
# # # admin.site.register(model.VehicleType, DeliveryTypeAdmin)
# # # admin.site.register(model.Notification)
# # # admin.site.register(model.Feed)
# # # admin.site.register(model.New)
# # # admin.site.register(model.Setting)
# # # admin.site.register(model.RaceCategory)
# #
# # admin.site.register(model.User, UserAdmin)
# # # admin.site.register(model.Shop)
# # #
# # # # admin.site.register(model.Request, RequestAdmin)
# admin.site.register(model.Booking)
# admin.site.register(model.Category)
# admin.site.register(model.Package)
# admin.site.register(model.TimeSlot)
# admin.site.register(model.Banner)
# # # admin.site.register(model.RaceLevels,LevelAdmin)
# # # admin.site.register(model.Transaction, TransactionAdmin)
# # # # admin.site.register(model.Fighter, FighterAdmin)
# # # # admin.site.register(model.Sport, CommonAdmin)
# # # admin.site.register(model.Withdraw, WithdrawAdmin)
# # # # admin.site.register(model.ProductCategory, CommonAdmin)
# # # # admin.site.register(model.Product, CommonAdmin)
# # # # admin.site.register(model.VideoCategory, CommonAdmin)
# # # # admin.site.register(model.Payment, PaymentAdmin)
# admin.site.register(model.Settings, SettingAdmin)
# # admin.site.register(model.DropDown, DropDownAdmin)
# # admin.site.register(model.Screen, ScreenAdmin)
# # admin.site.register(model.Faq)
# # admin.site.register(model.Blog)
# admin.site.register(model.AboutUs, AboutAdmin)
# # admin.site.register(model.Notification)
# #
# # # admin.site.register(model.Review)
# #
# #
# # # admin.site.register(model.Voucher, VoucherAdmin)
# # #
# # #
# # # class FAQAdmin(admin.ModelAdmin):
# # #     search_fields = ('question', 'answer')
# # #     list_filter = (
# # #         'ts_created', 'is_new',
# # #
# # #     )
# # #     list_display = (
# # #         'question', 'answer', 'is_new',
# # #         'ts_created',
# # #     )
# # #
# # #
# # # admin.site.register(model.FAQ, FAQAdmin)
# # #
# #
# # class PaymentInfoAdmin(admin.ModelAdmin):
# #     search_fields = ('transaction_details', 'user')
# #     list_filter = (
# #         'ts_created', 'user',
# #
# #     )
# #     list_display = (
# #         'user', 'amount', 'ts_created',
# #     )
# #
# #
# # admin.site.register(model.PaymentInfo, PaymentInfoAdmin)
# #
# admin.site.register(model.AddOnCategory)
# admin.site.register(model.AddOn)
# admin.site.register(model.SubAddOn)
#
#
# # # # admin.site.register(model.Video)
# # # # admin.site.register(model.ProductSize)
# # # # admin.site.register(model.ProductOrder, ProdOrderAdmin)
# # # #
# class OrderInline(admin.TabularInline):
#     model = model.OrderDetails
#
#     def get_extra(self, request, obj=None, **kwargs):
#         extra = 0
#         # return extra - obj.field.count()
#         return extra
#
#
# class OrderDetailsAdmin(admin.ModelAdmin):
#     search_fields = ('order_identifier',)
#     list_filter = (
#         'status',
#     )
#
#     list_display = (
#         'ordered_by',
#         'order_identifier',
#         'status',
#         'payment_method',
#         'final_bill',
#
#     )
#
#     def history_view(self, request, object_id, extra_context=None):
#         # print(str(object_id))
#         return HttpResponseRedirect("/v0/order/print/?id=" + str(object_id))
#
#     history_view.short_description = 'Print'
#
#
# admin.site.register(model.OrderDetails, OrderDetailsAdmin)
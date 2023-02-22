# from django.contrib.auth.models import Group as RoleModel
from django.contrib.postgres.fields import ArrayField
from django.db import models
from django.utils import timezone

from apps.config import TASK_CHOICES, TASK_DICT, TYPE_STATUS_DICT, TYPE_CHOICES, \
    OP_STATUS_DICT, OP_CHOICES, USER_ST_DICT, USER_ST_CHOICES, GROUP_DICT, GROUP_CHOICES, V_TYPE_DICT, V_TYPE_CHOICE
from common.models import TSFieldsIndexed


# class Role(RoleModel):
#     class Meta:
#         proxy = True

class User(TSFieldsIndexed):
    name = models.CharField(max_length=1024, blank=False, null=True)
    password = models.CharField(max_length=1024, blank=False, null=True)
    email = models.CharField(max_length=1024, blank=False, null=True, unique=True)
    address = models.CharField(max_length=1024, blank=False, null=True)
    phone = models.CharField(max_length=1024, blank=False, null=True)
    lat = models.FloatField(default=0.0)
    lng = models.FloatField(default=0.0)
    profile_image = models.CharField(max_length=1024, blank=False, null=True)
    status = models.SmallIntegerField(
        default=USER_ST_DICT['Active'],
        choices=USER_ST_CHOICES
    )
    # login_type = models.SmallIntegerField(
    #     default=LOGIN_DICT['EMAIL'],
    #     choices=LOGIN_CHOICES
    # )
    is_active = models.BooleanField(default=False)
    note = models.CharField(max_length=1024, blank=False, null=True)

    def __str__(self):
        return str(self.name)


#
# class Cook(TSFieldsIndexed):
#     first_name = models.CharField(max_length=50, default='')
#     last_name = models.CharField(max_length=50, default='')
#     phone = models.CharField(max_length=50, default='', unique=True)
#     another_phone = models.CharField(max_length=50, default='', unique=True)
#     email = models.CharField(max_length=50, default='', unique=True)
#     primary_region = models.CharField(max_length=50, default='')
#     thana = models.CharField(max_length=50, default='', )
#     district = models.CharField(max_length=50, default='')
#     firebase_token = models.TextField(default='')
#     lat = models.FloatField(blank=True, null=True)
#     lng = models.FloatField(blank=True, null=True)
#     status = models.SmallIntegerField(
#         default=USER_ST_DICT['On Verification'],
#         choices=USER_ST_CHOICES
#     )
#     USERNAME_FIELD = 'first_name'
#     REQUIRED_FIELDS = []
#
#     def __str__(self):
#         return self.first_name
#
#
# class UserPermissionsMixin(PermissionsMixin):
#     groups = None
#     user_permissions = None
#     role = models.ForeignKey(Role, null=True, on_delete=models.PROTECT)
#
#     class Meta:
#         abstract = True
#
#
# class SimpleUserManager(UserManager):
#     def _create_user(self, username, email, password, **extra_fields):
#         user = self.model(email=email, **extra_fields)
#         user.is_active = False
#         user.is_staff = False
#         user.set_password(password)
#         user.save(using=self._db)
#         return user
#
#     def create_superuser(self, email, password, **extra_fields):
#         email = self.normalize_email(email)
#         user = self.model(email=email, **extra_fields)
#         user.is_active = True
#         user.is_staff = True
#         user.is_superuser = True
#         user.set_password(password)
#         user.save(using=self._db)
#         return user
#
#
# def user_directory_path(instance, filename):
#     return 'user_{0}/{1}'.format('test', filename)
#

#
# class User(TSFieldsIndexed):
#     name = models.CharField(max_length=50, default='')
#     phone = models.CharField(max_length=18, default='')
#     image = models.CharField(max_length=200, default='')
#     google = models.CharField(max_length=18, default='')
#     facebook = models.CharField(max_length=18, default='')
#     password = models.CharField(max_length=18, default='')
#     email = models.EmailField(max_length=100, unique=True, blank=False, null=True)
#     mobile_info = models.TextField(default='')
#     type = models.SmallIntegerField(
#         default=LOGIN_DICT['EMAIL'],
#         choices=LOGIN_CHOICES
#     )
#     category = models.SmallIntegerField(
#         default=USER_TYPE_DICT['Customer'],
#         choices=USER_TYPE_CHOICES
#     )
#
#     USERNAME_FIELD = 'name'
#     REQUIRED_FIELDS = []
#
#     def __str__(self):
#         return self.name
#
#
# class Settings(TSFieldsIndexed):
#     company_name = models.TextField(default='')
#     url = models.TextField(default='')
#     radius = models.FloatField(default=500)
#     system_email = models.TextField(default='')
#     smtp_host = models.TextField(default='')
#     smtp_user = models.TextField(default='')
#     smtp_password = models.TextField(default='')
#     smtp_port = models.TextField(default='')
#     company_bin = models.TextField(default='', blank=True, )
#     ssl_id = models.TextField(default='', blank=True, )
#     ssl_pass = models.TextField(default='', blank=True, )
#
#     def __str__(self):
#         return self.company_name
#
#
# class Blog(TSFieldsIndexed):
#     image = models.FileField(upload_to=None, max_length=254)
#     title = models.TextField(default='')
#     description = models.TextField(default='')
#     position = models.IntegerField(default=0)
#
#     def __str__(self):
#         return self.title
#
#
class AboutUs(TSFieldsIndexed):
    # image = models.FileField(upload_to=None, max_length=254)
    title = models.TextField(default='')
    # price = models.FloatField(default='')
    description = models.TextField(default='')
    terms = models.TextField(default='')
    privacy = models.TextField(default='')
    note = models.FloatField(default='')

    def __str__(self):
        return self.title


class Pricing(TSFieldsIndexed):
    per_hour_price = models.FloatField(default=0.0)
    description = models.TextField(default='')
    title = models.TextField(default='')
    # discount_price = models.FloatField(default=0.0)
    discount_hourly_price = models.FloatField(default=0.0)
    discount_order_limit = models.IntegerField(default=0)
    is_discount_active = models.BooleanField(default=False)

    def __str__(self):
        return str(self.title)


class SeasonalPricing(TSFieldsIndexed):
    per_hour_price = models.FloatField(default='')
    start_time = models.DateTimeField(null=True, blank=True)
    end_time = models.DateTimeField(null=True, blank=True)
    is_active = models.BooleanField(default=False)
    note = models.TextField(default='')

    def __str__(self):
        return self.note


#
#
# class Notification(TSFieldsIndexed):
#     title = models.TextField(default='')
#     description = models.TextField(default='')
#
#     def __str__(self):
#         return self.title
#
#
# class Faq(TSFieldsIndexed):
#     question = models.TextField(default='')
#     answer = models.TextField(default='')
#     position = models.IntegerField(default=0)
#
#     def __str__(self):
#         return self.question
#
#

class Brand(TSFieldsIndexed):
    image = models.FileField(upload_to=None, max_length=254)
    title = models.CharField(blank=False, max_length=128)
    description = models.TextField(default='')

    def __str__(self):
        return self.title


class Category(TSFieldsIndexed):
    image = models.FileField(upload_to=None, max_length=254)
    title = models.CharField(blank=False, max_length=128)
    description = models.TextField(default='')

    def __str__(self):
        return self.title


class TimeSlot(TSFieldsIndexed):
    slot_name = models.CharField(blank=False, max_length=128)
    slot_description = models.CharField(blank=False, max_length=128)
    limit_per_day = models.IntegerField(default=1)
    limit_per_month = models.IntegerField(default=1)

    def __str__(self):
        return self.slot_name


#
#
# class Ingredient(TSFieldsIndexed):
#     title = models.CharField(blank=False, max_length=128)
#     image = models.FileField(upload_to=None, max_length=254)
#     description = models.TextField(default='')
#
#     def __str__(self):
#         return self.title
#
#
# class AddOnCategory(TSFieldsIndexed):
#     title = models.CharField(blank=False, max_length=128)
#     description = models.TextField(default='')
#
#     def __str__(self):
#         return self.title
#
#
class Vehicle(TSFieldsIndexed):
    title = models.CharField(blank=False, max_length=128)
    description = models.TextField(default='')
    group = models.SmallIntegerField(
        default=V_TYPE_DICT['Other'],
        choices=V_TYPE_CHOICE
    )
    image = models.FileField(upload_to=None, max_length=254, default='settings.MEDIA_ROOT/logos/blank.png',
                             blank=True)
    price = models.FloatField(default=0.0, max_length=10)

    category = models.ForeignKey(Category, null=True, blank=True, on_delete=models.PROTECT,
                                 related_name="food_category")
    brand = models.ForeignKey(Brand, null=True, blank=True, on_delete=models.PROTECT,
                              related_name="food_ccategory")
    edition = models.TextField(default='')
    model = models.TextField(default='')
    fuel_type = models.TextField(default='')
    year = models.DateTimeField(default=timezone.now)
    transmission = models.TextField(default='')

    def __str__(self):
        return self.title


class Bid(TSFieldsIndexed):
    text = models.CharField(blank=False, max_length=128)
    description = models.TextField(default='')
    price = models.FloatField(default=0.0, max_length=10)
    user = models.ForeignKey(User, null=True, blank=True, on_delete=models.PROTECT,
                             related_name="food_addj_on")
    vehicle = models.ForeignKey(Vehicle, null=True, blank=True, on_delete=models.PROTECT,
                                related_name="cc")
    is_winner = models.BooleanField(default=False)

    def __str__(self):
        return self.text


class Notifications(TSFieldsIndexed):
    text = models.CharField(blank=False, max_length=128)
    description = models.TextField(default='')

    user = models.ForeignKey(User, null=True, blank=True, on_delete=models.PROTECT,
                             related_name="food_akkddj_on")

    def __str__(self):
        return self.text


class Package(TSFieldsIndexed):
    title = models.CharField(blank=False, max_length=128)
    description = models.TextField(default='')
    is_sale = models.BooleanField(default=False)
    group = models.SmallIntegerField(
        default=GROUP_DICT['One Day Many Booking'],
        choices=GROUP_CHOICES
    )
    lat = models.FloatField(blank=True, null=True)
    lng = models.FloatField(blank=True, null=True)
    address = models.TextField(default='')
    note = models.CharField(blank=False, max_length=128)
    created_by = models.ForeignKey(User, null=False, blank=False, default=1, on_delete=models.PROTECT,
                                   related_name="food_xcategory")
    # sides = models.ManyToManyField("self", blank=True, null=True)
    # add_ons = models.ManyToManyField(AddOn, blank=True, null=True)
    image = models.FileField(upload_to=None, max_length=254)
    price = models.FloatField(default=0.0, max_length=10)
    category = models.ForeignKey(Category, null=True, blank=True, on_delete=models.PROTECT,
                                 related_name="food_catesgory")

    # ingredient = models.ManyToManyField(Ingredient, null=True, blank=True,
    #                                     related_name="ingredient")

    def __str__(self):
        return self.title


class Booking(TSFieldsIndexed):
    note = models.CharField(blank=False, max_length=128)
    package = models.ForeignKey(Package, null=True, blank=True, on_delete=models.PROTECT,
                                related_name="food_scategory")
    ordered_by = models.ForeignKey(User, null=True, blank=True, on_delete=models.PROTECT,
                                   related_name="food_scxategory")
    slot = models.ForeignKey(TimeSlot, null=True, blank=True, on_delete=models.PROTECT,
                             related_name="food_scxategory")
    dates = ArrayField(
        models.DateTimeField(),
    )
    total_cost = ArrayField(
        models.DateTimeField(),
    )

    def __str__(self):
        return self.note


#
#

#
#
# # Assigned Cook or kitchen id (foreign key)
# # Photo
# # Active or inactive option
#
# class Cart(TSFieldsIndexed):
#     quantity = models.IntegerField(default=1)
#     if_canceled = models.TextField(default='')
#     instruction = models.TextField(default='')
#     food = models.ForeignKey(Food, null=True, blank=True, on_delete=models.PROTECT)
#     add_on = models.ManyToManyField(AddOn, null=True, blank=True,
#                                     related_name="c_add_on")
#     sides = models.ManyToManyField(Food, null=True, blank=True,
#                                    related_name="c_sides")
#     total_price = models.IntegerField(default=1)
#     user = models.ForeignKey(User, null=True, blank=True, on_delete=models.PROTECT)
#     device_id = models.TextField(default='')
#     status = models.IntegerField(
#         default=CART_STATUS_DICT['open'],
#         choices=CART_CHOICES
#     )
#
#     def __str__(self):
#         return self.food.title
#
#
# def random_string():
#     return get_random_string(length=8, allowed_chars='ACTG')
#
#
# class OrderDetails(TSFieldsIndexed):
#     order_identifier = models.CharField(max_length=128, default=random_string, unique=True)
#     cart = models.ManyToManyField(Cart, blank=True, null=True)
#     status = models.SmallIntegerField(
#         default=ORDER_STATUS_DICT["pending"],
#         choices=ORDER_CHOICES
#     )
#     ts_delivery = models.DateTimeField(null=True, blank=True)
#     payment_method = models.SmallIntegerField(
#         default=PAYMENT_METHOD_DICT['cash_on_delivery'],
#         choices=PAYMENT_METHOD_CHOICE
#     )
#     online_paid_amount = models.FloatField(default=0.0)
#     delivery_charge = models.FloatField(default=0.0)
#     discount_amount = models.FloatField(default=0.0)
#     point_redeem_amount = models.FloatField(default=0.0)
#     tax = models.FloatField(default=0.0)
#     total_bill = models.FloatField(default=0.0)
#     refund_amount = models.FloatField(default=0.0)
#     final_bill = models.FloatField(default=0.0)
#     online_payment_details = JSONField(null=True, blank=True)
#     ordered_by = models.ForeignKey(
#         User,
#         on_delete=models.SET_NULL,
#         related_name="order_by",
#         null=True,
#         blank=False
#     )
#
#     recipient_lat = models.FloatField(blank=True, null=True)
#     recipient_lng = models.FloatField(blank=True, null=True)
#     recipient_phone = models.CharField(null=True, blank=True, max_length=24)
#     recipient_name = models.CharField(null=True, blank=True, max_length=128)
#     recipient_address = models.CharField(null=True, blank=True, max_length=256)
#     review = models.CharField(max_length=256, blank=True)
#     rating = models.SmallIntegerField(default=0, blank=True)
#     is_reviewed = models.BooleanField(default=False)
#     is_skipped_review = models.BooleanField(default=False)
#     time_slot = models.SmallIntegerField(default=0)
#     note = models.CharField(null=True, blank=True, max_length=512)
#     task_completion_image = models.FileField(null=True, blank=True)
#
#     def __str__(self):
#         prefix = 'order_'
#         suffix = self.ordered_by.name + '_ ' + self.ordered_by.phone if self.ordered_by else 'anonymous'
#         return prefix + suffix
#
#
class Banner(TSFieldsIndexed):
    # food = models.ForeignKey(Food, null=True, blank=True, on_delete=models.PROTECT, related_name="sender")
    image = models.FileField(upload_to=None, max_length=254)
    is_active = models.BooleanField(default=False)
    note = models.TextField(default='', blank=True, )

    def __str__(self):
        return self.note


# class Employee(TSFieldsIndexed):
#     first_name = models.CharField(max_length=1024, blank=False, null=True)
#     last_name = models.CharField(max_length=1024, blank=False, null=True)
#     likes_to_be_called = models.CharField(max_length=1024, blank=False, null=True)
#     mobile_landline = models.CharField(max_length=1024, blank=False, null=True)
#     email = models.CharField(max_length=1024, blank=False, null=True)
#     date_of_birth = models.CharField(max_length=1024, blank=False, null=True)
#     address = models.CharField(max_length=1024, blank=False, null=True)
#     city = models.CharField(max_length=1024, blank=False, null=True)
#     country = models.CharField(max_length=1024, blank=False, null=True)
#     post_code = models.CharField(max_length=1024, blank=False, null=True)
#     user_status = models.CharField(max_length=1024, blank=False, null=True)
#     profile_image = models.FileField(upload_to=None, max_length=254)
#     nhs_number = models.CharField(max_length=1024, blank=False, null=True)
#     caring_needs = models.CharField(max_length=1024, blank=False, null=True)
#     dietary_requirements = models.CharField(max_length=1024, blank=False, null=True)
#     property_access_information = models.CharField(max_length=1024, blank=False, null=True)
#     brief_detail_of_medical_history = models.CharField(max_length=1024, blank=False, null=True)
#     powered_attorney = models.CharField(max_length=1024, blank=False, null=True)
#     pets_information = models.CharField(max_length=1024, blank=False, null=True)
#     culture = models.CharField(max_length=1024, blank=False, null=True)
#     next_to_kin_relation = models.CharField(max_length=1024, blank=False, null=True)
#     next_to_kin_name = models.CharField(max_length=1024, blank=False, null=True)
#     next_to_kin_address = models.CharField(max_length=1024, blank=False, null=True)
#     next_to_kin_phone = models.CharField(max_length=1024, blank=False, null=True)
#     next_to_kin_email = models.CharField(max_length=1024, blank=False, null=True)
#     next_to_kin_notes = models.CharField(max_length=1024, blank=False, null=True)
#     is_active = models.BooleanField(default=False)
#     note = models.CharField(max_length=1024, blank=False, null=True)
#
#     def __str__(self):
#         return str(self.first_name) + " " + str(self.last_name)
#

# class Task(TSFieldsIndexed):
#     title = models.CharField(blank=False, max_length=128)
#     start_time = models.DateTimeField(default=timezone.now, db_index=True, editable=False)
#     expire_time = models.DateTimeField(auto_now=True, db_index=True, editable=False)
#     status = models.SmallIntegerField(
#         default=TASK_DICT['Assigned'],
#         choices=TASK_CHOICES
#     )
#     note = models.TextField(default='')
#     description = models.TextField(default='')
#     employee = models.ForeignKey(Employee, null=False, blank=False, default=1, on_delete=models.PROTECT,
#                                  related_name="employee")
#     patient = models.ForeignKey(Patient, null=False, blank=False, default=1, on_delete=models.PROTECT,
#                                 related_name="patient")
#
#     def __str__(self):
#         return self.title


class Day(TSFieldsIndexed):
    name = models.CharField(blank=False, max_length=128)

    def __str__(self):
        return self.name


# class Time(TSFieldsIndexed):
#     name = models.CharField(blank=False, max_length=128)
#
#     def __str__(self):
#         return self.name


class Order(TSFieldsIndexed):
    isWeekly = models.BooleanField(default=False)
    address = models.CharField(blank=False, max_length=128)
    duration = models.CharField(blank=False, max_length=128)
    status = models.SmallIntegerField(
        default=TASK_DICT['Assigned'],
        choices=TASK_CHOICES
    )
    type = models.SmallIntegerField(
        default=TYPE_STATUS_DICT['Weekly'],
        choices=TYPE_CHOICES
    )
    option = models.SmallIntegerField(
        default=OP_STATUS_DICT['With Material'],
        choices=OP_CHOICES
    )
    lat = models.FloatField(default=0.0)
    total_cost = models.FloatField(default=0.0)
    lng = models.FloatField(default=0.0)
    start_date = models.DateField(default=timezone.now)
    end_date = models.DateField(auto_now=True)
    day = models.TextField(default='')
    start_time = models.TimeField(auto_now=True)
    end_time = models.TimeField(auto_now=True)
    note = models.TextField(default='')
    description = models.TextField(default='')
    user = models.ForeignKey(User, null=False, blank=False, default=1, on_delete=models.PROTECT,
                             related_name="employee_m")

    # patient = models.ForeignKey(Patient, null=False, blank=False, default=1, on_delete=models.PROTECT,
    #                             related_name="patient_m")

    def __str__(self):
        return self.user.name

# class Note(TSFieldsIndexed):
#     text = models.CharField(blank=False, max_length=128)
#     is_visible = models.BooleanField(default=True)
#     image = models.FileField(upload_to=None, max_length=254)
#     user = models.ForeignKey(User, null=False, blank=False, default=1, on_delete=models.PROTECT,
#                                  related_name="employee_n")
#     # patient = models.ForeignKey(Patient, null=False, blank=False, default=1, on_delete=models.PROTECT,
#     #                             related_name="patient_n")
#
#     def __str__(self):
#         return self.text

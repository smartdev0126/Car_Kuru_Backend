USER_TYPE_DICT = {
    "Business": 1,
    "Personal": 2,
}

USER_TYPE_CHOICES = tuple((value, key) for key, value in USER_TYPE_DICT.items())

USER_NT_DICT = {
    "All": 1,
    "Racer": 2,
    'Racer Admin': 3,
    "Staff": 4,
    "Public": 5,
}

USER_NT_CHOICES = tuple((value, key) for key, value in USER_NT_DICT.items())

LEVEL_DICT = {
    "R1": 1,
    "R2": 2,
    'R3': 3,
    "R4": 4,
    "GF": 5,
    "SF": 6,
    "F": 7,
}

LEVEL_CHOICES = tuple((value, key) for key, value in LEVEL_DICT.items())

CATEGORY_DICT = {
    "Category A": 1,
    "Category B": 2,
    "Category C": 3,
    "Category D": 3,
}

CATEGORY_CHOICES = tuple((value, key) for key, value in USER_NT_DICT.items())

V_D_DICT = {
    "Percentage": 1,
    "Flat": 2,
}

V_D_CHOICES = tuple((value, key) for key, value in V_D_DICT.items())

VEHICLE_DICT = {
    "Bike": 1,
    "Honda": 2,
    "Car": 3,
}

VEHICLE_CHOICES = tuple((value, key) for key, value in VEHICLE_DICT.items())

GROUP_DICT = {
    "One Day Many Booking": 1,
    "Many Day One Booking": 2,
    # "Sea Bite": 3,
}

GROUP_CHOICES = tuple((value, key) for key, value in GROUP_DICT.items())

LOGIN_DICT = {
    "Phone": 1,
    "EMAIL": 2,
    "GOOGLE": 3,
    "FACEBOOK": 4,
}

LOGIN_CHOICES = tuple((value, key) for key, value in LOGIN_DICT.items())

USER_TYPE_DICT = {
    "Staff": 1,
    "Kitchen": 2,
    "Customer": 3,
}

USER_CHOICES = tuple((value, key) for key, value in USER_TYPE_DICT.items())

STATUS_DICT = {
    "Issue": 1,
    "Hold": 2,
    "Successful": 3,
}

STATUS_CHOICES = tuple((value, key) for key, value in STATUS_DICT.items())

SIZE_DICT = {
    "Extra Small - XS": 1,
    "Small - S": 2,
    "Medium - M": 3,
    "Large - L": 4,
    "Extra Large - XL": 5,
    "XXL": 6,
}

SIZE_CHOICES = tuple((value, key) for key, value in SIZE_DICT.items())

PAYMENT_STATUS_DICT = {
    'Initiated': 0,
    'Created': 1,
    'Successful': 2
}


def get_choices(dict_obj):
    return tuple((value, key) for key, value in dict_obj.items())


PAYMENT_STATUS_CHOICES = get_choices(PAYMENT_STATUS_DICT)

GENDER_DICT = {
    "Male": 1,
    "Female": 2,
    "Others": 3,
}

GENDER_CHOICES = tuple((value, key) for key, value in GENDER_DICT.items())

V_TYPE_DICT = {
    "Pay Frima": 1,
    "Pickup": 2,
    "Other": 3,
}

V_TYPE_CHOICE = tuple((value, key) for key, value in V_TYPE_DICT.items())

S_TYPE_DICT = {
    "Created": 1,
    "Accepted": 2,
    "On Hold": 3,
    "Complete": 4,
    "Canceled": 5,
}

S_TYPE_CHOICE = tuple((value, key) for key, value in S_TYPE_DICT.items())

Type_DICT = {
    "Searching Parking": 1,
    "Searching User": 2,
}

Type_CH = tuple((value, key) for key, value in Type_DICT.items())

ORDER_DICT = {
    "Pending": 1,
    "Delivered": 2,
}

USER_ST_DICT = {
    "Active": 1,
    "Pending": 2,
    "On Verification": 3,
    "Deactivate": 4,
    "Block": 5,
}

USER_ST_CHOICES = tuple((value, key) for key, value in USER_ST_DICT.items())

ORDER_CH = tuple((value, key) for key, value in ORDER_DICT.items())

THREAD_DICT = {
    "Public": 1,
    "Racer": 2,
    'Admin': 3,
}

THREAD_CHOICES = tuple((value, key) for key, value in THREAD_DICT.items())


def get_choices(dict_obj):
    return tuple((value, key) for key, value in dict_obj.items())


PAYMENT_STATUS_DICT = {
    'Initiated': 0,
    'Created': 1,
    'Successful': 2
}

CURRENCY_DICT = {
    'BDT': 1,
    'USD': 2,
    'EUR': 3
}

GATEWAYS = {
    'SSL': 1,
    # 'IPAY': 3,
    # 'BKASH': 1,
}

GATEWAY_CHOICES = get_choices(GATEWAYS)

CURRENCY_CHOICE = get_choices(CURRENCY_DICT)

PAYMENT_METHOD_DICT = {
    "cash_on_delivery": 1,
    "online_payment": 2,
    # "online_bkash_payment": 3,
}

PAYMENT_METHOD_CHOICE = tuple((value, key) for key, value in PAYMENT_METHOD_DICT.items())

ORDER_STATUS_DICT = {
    "pending": 1,
    "confirmed": 2,
    "processing": 3,
    "on-the-way": 4,
    "complete": 5,
    "cancelled": 6
}

ORDER_CHOICES = tuple((value, key) for key, value in ORDER_STATUS_DICT.items())

SSL_REDIRECT_URL = 'https://api.biteclubbd.com/v0/ssl/redirect/'
SSL_REDIRECT_URL_ORDER = 'https://api.biteclubbd.com/v0/ssl/redirect/order/'

SSL_CONF = {
    # "validator_url_ssl": "https://securepay.sslcommerz.com/validator/api/validationserverAPI.php?wsdl",
    # "create_url_ssl": "https://securepay.sslcommerz.com/gwprocess/v4/api.php",
    "validator_url_ssl": "https://sandbox.sslcommerz.com/validator/api/validationserverAPI.php?wsdl",
    "create_url_ssl": "https://sandbox.sslcommerz.com/gwprocess/v3/api.php",
    'store_id': 'bitec61f7c76bc5901',
    'store_passwd': 'bitec61f7c76bc5901@ssl',
}
CART_STATUS_DICT = {
    "open": 0,
    "locked": 1,
    "expired": 2
}
CART_CHOICES = tuple((value, key) for key, value in CART_STATUS_DICT.items())

TYPE_STATUS_DICT = {
    "Weekly": 0,
    "Monthly": 1,
    "Daily": 2
}
TYPE_CHOICES = tuple((value, key) for key, value in TYPE_STATUS_DICT.items())

OP_STATUS_DICT = {
    "With Material": 0,
    "With Out Material": 1,

}
OP_CHOICES = tuple((value, key) for key, value in OP_STATUS_DICT.items())

TASK_DICT = {
    "In Progress": 0,
    "Assigned": 1,
    "Incomplete": 2,
    "Complete": 3
}
TASK_CHOICES = tuple((value, key) for key, value in TASK_DICT.items())

MEAL_DICT = {
    "Before Meal": 0,
    "After Meal": 1,
    "Not Applicable": 2,
}
MEAL_CHOICES = tuple((value, key) for key, value in MEAL_DICT.items())

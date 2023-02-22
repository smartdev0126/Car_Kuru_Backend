import requests
from rest_framework.exceptions import NotAcceptable

from apps.models import *


# def category_filter(self, request):
#     # min = request.query_params.get('min')
#     # if min:
#     #     return Item.objects.filter(start__lte=int(min), end__gte=int(min))
#     # else:
#     return Category.objects.all()
#
#
# def blog_filter(self, request):
#     category = request.query_params.get('category')
#     user = request.query_params.get('user')
#     if category:
#
#         return Blog.objects.filter(category_id=int(category))
#     else:
#         return Blog.objects.all()

def uis_valid_transaction_order(val_id, payment_uid):
    try:
        payment = Payment.objects.get(payment_uid=payment_uid, state=PAYMENT_STATUS_DICT['Created'])
        if payment.order is None and payment.pre_order is None:
            raise NotAcceptable(str('No order or pre order id provided !'))

        url = SSL_CONF["validator_url_ssl"]
        params = {
            "val_id": val_id,
            'store_id': SSL_CONF['store_id'],
            'store_passwd': SSL_CONF['store_passwd'],
        }
        payment_log = requests.get(url, params=params).json()
        if payment_log['status'] in ['VALIDATED', 'VALID']:
            payment.details = payment_log
            payment.state = PAYMENT_STATUS_DICT['Successful']
            payment.save()

            if payment.order is not None:
                order = payment.order
                order.online_payment_details = payment_log
                order.online_paid_amount = payment.amount
                order.payment_method = 2
                order.save()

            return True
        else:
            return None
    except Exception as e:
        raise NotAcceptable(str(e))


def create_payment_ssl(validated_data, user):
    """
    const data  = JSON.stringify({
        store_id: config["SSL_STORE_ID"],
        store_passwd: config["SSL_STORE_PASSWORD"],
        total_amount: amount,
        currency: 'BDT',
        tran_id: uniqid(),
        success_url: config["SSL_SUCCESS_URL"],
        fail_url: config["SSL_FAILED_URL"],
        cancel_url: config["SSL_CANCEL_URL"],
        cus_name: cusName,
        cus_email: cusEmail,
        cus_phone: cusPhone,
        value_a: `${amount}<#>${billType}<#>${extraAgents}<#>${extraTasks}<#>${cusPhone}`
    });
    const res = await axios.get(`https://${config["SSL_PAYMENT_MODE"]}.sslcommerz.com/gwprocess/v3/api.php`, data ,{
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded'
        }
    });
    """
    amount = str(validated_data['amount'])
    payment_uid = str(uuid.uuid4())
    vendor_uid = str(uuid.uuid4())

    payment = Payment.objects.create(
        gateway=1,
        user=user,
        vendor_uid=vendor_uid,
        payment_uid=payment_uid,
        amount=amount,
    )
    # print(payment.user,payment.payment_uid)
    value_a = amount + '<#>' + str(user.id) + '<#>' + payment_uid
    url = SSL_CONF["create_url_ssl"]
    payload = {
        'store_id': SSL_CONF['store_id'],
        'store_passwd': SSL_CONF['store_passwd'],
        'total_amount': float(amount),
        'currency': 'BDT',
        'tran_id': str(uuid.uuid4()),
        'success_url': SSL_REDIRECT_URL + '?status=success',
        'fail_url': SSL_REDIRECT_URL + '?status=failed',
        'cancel_url': SSL_REDIRECT_URL + '?status=canceled',
        'cus_name': user.name,
        'cus_email': user.email,
        'cus_phone': user.phone,
        'value_a': value_a,

    }
    response = requests.post(url, data=payload)
    # print(response.json())
    return response.json()

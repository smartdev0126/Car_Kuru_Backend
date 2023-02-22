from django.test import TestCase
# Create your tests here.
from rest_framework import status
from rest_framework.test import APIClient

from apps.models import User

client = APIClient()


class ProductTestCase(TestCase):

    def setUp(self):
        self.user = User.objects.create(name='Tas', email='test@gmail.com', password='1234rtyu')



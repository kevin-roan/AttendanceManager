from rest_framework import serializers
from .models import DeptInfo


class android_serializr(serializers.ModelSerializer):
    class Meta:
        model = DeptInfo
        fields = '__all__'
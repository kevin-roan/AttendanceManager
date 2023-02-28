from rest_framework import serializers
from attendance.models import Attendence


class android_serializr(serializers.ModelSerializer):
    class Meta:
        model = Attendence
        fields = '__all__'
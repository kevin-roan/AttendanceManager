from rest_framework import serializers
from absen_reason.models import AbsentReason


class android_serializr(serializers.ModelSerializer):
    class Meta:
        model = AbsentReason
        fields = '__all__'
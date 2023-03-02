from rest_framework import serializers
from study_material.models import StudyMaterials


class android_serializr(serializers.ModelSerializer):
    class Meta:
        model = StudyMaterials
        fields = '__all__'
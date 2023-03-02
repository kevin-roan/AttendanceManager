from django.db import models
from class_reg.models import Class
# Create your models here.

class Student(models.Model):
    s_id = models.AutoField(primary_key=True)
    # c_id = models.IntegerField()
    c = models.ForeignKey(Class, to_field='c_id', on_delete=models.CASCADE)
    sem = models.CharField(max_length=50)
    name = models.CharField(max_length=50)
    email = models.CharField(max_length=50)
    phn = models.CharField(max_length=50)
    address = models.CharField(max_length=50)

    class Meta:
        # managed = False
        db_table = 'student'

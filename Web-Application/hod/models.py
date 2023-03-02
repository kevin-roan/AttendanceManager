from django.db import models

# Create your models here.


class Hod(models.Model):
    h_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=30)
    address = models.CharField(max_length=30)
    dept = models.CharField(max_length=30)
    phone = models.CharField(max_length=30)
    email = models.CharField(max_length=30)
    password = models.CharField(max_length=30)

    class Meta:
        # managed = False
        db_table = 'hod'

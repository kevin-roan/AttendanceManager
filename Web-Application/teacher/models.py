from django.db import models
from hod.models import Hod
# Create your models here.


class Teacher(models.Model):
    t_id = models.AutoField(primary_key=True)
    # h_id = models.IntegerField()
    h = models.ForeignKey(Hod, to_field='h_id', on_delete=models.CASCADE)
    name = models.CharField(db_column='Name', max_length=30)  # Field name made lowercase.
    address = models.CharField(db_column='Address', max_length=30)  # Field name made lowercase.
    dept = models.CharField(db_column='Dept', max_length=30)  # Field name made lowercase.
    phone = models.CharField(db_column='Phone', max_length=30)  # Field name made lowercase.
    email = models.CharField(db_column='Email', max_length=30)  # Field name made lowercase.
    password = models.CharField(max_length=30)

    class Meta:
        # managed = False
        db_table = 'teacher'

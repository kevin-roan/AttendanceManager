from django.db import models
from hod.models import Hod
# Create your models here.


class DeptInfo(models.Model):
    d_id = models.AutoField(db_column='D_id', primary_key=True)  # Field name made lowercase.
    # h_id = models.IntegerField(db_column='H_id')  # Field name made lowercase.
    h = models.ForeignKey(Hod, to_field='h_id', on_delete=models.CASCADE)
    dep = models.CharField(db_column='dep', max_length=30)  # Field name made lowercase.
    info = models.CharField(db_column='Info', max_length=30)  # Field name made lowercase.
    date = models.DateField(db_column='Date')  # Field name made lowercase.

    class Meta:
        # managed = False
        db_table = 'dept_info'

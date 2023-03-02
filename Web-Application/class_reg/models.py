from django.db import models
from teacher.models import Teacher
# Create your models here.


class Class(models.Model):
    c_id = models.AutoField(db_column='C_id', primary_key=True)  # Field name made lowercase.
    # t_id = models.IntegerField()
    t = models.ForeignKey(Teacher, to_field='t_id', on_delete=models.CASCADE)
    dept = models.CharField(db_column='Dept', max_length=30)  # Field name made lowercase.
    type = models.CharField(db_column='Type', max_length=30)  # Field name made lowercase.
    course = models.CharField(db_column='Course', max_length=30)  # Field name made lowercase.
    sem = models.CharField(db_column='Sem', max_length=30)  # Field name made lowercase.

    class Meta:
        # managed = False
        db_table = 'class'

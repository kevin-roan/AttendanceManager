from django.db import models
from class_reg.models import Class
from teacher.models import Teacher

# Create your models here.


class AssignClass(models.Model):
    as_id = models.AutoField(db_column='As_id', primary_key=True)  # Field name made lowercase.
    # c_id = models.IntegerField(db_column='C_id')  # Field name made lowercase.
    c = models.ForeignKey(Class, to_field='c_id', on_delete=models.CASCADE)
    # t_id = models.IntegerField()
    t = models.ForeignKey(Teacher, to_field="t_id", on_delete=models.CASCADE)
    date = models.DateField(db_column='Date')  # Field name made lowercase.

    class Meta:
        # managed = False
        db_table = 'assign_class'



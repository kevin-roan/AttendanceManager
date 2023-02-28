from django.db import models
from student.models import Student
from attendance.models import Attendence
from class_reg.models import Class

# Create your models here.


class AbsentReason(models.Model):
    ab_id = models.AutoField(db_column='Ab_id', primary_key=True)  # Field name made lowercase.
    # s_id = models.IntegerField(db_column='S_id')  # Field name made lowercase.
    s = models.ForeignKey(Student, to_field='s_id',on_delete=models.CASCADE)
    c = models.ForeignKey(Class, to_field='c_id', on_delete=models.CASCADE)
    sem = models.CharField(max_length=50)
    # a_id = models.IntegerField(db_column='A_id')  # Field name made lowercase.
    a = models.ForeignKey(Attendence,to_field='a_id',on_delete=models.CASCADE)
    reason = models.CharField(db_column='Reason', max_length=30)  # Field name made lowercase.
    date = models.DateField(db_column='Date')  # Field name made lowercase.

    class Meta:
        # managed = False
        db_table = 'absent_reason'



from django.db import models
from student.models import Student
from teacher.models import Teacher
from class_reg.models import Class
# Create your models here.


class Attendence(models.Model):
    a_id = models.AutoField(db_column='A_id', primary_key=True)  # Field name made lowercase.
    sem = models.CharField(max_length=50)
    # c_id = models.IntegerField().
    c = models.ForeignKey(Class, to_field='c_id', on_delete=models.CASCADE)
    s = models.ForeignKey(Student,to_field='s_id',on_delete=models.CASCADE)
    # t_id = models.IntegerField(db_column='T_id')  # Field name made lowercase.
    t = models.ForeignKey(Teacher,to_field='t_id',on_delete=models.CASCADE)
    date = models.DateField(db_column='Date')  # Field name made lowercase.
    attendence = models.CharField(db_column='Attendence', max_length=30)  # Field name made lowercase.
    h1 = models.CharField(db_column='H1', max_length=30)  # Field name made lowercase.
    h2 = models.CharField(db_column='H2', max_length=30)  # Field name made lowercase.
    h3 = models.CharField(db_column='H3', max_length=30)  # Field name made lowercase.
    h4 = models.CharField(db_column='H4', max_length=30)  # Field name made lowercase.
    h5 = models.CharField(db_column='H5', max_length=30)  # Field name made lowercase.
    status = models.CharField(db_column='Status', max_length=30)  # Field name made lowercase.

    class Meta:
        # managed = False
        db_table = 'attendence'

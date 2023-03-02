from django.db import models
from teacher.models import Teacher
# Create your models here.


class StudyMaterials(models.Model):
    sm_id = models.AutoField(db_column='Sm_id', primary_key=True)  # Field name made lowercase.
    # t_id = models.IntegerField()
    t = models.ForeignKey(Teacher, to_field='t_id', on_delete=models.CASCADE)
    subject = models.CharField(max_length=50)
    sem = models.CharField(max_length=30)
    file = models.CharField(max_length=30)
    date = models.DateField(db_column='Date')  # Field name made lowercase.

    class Meta:
        # managed = False
        db_table = 'study_materials'

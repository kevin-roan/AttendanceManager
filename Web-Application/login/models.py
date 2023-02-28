from django.db import models

# Create your models here.


class Login(models.Model):
    l_id = models.AutoField(db_column='L_id', primary_key=True)  # Field name made lowercase.
    type = models.CharField(db_column='Type', max_length=30)  # Field name made lowercase.
    u_id = models.CharField(max_length=30)
    username = models.CharField(max_length=30)
    password = models.CharField(max_length=30)

    class Meta:
        # managed = False
        db_table = 'login'

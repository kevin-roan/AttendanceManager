from django.shortcuts import render
from assign_class.models import AssignClass
import datetime
from teacher.models import Teacher
from class_reg.models import Class

# Create your views here.


def assign(request):
    ob = Teacher.objects.all()
    ob1 = Class.objects.all()
    context = {
        'objv':ob,
        'clas':ob1
    }
    if request.method == "POST":
        obj = AssignClass()
        obj.c_id = request.POST.get('class')
        obj.t_id = request.POST.get('teacher')
        obj.date = datetime.date.today()
        obj.save()

    return render(request,'assign_class/hod_assignclass.html',context)




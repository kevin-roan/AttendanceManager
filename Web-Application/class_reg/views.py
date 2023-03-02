from django.shortcuts import render
from class_reg.models import Class


# Create your views here.


def cls(request):
    if request.method == "POST":

        obj = Class()
        obj.dept = "CS"
        obj.type = request.POST.get('type')
        obj.course = request.POST.get('course')
        obj.sem = request.POST.get('ss')
        obj.t_id = 1
        obj.save()

    return render(request,'class/hod_registerclass.html')
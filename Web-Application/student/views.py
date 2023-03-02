from django.shortcuts import render
from student.models import Student
from class_reg.models import Class
from login.models import Login
from django.http import HttpResponse,HttpResponseRedirect
from student.srialzer import android_serializr
from rest_framework.views import Response,APIView


# Create your views here.


def studentmanage(request):
    obj = Student.objects.all()
    contexxt = {
        'objval': obj,
    }
    return render(request,'student/tchr_manage student.html',contexxt)


def stdntrgstr(request):
    b = Class.objects.all().order_by('course')
    context = {
        'ob':b
    }
    if request.method == "POST":
        ss = (request.POST.get('d'))
        ss = str(ss)
        ss = ss.split("#")
        obj = Student()
        obj.c_id = ss[0]
        obj.dept = request.POST.get('class')
        obj.name = request.POST.get('snm')
        obj.address = request.POST.get('sadr')
        obj.sem = ss[1]
        obj.phn = request.POST.get('spn')
        obj.email = request.POST.get('tem')
        obj.save()

        ob = Login()
        ob.password = request.POST.get('tpass')
        ob.type = 'student'
        ob.username = request.POST.get('tem')
        ob.u_id = obj.s_id
        ob.save()

    return render(request, 'student/tchr_register student.html',context)


def stdntupdate(request):
    if request.method == "POST":
        obj = Student()
        obj.sem = request.POST.get('sem')
        obj.name = request.POST.get('snm')
        obj.address = request.POST.get('sadr')
        obj.phn = request.POST.get('spn')
        obj.save()
    return render(request, 'student/tchr_update student.html')


def update(request,idd):
    obj = Student.objects.get(s_id=idd)
    contexxt = {
        'objval':obj
    }
    if request.method == "POST":
        obj.sem = request.POST.get('sem')
        obj.name = request.POST.get('snm')
        obj.address = request.POST.get('sadr')
        obj.phn = request.POST.get('spn')
        obj.save()
        return HttpResponseRedirect('/student/studentmanage/')

    #return HttpResponse("okkk")
    return render(request, 'student/tchr_update student.html',contexxt)


def dellete(request,idd):
    obj = Student.objects.get(s_id=idd)
    obj.delete()
    print(idd)
    return HttpResponseRedirect('/student/studentmanage/')

class student_view(APIView):
    def get(self,request):
        obj = Student.objects.all()
        ser = android_serializr(obj,many=True)
        return Response(ser.data)
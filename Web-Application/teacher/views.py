from django.shortcuts import render
from teacher.models import Teacher
from login.models import Login
from django.http import HttpResponse,HttpResponseRedirect

# Create your views here.


def tchrreg(request):
    if request.method == "POST":
        obj = Teacher()
        obj.h_id = 1
        obj.dept = 'cs'
        obj.name = request.POST.get('tnm')
        obj.address = request.POST.get('tadr')
        obj.phone = request.POST.get('tpn')
        obj.email = request.POST.get('tem')
        obj.password = request.POST.get('tpass')
        obj.save()
        ob = Login()
        ob.username = request.POST.get('tem')
        ob.type = "teacher"
        ob.password = request.POST.get('tpass')
        ob.u_id = obj.t_id
        ob.save()



    return render(request,'teacher/hod_teacherreg.html')


def tchrupdate(request):
    if request.method == "POST":
        obj = Teacher()
        obj.h_id = 1
        obj.dept = request.POST.get('dep')
        obj.name = request.POST.get('tnm')
        obj.address = request.POST.get('tadr')
        obj.phone = request.POST.get('tpn')
        obj.save()
    return render(request,'teacher/hod_update teacher.html')


def tchrmanage(request):
        obj = Teacher.objects.all()
        contexxt = {
            'objval': obj,
        }
        return render(request,'teacher/hod_manageteacher.html',contexxt)


def update(request,idd):
    obj = Teacher.objects.get(t_id=idd)
    contexxt = {
        'objval':obj
    }
    if request.method == "POST":
        obj.dept = request.POST.get('dep')
        obj.name = request.POST.get('tnm')
        obj.address = request.POST.get('tadr')
        obj.phone = request.POST.get('tpn')
        obj.save()
        return HttpResponseRedirect('/teacher/tchrmanage/')

    #return HttpResponse("okkk")
    return render(request, 'teacher/hod_update teacher.html',contexxt)




def delete(request,idd):
    obj = Teacher.objects.get(t_id=idd)
    obj.delete()
    return HttpResponseRedirect('/teacher/tchrmanage/')

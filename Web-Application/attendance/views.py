from django.shortcuts import render
from attendance.models import Attendence
from class_reg.models import Class
from django.http import HttpResponse,HttpResponseRedirect
from attendance.srialzer import android_serializr
from rest_framework.views import Response,APIView
from student.models import Student
import datetime
from django.db.models import Q
# Create your views here.

def viewattendence(request):
    b = Class.objects.all()
    context = {
        'ob': b
    }
    if request.method == 'POST':
        s = request.POST.get('s')
        c = request.POST.get('c')
        obj = Attendence.objects.filter(sem=s,c_id=c)
        le = len(obj)
        if le >0:
            le=""
        else:
            le = "No attendanace data found "
        contexxt = {
            'objval': obj,
            'ob': b,
            'le':le
        }
        return render(request, 'attendance/hod_viewattendence.html', contexxt)
    return render(request,'attendance/hod_viewattendence.html',context)



def viewattendenceteacher(request):
    b = Class.objects.all()
    context = {
        'ob': b
    }
    if request.method == 'POST':
        s = request.POST.get('s')
        c = request.POST.get('c')
        obj = Attendence.objects.filter(sem=s,c_id=c)
        le = len(obj)
        if le >0:
            le=""
        else:
            le = "No attendanace data found "
        contexxt = {
            'objval': obj,
            'ob': b,
            'le':le
        }
        return render(request, 'attendance/teacherview.html', contexxt)
    return render(request,'attendance/teacherview.html',context)


def markattendence(request):
    b = Class.objects.all()
    context = {
        'ob': b
    }
    if request.method == 'POST':
        s = request.POST.get('s')
        c = request.POST.get('c')

        request.session['sem'] = s
        request.session['co'] = c

        return HttpResponseRedirect('/attendance/marking/')


    return render(request,'attendance/tchr_mark attendence.html',context)

def marking(request):
    da = datetime.date.today()
    cas = Attendence.objects.filter(sem=request.session['sem'], c_id=request.session['co'], date=da).values_list('status')
    print(cas)
    r1 = ""

    res = ""
    for x in cas:
        # print(x)
        res = x[-1]
    if len(cas) == 0 :
        res = "1st period"
    else:
        r1 = int(res) + 1
    print(res)
    obj = Student.objects.filter(sem=request.session['sem'], c_id=request.session['co'])
    le = len(obj)
    if le > 0:
        le = ""
    else:
        le = "No data found "
    contexxt = {
        'objval': obj,
        'le': le,
        'cas':res,
        'cas1':r1
    }
    return render(request,'attendance/mark_attendanc.html',contexxt)


def absent(request,idd):

    stid = idd
    sem = request.session['sem']
    c_id = request.session['co']
    tid = request.session['uid']
    da = datetime.date.today()
    if Attendence.objects.filter(s_id=stid,date=da).exists():
        print('if 1')
        query1 = Attendence.objects.get(s_id=stid, date=da)

        h1 = query1.h1
        h2 = query1.h2
        h3 = query1.h3
        h4 = query1.h4
        h5 = query1.h5

        if str(query1.status) == '1':

            query1.h2 = "A"
            query1.status = 2
            query1.attendence = "2nd Hour Absent"
            query1.save()
        elif str(query1.status) == '2':

            query1.h3 = "A"
            query1.status = 3
            query1.attendence = "3rd Hour Absent"
            query1.save()
        elif str(query1.status) == '3':


            query1.h4 = "A"
            query1.status = 4
            query1.attendence = "4th Hour Absent"
            query1.save()
        elif str(query1.status) == '4':


            query1.h5 = "A"
            query1.status = 5
            query1.attendence = "5th Hour Absent"
            query1.save()


    else:
        print('1st hour marked')
        obj = Attendence()
        obj.s_id = stid
        obj.c_id = c_id
        obj.sem = sem
        obj.t_id = tid
        obj.date = da
        obj.attendence = '1st Hour Absent'
        obj.status = 1
        obj.h1 = 'A'
        obj.h2 = 0
        obj.h3 = 0
        obj.h4 = 0
        obj.h5 = 0
        obj.save()
    return HttpResponseRedirect('/attendance/marking/')


def present(request, idd):

    stid = idd
    sem = request.session['sem']
    c_id = request.session['co']
    tid = request.session['uid']
    da = datetime.date.today()
    if Attendence.objects.filter(s_id=stid,date=da).exists():
        print('if 1')
        query1 = Attendence.objects.get(s_id=stid, date=da)

        h1 = query1.h1
        h2 = query1.h2
        h3 = query1.h3
        h4 = query1.h4
        h5 = query1.h5

        if str(query1.status) == '1':


            query1.h2 = "P"
            query1.status = 2
            query1.attendence = "2nd Hour  Present"
            query1.save()
        elif str(query1.status) == '2':


            query1.h3 = "P"
            query1.status = 3
            query1.attendence = "3rd Hour Present"
            query1.save()
        elif str(query1.status) == '3':


            query1.h4 = "P"
            query1.status = 4
            query1.attendence = "4th Hour Present"
            query1.save()
        elif str(query1.status) == '4':



            query1.h5 = "P"
            query1.status = 5
            query1.attendence = "5th Hour Present"
            query1.save()


    else:
        print('1st hour marked')
        obj = Attendence()
        obj.s_id = stid
        obj.c_id = c_id
        obj.sem = sem
        obj.t_id = tid
        obj.date = da
        obj.attendence = '1st Hour Present'
        obj.status = 1
        obj.h1 = 'P'
        obj.h2 = 0
        obj.h3 = 0
        obj.h4 = 0
        obj.h5 = 0
        obj.save()
    return HttpResponseRedirect('/attendance/marking/')


class attend_view(APIView):
    def get(self,request):
        obj = Attendence.objects.all()
        ser = android_serializr(obj,many=True)
        return Response(ser.data)
from django.shortcuts import render
from login.models import Login
from django.core.mail import send_mail
from teacher.models import Teacher
from hod.models import Hod
from django.http import HttpResponse
from login.srialzer import android_serializr
from rest_framework.views import Response,APIView


# Create your views here.


def forgot(request):
    if request.method == "POST":
        uname = request.POST.get("username")
        try:
            obj = Login.objects.get(username=uname)
            uid = obj.u_id
            pa = obj.password
            ty = obj.type

            print('test')
            if ty == "teacher":
                print('teacher')
                ob = Teacher.objects.get(t_id=uid)
                em = ob.email
                print(em)

                send_mail('Attendance Prediction',
                          'Hi ' + uname + ' Your Forgotten password is..:' + " " + pa,
                          'sendmail.project009@gmail.com',
                          [em],
                          fail_silently=True)
            elif ty == "hod":

                print('hod')
                ob = Hod.objects.get(h_id=uid)
                em = ob.email

                send_mail('Attendance Prediction',
                          'Hi ' + uname + ' Your Forgotten password is..:' + " " + pa,
                          'sendmail.project009@gmail.com',
                          [em],
                          fail_silently=True)

            objlist = "Password send to your email address... Check your mail."
            context = {
                'msg': objlist
            }
            return render(request, 'login/forgot_passwrd.html', context)

        except:
            print("False")
    return render(request, 'login/forgot_passwrd.html')

def hodlogin(request):
    if request.method == "POST":
        u = request.POST.get("username")
        p = request.POST.get("password")
        obj = Login.objects.filter(username=u, password=p)
        for ob in obj:
            tp = ob.type
            uid = ob.u_id

            if tp == "hod":
                request.session['uid'] = uid
                return render(request, 'tmp/hodhome.html')
            elif tp == "teacher":
                request.session['uid'] = uid
                return render(request, 'tmp/teacherhome.html')


    return render(request,'login/hod_login.html')


def hod_home(request):
    return render(request,'tmp/hodhome.html')

def teacher_home(request):
    return render(request,'tmp/teacherhome.html')

class login_view(APIView):
    def post(self,request):
        obj = Login.objects.filter(username=request.data['unm'],password=request.data['pa'],type='student')
        ser = android_serializr(obj,many=True)
        return Response(ser.data)
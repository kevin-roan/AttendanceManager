from django.shortcuts import render
from department.models import DeptInfo
from django.http import HttpResponse
from .srialzer import android_serializr
from rest_framework.views import Response,APIView


# Create your views here.

def dept(request):
    if request.method == "POST":
        obj = DeptInfo()
        obj.date = request.POST.get('date')
        obj.dep = "cs"
        obj.info = request.POST.get('dinfo')
        obj.h_id= 1
        obj.save()
    return render(request,'department/hod_postdepinfo.html')


class login_view(APIView):
    def get(self,request):
        obj = DeptInfo.objects.all()
        ser = android_serializr(obj,many=True)
        return Response(ser.data)

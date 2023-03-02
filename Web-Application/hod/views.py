from django.shortcuts import render
from hod.models import Hod
from login.models import Login
# Create your views here.

def hodreg(request):
    if request.method == "POST":
        obj = Hod()
        obj.dept = 'cs'
        obj.name = request.POST.get('hnm')
        obj.address = request.POST.get('hadr')
        obj.phone = request.POST.get('hpn')
        obj.email = request.POST.get('hem')
        obj.password = request.POST.get('hpass')
        obj.save()
        ob=Login()
        ob.username=request.POST.get('hem')
        ob.type="hod"
        ob.password=request.POST.get('hpass')
        ob.u_id=obj.h_id
        ob.save()

    return render(request,'hod/hod_reg.html')


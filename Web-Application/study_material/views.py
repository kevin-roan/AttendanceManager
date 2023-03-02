from django.shortcuts import render
from study_material.models import StudyMaterials
from django.http import HttpResponse
from study_material.srialzer import android_serializr
from rest_framework.views import Response,APIView
from django.core.files.storage import FileSystemStorage

# Create your views here.


def studymaterials(request):
    if request.method == "POST":
        print("ok")

        obj = StudyMaterials()
        # obj.sm_id = request.POST.get('cls')
        obj.t_id = request.session['uid']
        obj.subject = request.POST.get('sub')
        obj.sem = request.POST.get('sem')
        mycover = request.FILES['file']
        ff = FileSystemStorage()
        filename = ff.save(mycover.name, mycover)
        obj.file = mycover.name
        obj.date = request.POST.get('date')
        obj.save()

    return render(request,'study_material/tchr_upload studymaterials.html')

class stdy_view(APIView):
    def get(self,request):
        obj = StudyMaterials.objects.all()
        ser = android_serializr(obj,many=True)
        return Response(ser.data)
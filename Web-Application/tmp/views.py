from django.shortcuts import render

# Create your views here.


def hod(request):
    return render(request,'tmp/hodhome.html')


def tea(request):
    return render(request,'tmp/teacherhome.html')

"""Attendance_prediction URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from django.conf.urls import url,include
from login import views
urlpatterns = [
    path('admin/', admin.site.urls),
    url(r'^absent/',include('absen_reason.a_url')),
    url(r'^assign_class/',include('assign_class.url')),
    url(r'^attendance/',include('attendance.url')),
    url(r'^class/',include('class_reg.c_url')),
    url(r'^department/',include('department.url')),
    url(r'^login/',include('login.url')),
    url(r'^student/',include('student.url')),
    url(r'^study_material/',include('study_material.url')),
    url(r'^teacher/',include('teacher.url')),
    url(r'^tmp/', include('tmp.url')),
    url(r'^hod/', include('hod.urls')),
    url(r'^forgot/', include('login.url')),
    url(r'^$', views.hodlogin),

]

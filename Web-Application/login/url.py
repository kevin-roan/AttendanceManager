from django.conf.urls import url
from login import views


urlpatterns  = [
    url(r'^hodlogin/',views.hodlogin),
    url(r'^forgot/',views.forgot),
    url(r'^hodhome/',views.hod_home),
    url(r'^teacherhome/',views.teacher_home),
    url(r'^android/', views.login_view.as_view())


]
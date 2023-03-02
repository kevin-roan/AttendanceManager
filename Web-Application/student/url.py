from django.conf.urls import url
from student import views


urlpatterns  = [
    url(r'^studentmanage/',views.studentmanage),
    url(r'^stdntrgstr/',views.stdntrgstr),
    url(r'^stdntupdate/',views.stdntupdate),
    url(r'^s_update/(?P<idd>\w+)',views.update,name='sup'),
    url(r'^delete/(?P<idd>\w+)',views.dellete,name='sdel'),
    url(r'^android/', views.student_view.as_view())
]
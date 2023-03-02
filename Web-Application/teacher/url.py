from django.conf.urls import url
from teacher import views


urlpatterns  = [
    url(r'^tchrreg/',views.tchrreg),
    url(r'^tchrupdate/',views.tchrupdate),
    url(r'^tchrmanage/',views.tchrmanage),
    url(r'^t_update/(?P<idd>\w+)',views.update,name='tup'),
    url(r'^t_del/(?P<idd>\w+)',views.delete,name='t_del'),
]
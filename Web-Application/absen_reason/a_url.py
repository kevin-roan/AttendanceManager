from django.conf.urls import url
from absen_reason import views


urlpatterns  = [
    url(r'^predict/',views.predict),
    url(r'^android/',views.absent_view.as_view()),
    url(r'^pre/(?P<idd>\w+)',views.pre,name='pppp'),
    url(r'^ab_del/(?P<idd>\w+)',views.delete,name='ab_del'),

]
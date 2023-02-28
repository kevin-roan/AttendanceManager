from django.conf.urls import url
from attendance import views


urlpatterns = [
    url(r'^h_view/',views.viewattendence),
    url(r'^teach_view/', views.viewattendenceteacher),
    url(r'^mark/',views.markattendence),
    url(r'^marking/', views.marking),
    url(r'^android/',views.attend_view.as_view()),
    url(r'^m/(?P<idd>\w+)', views.present, name='pr'),
    url(r'^mm/(?P<idd>\w+)', views.absent, name='ab'),
]
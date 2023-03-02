from django.conf.urls import url
from tmp import views


urlpatterns = [
    url(r'^hod/',views.hod),
    url(r'^tea/',views.tea),
]
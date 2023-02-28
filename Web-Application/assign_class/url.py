from django.conf.urls import url
from assign_class import views


urlpatterns = [
    url(r'^assign/',views.assign),
]
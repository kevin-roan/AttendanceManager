from django.conf.urls import url
from department import views


urlpatterns  = [
    url(r'^dept/',views.dept),
    url(r'^android/', views.login_view.as_view())

]
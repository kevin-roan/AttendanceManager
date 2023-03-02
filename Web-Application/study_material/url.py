from django.conf.urls import url
from study_material import views


urlpatterns  = [
    url(r'^studymaterials/',views.studymaterials),
    url(r'^android/',views.stdy_view.as_view())

]
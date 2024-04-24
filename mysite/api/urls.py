from django.urls import path
from . import views

urlpatterns = [
    path('blogposts/', views.BlogPostListCreat.as_view(), name= "creat-blogpost-views"),
    path(
        'blogposts/<int:pk>/',
        views.BlogPostRetrieveUpdateDestory.as_view(),
        name = "update"
        ),
]
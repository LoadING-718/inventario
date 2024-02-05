from django.shortcuts import render
from rest_framework import generics, status
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.permissions import AllowAny
from productos.models import Products
from productos.serializers import ProductsSerializer


# Create your views here.

#Create 

class CreateProducts(APIView): 
    permission_classes = (AllowAny, )
    
    def post(self, request):
        serializer = ProductsSerializer(data=request.data)
        serializer.is_valid(raise_exception=True) 
        serializer.save()
        return Response({'message':'Creado'} , status=status.HTTP_201_CREATED)
    

#Read
 
#class ProductsListView(generics.ListAPIView):
#    queryset = Productos.objects.all()
#    serializer_class = ProductosSerializer

class ProductsListView(APIView):
    permission_classes =(AllowAny,)

    def get(self, request):
        products_list = Products.objects.all()
        serializer = ProductsSerializer(products_list, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)
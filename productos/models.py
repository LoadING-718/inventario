from django.db import models

# Create your models here.

class Products(models.Model):
    name = models.CharField(max_length=250, verbose_name='Nombre del Producto')
    internal_ref = models.CharField(max_length=8, verbose_name= 'Referencia Interna')
    sales_price = models.DecimalField(max_digits=8, decimal_places=2, verbose_name="Precio de venta")
    cost = models.DecimalField(max_digits=8, decimal_places=2, verbose_name="Costo")
    available_quantity = models.IntegerField(default=0, verbose_name="Cantidad disponible")

    class Meta:
        db_table = 'products'
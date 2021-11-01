import 'package:carde/Models/Producto.dart';
import 'package:carde/Views/detalle_product.dart';
import 'package:flutter/material.dart';

class ListaProductos extends StatelessWidget {
  static String page_name="details";
  final List<Producto> productos;
  const ListaProductos({@required this.productos, Producto producto}) ;

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      height: double.infinity,
      child: ListView.builder(
        itemBuilder: (conte, index) {
          return Hero(tag: productos[index].sId,
              child: Card(
            elevation: 20,
            child: ListTile(
              leading: FadeInImage(
                image: NetworkImage(productos[index].img),
                placeholder: AssetImage("assets/images/loader.gif"),

              ),
              onTap: (){

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetalleProduct(producto: productos[index]),
                  ),
                );
              },
              title: Text(productos[index].nombre),
            ),
          ));
        },
        itemCount: productos.length,
      ),
    );
  }
}

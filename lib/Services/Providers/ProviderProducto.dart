import 'dart:convert';
import 'package:carde/Models/Producto.dart';
import 'package:http/http.dart' as http;

class Provider{
  Future<List<Producto>> getProductos() async {
    var url ="https://hakim-backend-productos.herokuapp.com/productos";
    final respuesta = await http.get(url);
    final descodeData = json.decode(respuesta.body);
    final productos = new Productos.fromJsonList(descodeData['productos']);
    return productos.items;

  }
  Future<List<Producto>> buscarProducto( String query ) async {
    var url ="https://hakim-backend-productos.herokuapp.com/producto/"+query;
    final respuesta = await http.get(url);
    final descodeData = json.decode(respuesta.body);
    final productos = new Productos.fromJsonList(descodeData['productos']);
    return productos.items;

  }
}

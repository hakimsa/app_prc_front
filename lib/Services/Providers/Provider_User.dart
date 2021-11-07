import 'dart:convert';
import 'package:carde/Models/User.dart';
import 'package:http/http.dart' as http;

class ProviderUser {
  Future<User> buscarUser(String query) async {
    var url = "http://192.168.1.40:7566/userss/"+query;
    final respuesta = await http.get(url);
    if (respuesta.statusCode == 200)
      print("ok");
      final descodeData = json.decode(respuesta.body);
        final users = new User.fromJsonMap(descodeData['data']);
        return users;

  }

  Future<List<User>> buscarProducto( String query ) async {
    var url ="http://192.168.1.40:7566/userss/"+query;
    final respuesta = await http.get(url);
    final descodeData = json.decode(respuesta.body);
    final productos = new Users.fromJsonList(descodeData['productos']);
    return productos.items;

  }

  Future<List<User>> getUsers() async {
    var url = "http://192.168.1.40:7566/users";
    final respuesta = await http.get(url);
    final descodeData = json.decode(respuesta.body);
    if (respuesta.statusCode == 200) {
      print(" request Ok : 200");
      final users = new Users.fromJsonList(descodeData['data']);

      return users.items;
    }
    return [];
  }
}
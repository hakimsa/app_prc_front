class Productos {
  List<Producto> items=[];

  Productos();

  Productos.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final produc = new Producto.fromJsonMap(item);
      items.add(produc);
    }
  }
}
class Producto {
  String sId;
  String nombre;
  String categoria;
  String precio;
  String descripcion;
  String img;

  Producto(
      {this.sId,
        this.nombre,
        this.categoria,
        this.precio,
        this.descripcion,
        this.img});

  Producto.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    nombre = json['nombre'];
    categoria = json['categoria'];
    precio = json['precio'];
    descripcion = json['descripcion'];
    img = json['img'];
  }



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['nombre'] = this.nombre;
    data['categoria'] = this.categoria;
    data['precio'] = this.precio;
    data['descripcion'] = this.descripcion;
    data['img'] = this.img;
    return data;
  }
  Producto.fromJsonMap( Map<String, dynamic> json ) {

    nombre        = json['nombre'];
    sId               = json['_id'];
    categoria            = json['categoria'];
    precio      = json['precio'] ;
    descripcion            = json['descripcion'];
    img       = json['img'] ;




  }
}
import 'package:carde/Models/Producto.dart';
import 'package:flutter/material.dart';

class DetalleProduct extends StatelessWidget {

  static final String pagename="details";
  final Producto producto;
  const DetalleProduct({Key key, @required this.producto});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: postera(context));
  }

  poster() {
    return Stack(
      children: <Widget>[
        Column(children: <Widget>[
          Container(
            height: 250,
            width: double.infinity,
            child: FadeInImage(
              fadeInCurve: Curves.fastOutSlowIn,
              fadeOutDuration: Duration(seconds: 5),
              placeholder: AssetImage('assets/original.gif'),
              image: NetworkImage(producto.img),
              fit: BoxFit.cover,
            ),
          ),
        ]),

        // height: 300,
      ],
    );
  }

  Titulo() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
              onPressed: () {
                print("Add to Carrito");
              },
              child:Container(child:  Icon(Icons.shopping_cart_outlined),width:50,height:50,decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color: Color.fromRGBO(77, 77,77, 0.15)),)),
          TextButton(
              onPressed: () {
                print("Buy now");
              },
              child:Container(child:  Center(child: Text("Buy"),),width:50,height:50,decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color: Color.fromRGBO(77, 77,77, 0.15)),)),
        ],
      ),
    );
  }

  descripcion() {
    return Row(
      children: <Widget>[
        Hero(
          tag: producto.sId,
          child: Card(
            elevation: 10,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.3)),
            child: Container(
              child: SizedBox(
                child: Image.network(producto.img),
                width: 90,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Flexible(
            child: Container(
                padding: const EdgeInsets.all(0),
                margin: EdgeInsets.symmetric(vertical: 4.0),
                child: ListTile(
                    subtitle: Text(producto.descripcion.toString()),
                    title: Text(
                      producto.categoria,
                      textAlign: TextAlign.justify,

                    ),
                    trailing: Text(
                      producto.precio + "€",
                      textAlign: TextAlign.justify,
                      style: TextStyle(color: Colors.deepOrangeAccent),

                    ))))
      ],
    );
  }

  /*valoracion() {
    var ratio;
   var p=double.parse(producto.precio);
    if (p > 848.0) {
      ratio = 5.0;
    } else if (p == 7.1) {
      ratio = 4.0;
    } else if ((p == 5.0) |(p == 6.7)) {

      ratio = 3.5;
    } else
      ratio = 2.0;
    return RatingBar(
      itemSize: 13.3,
      initialRating: ratio,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,

      itemPadding: EdgeInsets.symmetric(horizontal: 3.0),
      );
  }*/

  postera(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(top: 10, left: 110, child: Container(color: Colors.purple,width: 56,height: 52,child: Text(producto.nombre),)),
        Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.network(
              producto.img,
              fit: BoxFit.cover,
            )),
        SafeArea(
            child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                MaterialButton(
                  padding: const EdgeInsets.all(8.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  textColor: Colors.grey,
                  minWidth: 0,
                  height: 40,
                  onPressed: () => Navigator.pop(context),
                ),
              ]),
            ),
            Spacer(),
            Expanded(
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white),
                    child: Column(children: <Widget>[
                      const SizedBox(height: 30.0),
                      Expanded(
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Titulo(),
                              descripcion(),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 8.0),
                                child: Text(
                                  producto.nombre.toString(),
                                  style: TextStyle(color: Colors.grey.shade600),
                                ),
                              ),
                              ExpansionTile(
                                title: Text(
                                  "Show Detail",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.topLeft,
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(producto.descripcion,style: TextStyle(color: Color.fromRGBO(77, 77, 77, 1)),),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ])))
          ],
        ))
      ],
    );
  }
}

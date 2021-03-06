import 'package:carde/Models/Producto.dart';
import 'package:carde/Utils/cardetheme.dart';
import 'package:carde/Views/detalle_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CardWidgtSwiper extends StatelessWidget {
   final List<Producto> productos;

  CardWidgtSwiper({@required this.productos});

  final theme = FooderlichTheme.dark();

  @override
  Widget build(BuildContext context) {
    var _screensize = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.only(top: 10),
        child: ListView(
          children: [
        _card_scroll(context),

          ],
        ));
  }


  _card_scroll(BuildContext context) {
    var _screensize = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: 500,
      child:     Swiper(
          layout: SwiperLayout.STACK,
          itemHeight: _screensize.height * 0.65,
          itemWidth: _screensize.height * 0.5,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(productos[index].img),
                    fit: BoxFit.fitHeight,
                  ),
                  color: Color.fromRGBO(777, 777, 777, 0.75),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Stack(
                children: [
                  Positioned(
                    top: 89,
                    child: Container(
                      margin: EdgeInsets.all(30),
                      child: Text(
                        productos[index].nombre,
                      ),
                    ),
                  ),
                  Positioned(
                      top: 230,
                      left: 40,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 1),
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 05.0,
                                // has the effect of softening the shadow
                                spreadRadius: 0.10,
                                // has the effect of extending the shadow
                                offset: Offset(
                                  08.0, // horizontal, move right 10
                                  1.0, // vertical, move down 10
                                ),
                              )
                            ],
                            color: Color.fromRGBO(227, 277, 227, 0.65),
                            borderRadius: BorderRadius.circular(100)),
                        child: Center(
                          child: Text(
                            productos[index].precio + " ???",
                            style: TextStyle(
                                color: Colors.white, fontSize: 25),
                          ),
                        ),
                      )),
                  Positioned(
                      top: 180,
                      left: 100,
                      child: Text(
                        productos[index].descripcion,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ))
                ],
              ),
            );
          },
          autoplay: true,
          itemCount: productos.length,
          scrollDirection: Axis.horizontal,
          onTap: (index) {


              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetalleProduct(producto: productos[index]),
                ),
              );
            },

          pagination: new SwiperPagination(alignment: Alignment.topCenter),
          //control: new SwiperControl(),
        ),

    );
  }
}

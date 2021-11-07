import 'package:carde/Models/Producto.dart';
import 'package:carde/Services/Providers/ProviderProducto.dart';
import 'package:carde/Widgets/card_widget_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProdutoItem extends StatefulWidget {
  const ProdutoItem({Key key}) : super(key: key);

  @override
  _ProdutoItemState createState() => _ProdutoItemState();
}

class _ProdutoItemState extends State<ProdutoItem> {
  final providerproduto=new Provider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _swiperTarjetas()
    );
  }

  itms(BuildContext context) {
    return Container(

      constraints: BoxConstraints.expand(
        width: 400,
        height: 300,
      ),

      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage("")
        ,fit: BoxFit.cover),
        gradient: LinearGradient(
          colors: [
            Colors.white,
            Colors.white,
            Colors.orangeAccent
          ]
        ),
        borderRadius: BorderRadius.circular(26)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
    Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: 120,
      height: 120,
      child: Center(child: Text("SALOM ALIKOM"),),
      decoration: BoxDecoration(
        color: Color.fromRGBO(77,77, 77, 0.65),
      borderRadius: BorderRadius.circular(100)
    ),)
          ,Icon(Icons.radio)
        ],
      ),
    );
  }

  Widget _swiperTarjetas() {
    return FutureBuilder(
        future: providerproduto.getProductos(),
        builder: (BuildContext context, AsyncSnapshot<List<Producto>> snapshot) {
          if (snapshot.hasData) {
            return CardWidgtSwiper(productos: snapshot.data);
          } else {
            return Center(child:Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                Text("esper por favor")
              ],
            ));
          }
        });
  }
}

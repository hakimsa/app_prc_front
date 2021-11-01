import 'package:carde/Models/Producto.dart';
import 'package:carde/Models/User.dart';
import 'package:carde/Search/Search_delegate.dart';
import 'package:carde/Services/Providers/ProviderProducto.dart';
import 'package:carde/Services/Providers/Provider_User.dart';
import 'package:carde/Utils/cardetheme.dart';
import 'package:carde/Views/produto_item.dart';
import 'package:carde/Widgets/users_card.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'lista_productos.dart';
import 'menu.dart';

class BottomNavBar extends StatefulWidget {
  static final String pagename = "home";
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final theme = FooderlichTheme.dark();
  @override
  Widget build(BuildContext context) {
    return Scaffold(


drawer: Menu(),
        appBar: AppBar(
          elevation: 20,
          actions: <Widget>[

            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: DataSearch(),
                );
              },
            )
          ],
          backgroundColor: Colors.green,
          // leading: Builder(
          //   builder: (BuildContext context) {
          //     return IconButton(
          //       icon: const Icon(Icons.menu),
          //       onPressed: () {
          //
          //
          //       },
          //     //  tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          //       focusColor: Colors.lightGreen,
          //
          //
          //     );
          //   },
          // ),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          height: 60.0,
          items: <Widget>[
            Icon(Icons.home_outlined, size: 30),
            Icon(Icons.list, size: 30),
            Icon(Icons.emoji_food_beverage, size: 30),
            Icon(Icons.shopping_cart_outlined, size: 30),
            Icon(Icons.perm_identity, size: 30),
          ],
          color: theme.backgroundColor,
          buttonBackgroundColor: theme.bottomAppBarColor,
          backgroundColor: Colors.lightGreen,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
          letIndexChange: (index) => true,
        ),
        body: _pages.elementAt(_page));
  }

  static swiperTarjetas() {
final providerusers=new ProviderUser();
    return FutureBuilder(
        future:providerusers.getUsers(),
        builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
          if (snapshot.hasData) {
            return UsersCard(users: snapshot.data);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
static listado_product(){

  final providerprodcuto=new Provider();


  return FutureBuilder(
      future: providerprodcuto.getProductos(),
      builder: (BuildContext context, AsyncSnapshot<List<Producto>> snapshot) {
        if (snapshot.hasData) {
          return ListaProductos(productos: snapshot.data);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      });



}
  List<Widget> _pages = <Widget>[
    ProdutoItem(),
    Container(
        child: Center(
          child: Container(child: listado_product()),
        )),
    Container(
        child: Center(
      child: Container(child: listado_product()),
    )),
    Container(
        child: Center(
      child: Container(child: swiperTarjetas()),
    )),
    Container(
        child: Center(
      child: Container(child: swiperTarjetas()),
    )),
  ];
}

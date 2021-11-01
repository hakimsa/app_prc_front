import 'package:carde/Services/Providers/Provider_User.dart';
import 'package:carde/Widgets/BottomNavBar.dart';
import 'package:carde/Widgets/menu.dart';
import 'package:flutter/material.dart';

import '../Utils/cardetheme.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key key}) : super(key: key);
  static final String pagename="Home";

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  AnimationController _controller;
  final theme = FooderlichTheme.dark();
  final provdier_user = new ProviderUser();

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(child:Menu() ,),
      appBar: AppBar(),
      bottomNavigationBar: BottomNavBar(),
      body: ListView(
        children: [
          cardnews(context),
        ],
      ),
    );
  }

  cardnews(BuildContext context) {
    return FutureBuilder(
        future: provdier_user.getUsers(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot == null) {
            return Container(
              child: Center(
                child: Text("No hay data "),
              ),
            );
          }
          return Container(
            transform: Matrix4.translationValues(0.0, -20.0, 0.0),
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
            padding: EdgeInsets.all(09),
            constraints: const BoxConstraints.expand(
              width: 350,
              height: 450,
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://www.goodfreephotos.com/cache/people/young-asian-female-model.jpg"),
                    fit: BoxFit.cover),
                color: Colors.deepOrange,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Stack(
              children: [
                Positioned(
                  child: Text(
                    "snapshot.data.toString(),",
                    style: theme.textTheme.headline1,
                  ),
                ),
                Positioned(
                    top: 400,
                    left: 55,
                    child: Text(
                      "xonyundzig@gmail.com",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    )),
                Positioned(
                    top: 380,
                    left: 200,
                    child: Text(
                      "622837845",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ))
              ],
            ),
          );
        });
  }
}

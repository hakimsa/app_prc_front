import 'package:carde/Models/User.dart';
import 'package:carde/Widgets/menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DetailsUser extends StatefulWidget {
  const DetailsUser({Key key}) : super(key: key);

  @override
  _DetailsUserState createState() => _DetailsUserState();
}

class _DetailsUserState extends State<DetailsUser> {
  final sleep = Duration(seconds: 3);
  double _width = 100; // the width at the beginning
  double _height = 100; // the height at the beginning
  Color _color = Colors.yellow; // the color at the beginning
  @override
  void initState() {
    // TODO: implement initState
  }
  void _start() {
    setState(() {
      _width = 300;
      _height = 300;
      _color = Colors.red;
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context).settings.arguments as User;
    return Scaffold(
        appBar: AppBar(),
        body: ListView(
          children: [
            Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                color: Color.fromRGBO(245, 255, 255, 0.25),
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(55),bottomLeft: Radius.circular(55))
              ),
                width: 400, height: 300, child:  ExpansionTile(
              title: Text(
                "Datos personales",
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold),
              ),
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceAround,
                        children: const <Widget>[
                          Icon(
                            Icons.favorite,
                            color: Colors.pink,
                            size: 24.0,
                            semanticLabel:
                            'Text to announce in accessibility modes',
                          ),
                          Icon(
                            Icons.audiotrack,
                            color: Colors.green,
                            size: 30.0,
                          ),
                          Icon(
                            Icons.beach_access,
                            color: Colors.blue,
                            size: 36.0,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          TextButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.add),
                              label: Text(
                                  "añadir a mis contactos"))
                        ],
                      ),
                      Row(
                        children: [
                          TextButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.precision_manufacturing_rounded),
                              label: Text(
                                  "Ver Proyectos"))
                        ],
                      ),
                      Row(
                        children: [
                          TextButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.help_outline),
                              label: Text(
                                  "Aboute mi"))
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

              //         Flexible(
              //             flex: 1,
              //             fit: FlexFit.tight,
              //             child: Container(
              //               padding: EdgeInsets.all(20),
              //               margin: EdgeInsets.all(20),
              //               child: Column(
              //                 children: [
              //                   Text(user.lastname + " " + user.firstname),
              //                   Text(user.role + " " + user.age.toString()),
              //                   Text(user.email),
              //                   Text(user.addess),
              //                   ExpansionTile(
              //                     title: Text(
              //                       "Telefono",
              //                       style: TextStyle(
              //                           color: Colors.green,
              //                           fontWeight: FontWeight.bold),
              //                     ),
              //                     children: <Widget>[
              //                       Container(
              //                         alignment: Alignment.topLeft,
              //                         padding: const EdgeInsets.all(16.0),
              //                         child: Text(
              //                           user.telefon,
              //                           style: TextStyle(
              //                               color: Color.fromRGBO(
              //                                   255, 255, 255, 0.77)),
              //                         ),
              //                       )
              //                     ],
              //                   ),
              //                   ExpansionTile(
              //                     title: Text(
              //                       "Email",
              //                       style: TextStyle(
              //                           color: Colors.green,
              //                           fontWeight: FontWeight.bold),
              //                     ),
              //                     children: <Widget>[
              //                       Container(
              //                         alignment: Alignment.topLeft,
              //                         padding: const EdgeInsets.all(16.0),
              //                         child: Column(
              //                           children: [
              //                             Row(
              //                               mainAxisAlignment:
              //                               MainAxisAlignment.spaceAround,
              //                               children: const <Widget>[
              //                                 Icon(
              //                                   Icons.favorite,
              //                                   color: Colors.pink,
              //                                   size: 24.0,
              //                                   semanticLabel:
              //                                   'Text to announce in accessibility modes',
              //                                 ),
              //                                 Icon(
              //                                   Icons.audiotrack,
              //                                   color: Colors.green,
              //                                   size: 30.0,
              //                                 ),
              //                                 Icon(
              //                                   Icons.beach_access,
              //                                   color: Colors.blue,
              //                                   size: 36.0,
              //                                 ),
              //                               ],
              //                             ),
              //                             Row(
              //                               children: [
              //                                 TextButton.icon(
              //                                     onPressed: () {},
              //                                     icon: Icon(Icons.add),
              //                                     label: Text(
              //                                         "añadir a mis contactos"))
              //                               ],
              //                             ),
              //                             Row(
              //                               children: [
              //                                 TextButton.icon(
              //                                     onPressed: () {},
              //                                     icon: Icon(Icons.precision_manufacturing_rounded),
              //                                     label: Text(
              //                                         "Ver Proyectos"))
              //                               ],
              //                             ),
              //                             Row(
              //                               children: [
              //                                 TextButton.icon(
              //                                     onPressed: () {},
              //                                     icon: Icon(Icons.help_outline),
              //                                     label: Text(
              //                                         "Aboute mi"))
              //                               ],
              //                             ),
              //                           ],
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                   ExpansionTile(
              //                     title: Text(
              //                       "Email",
              //                       style: TextStyle(
              //                           color: Colors.green,
              //                           fontWeight: FontWeight.bold),
              //                     ),
              //                     children: <Widget>[
              //                       Container(
              //                         alignment: Alignment.topLeft,
              //                         padding: const EdgeInsets.all(16.0),
              //                         child: Column(
              //                           children: [
              //                             Row(
              //                               mainAxisAlignment:
              //                               MainAxisAlignment.spaceAround,
              //                               children: const <Widget>[
              //                                 Icon(
              //                                   Icons.favorite,
              //                                   color: Colors.pink,
              //                                   size: 24.0,
              //                                   semanticLabel:
              //                                   'Text to announce in accessibility modes',
              //                                 ),
              //                                 Icon(
              //                                   Icons.audiotrack,
              //                                   color: Colors.green,
              //                                   size: 30.0,
              //                                 ),
              //                                 Icon(
              //                                   Icons.beach_access,
              //                                   color: Colors.blue,
              //                                   size: 36.0,
              //                                 ),
              //                               ],
              //                             ),
              //                             Row(
              //                               children: [
              //                                 TextButton.icon(
              //                                     onPressed: () {},
              //                                     icon: Icon(Icons.add),
              //                                     label: Text(
              //                                         "añadir a mis contactos"))
              //                               ],
              //                             ),
              //                             Row(
              //                               children: [
              //                                 TextButton.icon(
              //                                     onPressed: () {},
              //                                     icon: Icon(Icons.precision_manufacturing_rounded),
              //                                     label: Text(
              //                                         "Ver Proyectos"))
              //                               ],
              //                             ),
              //                             Row(
              //                               children: [
              //                                 TextButton.icon(
              //                                     onPressed: () {},
              //                                     icon: Icon(Icons.help_outline),
              //                                     label: Text(
              //                                         "Aboute mi"))
              //                               ],
              //                             ),
              //                           ],
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                 ],
              //               ),
              //
              //               decoration: BoxDecoration(
              //                   boxShadow: [
              //                     BoxShadow(
              //                       color: Colors.grey.withOpacity(0.5),
              //                       spreadRadius: 5,
              //                       blurRadius: 5,
              //                       offset: Offset(0, 3), // changes position of shadow
              //                     ),
              //                   ],
              //                   border: Border.all(
              //                       color: Color.fromRGBO(
              //                           255, 255, 255, 0.23)),
              //                   borderRadius: BorderRadius.circular(10),
              //                   color: Color.fromRGBO(77, 77, 77, 0.33)),
              //             ) //BoxDecoration
              //         )
              //
              //         , //Container
              //
              //
              //       ],
              //       ),
              // ),
            ))]));
  }
}

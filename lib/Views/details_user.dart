import 'package:carde/Models/User.dart';
import 'package:carde/Widgets/menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsUser extends StatefulWidget {
  const DetailsUser({Key key}) : super(key: key);

  @override
  _DetailsUserState createState() => _DetailsUserState();
}

class _DetailsUserState extends State<DetailsUser> {
  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context).settings.arguments as User;
    return Scaffold(
      drawer: Menu(),
      appBar: AppBar(),
      body:

        Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
                children: <Widget>[
                  Flexible(
                    flex: 3,
                    fit: FlexFit.loose,
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          flex: 3,
                          fit: FlexFit.loose,
                          child: Container(
                               height: 300,
                            width: 300,
                            child:Container(
                              width: 80,
                              height: 80,
                              child:  Text(user.lastname),
                          ),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(user.avatar),
                                fit: BoxFit.cover
                              ),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.green,
                            ), //BoxDecoration
                          ), //Container
                        ),  Flexible(
                          flex: 3,
                          fit: FlexFit.loose,
                          child: Container(
                            padding: EdgeInsets.all(20) ,
                            margin: EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 80,),
                                Text(user.lastname+" "+user.firstname),
                                Text(user.role+" "+user.age.toString()),
                                Text(user.email),
                                Text(user.addess),
                                SizedBox(height: 80,),
                                Text(" Descripcion : " +user.description),
                              ],
                            ),

                              width: 400,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color.fromRGBO(255, 255, 255, 0.23)

                                )
                                ,
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.transparent,
                              ) //BoxDecoration
                          ), //Container
                        )
                        //Flexible//Flexible
                       , Flexible(
                          flex: 3,
                          fit: FlexFit.loose,
                          child: Container(
                              padding: EdgeInsets.all(20) ,
                              margin: EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Text(user.lastname+" "+user.firstname),
                                  Text(user.role+" "+user.age.toString()),
                                  Text(user.email),
                                  Text(user.addess),

                                  ExpansionTile(
                                    title: Text(
                                      "Telefono",
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    children: <Widget>[
                                      Container(
                                        alignment: Alignment.topLeft,
                                        padding: const EdgeInsets.all(16.0),
                                        child: Text(user.telefon,style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.67)),),
                                      )
                                    ],
                                  ),
                                  ExpansionTile(
                                    title: Text(
                                      "Email",
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    children: <Widget>[
                                      Container(
                                        alignment: Alignment.topLeft,
                                        padding: const EdgeInsets.all(16.0),
                                        child: Text(user.email +"\n"+ user.redes,style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.67)),),
                                      )
                                    ],
                                  ),
                                ],
                              ),

                              width: 400,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color.fromRGBO(255, 255, 255, 0.23)

                                )
                                ,
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromRGBO(255, 255, 255, 0.23)
                              ) //BoxDecoration
                          ), //Container
                        )
// Flexible(
//
// flex: 1,
//    fit: FlexFit.loose,
//     child:  Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         Text(user.firstname+" "+user.lastname
//             +"\n"+user.role+"\n"+
//             user.email+"\n"+user.telefon+"\n"+user.age.toString()),
//
//       ],
//     ),
//
//
//
// )

                ],
              )



         ,),

    ])));

  }
}

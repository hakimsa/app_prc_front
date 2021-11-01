import 'package:carde/Models/Producto.dart';
import 'package:carde/Models/User.dart';
import 'package:carde/Services/Providers/Provider_User.dart';
import 'package:carde/Views/details_user.dart';
import 'package:flutter/material.dart';

class UsersCard extends StatefulWidget {
  final List<User> users;

  const UsersCard({@required this.users, List<Producto> productos});

  @override
  _UsersCardState createState() => _UsersCardState();
}

class _UsersCardState extends State<UsersCard> {
  final provider_users=new ProviderUser();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tarjeta_user(context)
    );
  }

  tarjeta_user(BuildContext context) {
      return FutureBuilder(
          future: provider_users.getUsers(),
          builder: (context,AsyncSnapshot<List<User>> snapshot){
           final  users=snapshot.data;
            if(users==null){
              return Container(child: Center(child: Column(children: [
                Text("No hay data "),
                CircularProgressIndicator()
              ],),),);
            }
            return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context,index){
                  return GestureDetector(
                    child: Container(

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
                                  users[index].avatar
                              ),
                              fit: BoxFit.cover),
                          color: Color.fromRGBO(77, 77, 87, 0.35),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Stack(
                        children: [
                          Positioned(
                            child: Text(
                              users[index].nacion.toString(),

                            ),
                          ),
                          Positioned(
                              top: 300,
                              left: 55,
                              child: Text(
                                users[index].firstname.toString(),
                                style: TextStyle(color: Colors.white, fontSize: 75),
                              )),
                          Positioned(
                              top: 380,
                              left: 200,
                              child: Text(
                                users[index].telefon.toString(),
                                style: TextStyle(color: Colors.white, fontSize: 18),
                              ))
                        ],
                      ),
                    ),
                    onTap: (){

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                          builder: (context) =>  DetailsUser(),
                      // Pass the arguments as part of the RouteSettings. The
                      // DetailScreen reads the arguments from these settings.
                      settings: RouteSettings(
                      arguments: users[index],
                      ),
                      ));
                    },
                  );
                });
          });

  }
}


import 'package:carde/Models/User.dart';
import 'package:carde/Services/Providers/Provider_User.dart';
import 'package:carde/Views/details_user.dart';
import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate {

  ProviderUser providerUsr=new ProviderUser();
  List<User> users;
  @override
  List<Widget> buildActions(BuildContext context) {
    // Las acciones de nuestro AppBar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icono a la izquierda del AppBar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {

        close(context, null);
      },
    );
  }

  @override
  Widget buildResults( context) {
    // Crea los resultados que vamos a mostrar
  var w=query;
  if(query.isEmpty){
    return Center(child: Text("Busca por nombre del usuario "),);
  }
 // Convertir la primera letra en majuscula
 String m=w[0].toUpperCase()+w.substring(1);
    return   FutureBuilder(
      future: providerUsr.buscarUser(m),
      builder: ( context, AsyncSnapshot<User>snapshot) {
        if (snapshot.hasData) {
          final users = snapshot.data;
          return ListView(
            children: [

            Card(
            elevation: 3,
            child: Row(
              children: <Widget>[
                Container(
                  height: 125,
                  width: 110,
                  padding:
                  EdgeInsets.only(left: 0, top: 10, bottom: 70, right: 20),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(users.avatar),
                          fit: BoxFit.cover)),
                  child:Text(users.description)==null?Container(): Container(
                    color: Color.fromRGBO(77, 77, 77, 0.16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          users.lastname,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.normal),
                        ),
                        Text(
                          users.age.toString(),
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        users.firstname,
                        style: TextStyle(
                            color: Color.fromRGBO(254, 77, 23, 0.86),
                            fontWeight: FontWeight.w700,
                            fontSize: 17),
                      ),
                      Text(
                        users.lastname,
                        style: TextStyle(fontSize: 14, color: Colors.black87),
                      ),
                      Text(
                        users.email,
                        style: TextStyle(fontSize: 14, color: Colors.black87),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                   _rtio(users.age),
                      Row(
                        children: <Widget>[
                          Text(users.role, style: TextStyle(
                              fontSize: 13
                          ),),
                          SizedBox(
                            width: 5,
                          ),
                          Text(" "+ users.telefon, style: TextStyle(fontSize: 13),),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ]);

        } else {
          return Center(child: Container(
            padding: EdgeInsets.all(20),
            child: Container(
              padding: EdgeInsets.all(20),
            child: Card(child: Text(m +"\t"+"   No existe"),
              elevation: 20,),
          ),));
        }
      },
    );
  }

@override
Widget buildSuggestions(BuildContext context) {
  if (query.isEmpty) {
    return Container();
  }
  return FutureBuilder(
    future:providerUsr.getUsers(),
    builder: (BuildContext context, snapshot) {
      if (snapshot.hasData) {
        users =snapshot.data;
        final listaSugerida = ( query.isEmpty )
            ? users
            : users.where(
                (p)=> p.firstname.toLowerCase().startsWith(query.toLowerCase())
        ).toList();
        return ListView.builder(
          itemCount: listaSugerida.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: FadeInImage(
                image: NetworkImage(listaSugerida[index].avatar),
                placeholder: AssetImage('assets/images/loader.gif'),
                width: 50.0,
                fit: BoxFit.contain,
              ),
              title: Text(listaSugerida[index].firstname.toString()),
              subtitle: Text(listaSugerida[index].lastname),
              onTap: () {
                close(context, null);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  DetailsUser(),
                      // Pass the arguments as part of the RouteSettings. The
                      // DetailScreen reads the arguments from these settings.
                      settings: RouteSettings(
                        arguments: listaSugerida[index],
                      ),
                    ),
                  );

                // pelicula.uniqueId = '';
                //   Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) =>
                //               DetailPage(post: listaSugerida[index],
                //               )));
                // },
              }    );
          },
        );
      } else {
        return Center(child: CircularProgressIndicator());
      }
    },
  );
}

  _rtio(int age) {
    if(age==18)
     return
       Row(
         children: <Widget>[
           Icon(
             Icons.star,
             color: Colors.pink,
             size: 18,
           ),

         ],
       );else
         return
           Row(
        children: <Widget>[
        Icon(
        Icons.star,
        color: Colors.pink,
        size: 18,
    ),
          Icon(
            Icons.star,
            color: Colors.pink,
            size: 18,
          ),
          Icon(
            Icons.star,
            color: Colors.pink,
            size: 18,
          ),
    ]);

  }



}


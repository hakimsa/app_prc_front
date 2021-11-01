import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  Menu({Key key}) ;
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromRGBO(77, 77, 77, 0.43),
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(29), topRight: Radius.circular(39))),
      width: 300,
      child:
        ListView(

              children: [
                DrawerHeader(
                    child: Center(
                      child: CircleAvatar(

                        backgroundImage: NetworkImage(
                            "https://icons.iconarchive.com/icons/blackvariant/button-ui-requests-13/128/Snake-icon.png"),
                        backgroundColor: Color.fromRGBO(255, 255, 255, 0.40),
                      ),
                    )),
                Card(
                  color: Color.fromRGBO(77, 77, 77, 0.03),
                  child: ListTile(
                    leading: Icon(
                      Icons.home,
                      color: Colors.lightGreenAccent,
                    ),
                    title: Text(
                      "Home page ",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: (){
                      Navigator.pushNamed(context,"Home");
                    },
                  ),
                ),
                Card(
                  color: Color.fromRGBO(77, 77, 77, 0.03),
                  child: ListTile(
                    leading: Icon(
                      Icons.video_collection,
                      color: Colors.lightGreenAccent,
                    ),
                    title: Text(
                      "Live Cam",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Card(
                  color: Color.fromRGBO(77, 77, 77, 0.03),
                  child: ListTile(
                    leading: Icon(
                      Icons.chat_bubble_outline_outlined,
                      color: Colors.lightGreenAccent,
                    ),
                    title: Text(
                      "Tribu chat",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Card(
                  color: Color.fromRGBO(77, 77, 77, 0.03),
                  child: ListTile(
                    leading: Icon(
                      Icons.help,
                      color: Colors.lightGreenAccent,
                    ),
                    title: Text(
                      "Aboute",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
         );

  }
}

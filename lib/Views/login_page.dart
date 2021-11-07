import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);
static final String pagename="/login";
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

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
    body:ListView(
      children: [ _LoginForm(context)],
    )



    );
  }



  _LoginForm(BuildContext context) {
    return Center(child:
    Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(35.0),
      child: Column(
        children: <Widget>[
          ClipPath(
            child: Container(
                alignment: Alignment.center,
                width: 500,
                height: 600,
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                  color: Color.fromRGBO(77, 77 , 77, 0.34),
                ),
                child: Form(
                  //  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            radius: 40.0,
                            backgroundColor: Colors.cyan,
                            child: CircleAvatar(
                              backgroundImage: AssetImage("assets/images/logo.png"),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 90.0,
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: TextFormField(
                            // Validacion del campo EditText email.
                            validator: (value) {
                              Pattern pattern =
                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                              RegExp regExp = new RegExp(pattern);
                              if (value.isEmpty) {
                                return 'Por favor indica tu email';
                              } else if (regExp.hasMatch(value)) {
                                return null;
                              }
                              return 'Email incorrecto o no existe ';
                            },
                            //  controller: controladorEmail,
                            style: TextStyle(color: Colors.blue),
                            decoration: InputDecoration(
                                hintText: "Email address",
                                hintStyle:
                                TextStyle(color: Colors.blue.shade200),
                                border: InputBorder.none,
                                icon: Icon(
                                  Icons.email,
                                  color: Colors.blue,
                                )),
                          )),
                      Container(
                        child: Divider(
                          color: Colors.blue.shade400,
                        ),
                        padding: EdgeInsets.only(
                            left: 20.0, right: 20.0, bottom: 10.0),
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: TextFormField(
                            // Validacion del campo EditText contraseña.
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Por favor indica tu contraseña';
                              } else if ((value.length < 6) || value.isEmpty) {
                                return 'La contraseña debe tener mas de 6 caracteres ';
                              }
                              return null;
                            },
                            obscureText: true,
                            //controller: controladorPwd,
                            style: TextStyle(color: Colors.blue),
                            decoration: InputDecoration(
                                hintText: "Password",
                                hintStyle:
                                TextStyle(color: Colors.blue.shade200),
                                border: InputBorder.none,
                                icon: Icon(
                                  Icons.lock,
                                  color: Colors.blue,
                                )),
                          )),
                      Container(
                        child: Divider(
                          color: Colors.blue.shade400,
                        ),
                        padding: EdgeInsets.only(
                            left: 20.0, right: 20.0, bottom: 10.0),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FlatButton(
                              onPressed: () {
                                Navigator.pushNamed(context, "SignupPage");
                              },
                              child: Text("¿Registrate? ",
                                  style: TextStyle(color: Colors.cyan))),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          FlatButton(
                              onPressed: () {
                                Navigator.pushNamed(context, "/");
                              },
                              child: Text("¿He olvidado mi contraseña? ",
                                  style: TextStyle(color: Colors.cyan))),
                        ],
                      ),

                      SizedBox(
                        height: 2,
                      ),
                      SizedBox(
                        height: 90.0,
                      ),
                      Center(child: Column(
                        children: [
                          TextButton.icon(onPressed: (){
                            Navigator.pushReplacementNamed(context, "Home");
                          }, icon: Icon(Icons.group), label: Text("Login"))
                        ],
                      ),)
                    ],
                  ),
                )),
          ),

        ],
      ),
    )

    ,);
  }
}
class Users {
  List<User> items=[];
  Users();
  Users.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return ;
    for (var item in jsonList) {
      final user = new User.fromJsonMap(item);


      items.add(user);
    }
  }
}

class User {
  String sId;
  String firstname;
  String lastname;
  String email;
  String avatar;
  String addess;
  int age;
  String description;
  String nacion;
  String role;
  String telefon;
  String token;
  String password;
  String formacion;
  String lenguage;
  String redes;


  User(
      {this.sId,
      this.firstname,
      this.lastname,
      this.email,
      this.avatar,
      this.addess,
      this.age,
      this.description,
      this.nacion,
      this.role,
      this.telefon,
      this.token,
        this.formacion,
        this.lenguage,
        this.redes,
      this.password});

 User.fromJsonMap(Map<String, dynamic> json) {
    sId = json['_id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    avatar = json['avatar'];
    addess = json['addess'];
    age = json['age'] ;
    description = json['description'];
    nacion = json['nacion'];
    role = json['role'];
    telefon = json['telefon'];
    token = json['token'];
    password = json['password'];
    formacion = json['formacion'];
    lenguage = json['lenguage'];
    redes = json['redes'];
  }


}

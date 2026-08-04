class User{
  int? id;
  String? fullname;
  String? username;
  String? password;

  User({
    this.id,
    required this.fullname,
    required this.username,
    required this.password,
  });

  User.fromJson(Map<String, dynamic> json){
    id = json["id"];
    fullname = json["fullname"];
    username = json["username"];
    password = json["password"];
  }

  Map<String, dynamic>toJson(){
    return{
      "id" : id,
      "fullname" : fullname,
      "username" : username,
      "password" : password,
    };
  }
}
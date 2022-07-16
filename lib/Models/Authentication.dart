
class Authentication {
  String userName;
  String password;

  Authentication({
    required this.password,
    required this.userName
 });

  Map<String,dynamic> toJson() => {
    'username': userName,
    'password': password
  };
}
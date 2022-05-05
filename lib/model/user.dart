import 'package:crypt/crypt.dart';

class UserModel {
  /// Implementation of an user
  UserModel(
      {required this.id,
      required this.login,
      required this.password,
      required this.role});
  String id;
  String login;
  String password;
  int role;

  /// Create user from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["_id"],
        login: json['login'],
        password: json['password'],
        role: json['role'],
      );

  /// Export user as JSON
  Map<String, dynamic> toJson() => {
        "login": login,
        "password": hashedPassword(),
        "role": role,
      };

  String hashedPassword() {
    return Crypt.sha256(password, salt: 'DragonFlightSoon').toString();
  }
}

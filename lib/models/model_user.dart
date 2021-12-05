import 'dart:convert';

import 'package:banbeis/blocs/bloc.dart';
import 'package:banbeis/models/model.dart';

class UserModel {
  final String id;
  final String profileImage;
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String? token;
  final UserConfigModel configs;
  final UserPermissionModel permissions;
  final DateTime lastUsed;
  bool active;

  UserModel({
    required this.id,
    required this.profileImage,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    this.token,
    required this.configs,
    required this.permissions,
    required this.lastUsed,
    required this.active,
  });

  void setActive(bool active) {
    this.active = active;
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> user = json['user'];
    return UserModel(
      id: user['id'],
      profileImage: user['profileImage'] ?? '',
      username: user['username'] ?? '',
      firstName: user['firstName'] ?? '',
      lastName: user['lastName'] ?? '',
      email: user['email'] ?? '',
      phone: user['phone'] ?? '',
      token: json['accessToken'] ?? AppBloc.userCubit.state!.token,
      configs: UserConfigModel.fromJson(json['configs'] ?? {}),
      permissions: UserPermissionModel.fromJson(json['permissions'] ?? {}),
      lastUsed: DateTime.now().toUtc(),
      active: false,
    );
  }

  factory UserModel.fromDatabase(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      profileImage: json['profileImage'] ?? '',
      username: json['username'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      token: json['token'],
      configs: UserConfigModel.fromJson(jsonDecode(json['configs']) ?? {}),
      permissions: UserPermissionModel.fromJson(
        jsonDecode(json['permissions']) ?? {},
      ),
      lastUsed: DateTime.fromMillisecondsSinceEpoch(
        json['lastUsed'],
        isUtc: true,
      ),
      active: json['active'] == 1,
    );
  }

  Map<String, dynamic> toDatabase() {
    return {
      "id": id,
      "profileImage": profileImage,
      "username": username,
      "firstName": firstName,
      "lastName": lastName,
      "phone": phone,
      "email": email,
      "token": token,
      "configs": jsonEncode(configs.toJson()),
      "permissions": jsonEncode(permissions.toJson()),
      "lastUsed": lastUsed.millisecondsSinceEpoch,
      "active": active == true ? 1 : 0,
    };
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_cubit/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.email,
    required super.id,
  });

  factory UserModel.fromFirebase(User user) => UserModel(
        email: user.email ?? '',
        id: user.uid,
      );
}

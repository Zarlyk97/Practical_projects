import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_cubit/features/auth/domain/entities/user_entity.dart';

class AuthDataSource {
  final FirebaseAuth _auth;

  AuthDataSource(this._auth);

  Future<UserEntity> login(String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return UserEntity(
        id: userCredential.user!.uid,
        email: userCredential.user!.email!,
      );
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }

  Future<UserEntity> register(String email, String password) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return UserEntity(id: userCredential.user!.uid, email: email);
    } catch (e) {
      throw Exception('Register failed: $e');
    }
  }

  Future<UserEntity> signInWithGoogle() async {
    try {
      final GoogleAuthProvider googleProvider = GoogleAuthProvider();
      final userCredential = await _auth.signInWithProvider(googleProvider);

      if (userCredential.user == null) {
        throw Exception('Google sign-in returned no user');
      }

      return UserEntity(
        id: userCredential.user!.uid,
        email: userCredential.user!.email!,
      );
    } catch (e) {
      throw Exception('Google sign-in failed: $e');
    }
  }

  Future<UserEntity> getCurrentUser(String uid, String email) async {
    final user = _auth.currentUser;
    if (user == null) {
      throw Exception('No current user found');
    }
    return UserEntity(id: user.uid, email: user.email!);
  }

  Future<void> signOut() async {
    await _auth.signOut(); // Firebase колдонуучуну чыгарып жатат
  }
}

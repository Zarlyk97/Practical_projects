import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/core/configs/constants/app_urls.dart';
import 'package:spotify/data/models/auth/create_user_req.dart';
import 'package:spotify/data/models/auth/signin_user_req.dart';
import 'package:spotify/data/models/auth/user.dart';
import 'package:spotify/domain/entities/auth/user.dart';

abstract class AuthFirebaseService {
  Future<Either> signUp(CreateUserReq createUserReq);
  Future<Either> signIn(SignInUserReq signInUserReq);
  Future<Either> getUser();
}

class AuthFirebaseServiceImple implements AuthFirebaseService {
  @override
  Future<Either> signIn(SignInUserReq signInUserReq) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: signInUserReq.email,
        password: signInUserReq.password,
      );

      return const Right('Signin was successful');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'invalid-email') {
        message = 'Not user found for that email.';
      } else if (e.code == 'invalid-credential') {
        message = 'Wrong password provided for that user.';
      }
      return Left(message);
    }
  }

  @override
  Future<Either> signUp(CreateUserReq createUserReq) async {
    try {
      var date = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUserReq.email,
        password: createUserReq.password,
      );
      FirebaseFirestore.instance.collection('users').doc(date.user?.uid).set({
        'name': createUserReq.fullName,
        'email': date.user?.email,
      });

      return const Right('create was successful');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      }
      return Left(message);
    }
  }

  @override
  Future<Either<String, UserEntity>> getUser() async {
    try {
      // Firebase'ге байланышыңыз
      FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

      // Колдонуучуну текшериңиз, колдонуучу кирбесе, катаны кайтарыңыз
      var currentUser = firebaseAuth.currentUser;
      if (currentUser == null) {
        return const Left('User not signed in');
      }

      // Firestore'дон колдонуучунун документин алыңыз
      var userDocument = await firebaseFirestore
          .collection('users')
          .doc(currentUser.uid)
          .get();

      // Колдонуучунун документин текшериңиз, эгер документ жок болсо, катаны кайтарыңыз
      if (userDocument.data() == null) {
        return const Left('User document does not exist');
      }

      // Firestore'дон алынган документтин негизинде колдонуучунун моделин түзүңүз
      UserModel userModel = UserModel.fromJson(userDocument.data()!);

      // Эгер колдонуучунун сүрөтү жок болсо, демейки сүрөттү колдонуңуз
      userModel.imageURL = currentUser.photoURL ?? AppUrls.defaultImage;

      // Моделден колдонуучунун объектин түзүңүз
      UserEntity userEntity = userModel.toEntity();

      // Колдонуучу ийгиликтүү жүктөлсө, оң жактагы маанини кайтарыңыз
      return Right(userEntity);
    } catch (e, stackTrace) {
      // Ката тууралуу маалыматты логгингге кошуңуз
      print('Error: $e');
      print('Stack trace: $stackTrace');

      // Ката болсо, сол жактагы катаны кайтарыңыз
      return const Left('An error occurred while fetching user');
    }
  }
}

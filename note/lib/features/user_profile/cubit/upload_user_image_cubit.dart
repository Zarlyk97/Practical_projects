import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'upload_user_image_state.dart';

class UploadUserImageCubit extends Cubit<UploadUserImageState> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  UploadUserImageCubit() : super(UploadUserImageInitial());

  Future<void> updateProfilePicture(File imageFile) async {
    try {
      emit(UploadUserImageLoading());
      print(imageFile.path);

      // Check if user is logged in
      final user = _firebaseAuth.currentUser;
      if (user == null) {
        emit(const UploadUserImageFailure("User not logged in."));
        return;
      }

      // Check if file exists
      if (!imageFile.existsSync()) {
        emit(const UploadUserImageFailure("File does not exist."));
        return;
      }

      // Upload image to Firebase Storage
      final storageRef =
          FirebaseStorage.instance.ref().child('user_profile/${user.uid}');
      final uploadTask = storageRef.putFile(imageFile);

      final taskSnapshot = await uploadTask.whenComplete(() => {});
      final imageUrl = await taskSnapshot.ref.getDownloadURL();

      // Update user profile picture in FirebaseAuth
      await user.updatePhotoURL(imageUrl);

      // Emit success state
      emit(UploadUserImageSuccess(user));
    } catch (e) {
      // Emit failure state with error message
      emit(UploadUserImageFailure("Error uploading image: $e"));
    }
  }
}

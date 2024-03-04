import 'package:firebase_auth_cubit/features/auth/cubit/auth_cubit.dart';
import 'package:firebase_auth_cubit/features/auth/screens/login_screen.dart';
import 'package:firebase_auth_cubit/features/reset_password/cubit/reset_password_cubit.dart';
import 'package:firebase_auth_cubit/features/user_profile/cubit/upload_user_image_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(),
        ),
        BlocProvider<ResetPasswordCubit>(
          create: (context) => ResetPasswordCubit(),
        ),
        BlocProvider<UploadUserImageCubit>(
          create: (context) => UploadUserImageCubit(),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      ),
    );
  }
}

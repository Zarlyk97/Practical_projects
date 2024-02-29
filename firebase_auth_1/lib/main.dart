import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'screens/account_screen.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/reset_passwort_screen.dart';
import 'screens/sign_up_screen.dart';
import 'screens/veryfiy_email_screen.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const HomeScreen(),
        '/home': (context) => const HomeScreen(),
        '/account': (context) => const AccountScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/reset_password': (context) => const ResetPasswordScreen(),
        '/verify_email': (context) => const VerifiyEmailScreen(),
      },
      initialRoute: '/',
    );
  }
}

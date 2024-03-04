import 'package:firebase_auth_cubit/constant/image_constant.dart';
import 'package:firebase_auth_cubit/features/auth/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../user_profile/profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Scaffold(
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(70.0),
                child: AppBar(
                  automaticallyImplyLeading: false,
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Welcome"),
                      const SizedBox(height: 5),
                      Text(
                        state.user!.email.toString(),
                        style: TextStyle(fontSize: 12, color: Colors.grey[400]),
                      ),
                    ],
                  ),
                  actions: [
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const ProfileScreen();
                          },
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(state.user?.photoURL ??
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnfixxaCz_MIZCUw0QBynCJPGTFVGlO7b7I_JJjsnwXA&s"),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                  ],
                ),
              ),
              body: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(ImageConstant.backgroundImage),
                          fit: BoxFit.cover),
                    ),
                    child: const Center(
                        child: Text(
                      'Кандайсын Майк тайсон',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    )),
                  ),
                ],
              ));
        } else {
          return const Scaffold(
            body: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
      },
    );
  }
}

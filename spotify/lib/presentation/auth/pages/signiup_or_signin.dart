import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/core/configs/assets/app_images.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/presentation/auth/pages/sign_up_page.dart';

class SignupOrSigninPage extends StatefulWidget {
  const SignupOrSigninPage({super.key});

  @override
  State<SignupOrSigninPage> createState() => _SignupOrSigninPageState();
}

class _SignupOrSigninPageState extends State<SignupOrSigninPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: SvgPicture.asset(AppVectors.topPattern),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: SvgPicture.asset(AppVectors.bottomPattern),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Image.asset(AppImages.authBg),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  SvgPicture.asset(AppVectors.logo),
                  const SizedBox(
                    height: 55,
                  ),
                  const Text(
                    'Enjoy Listening To music ',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                  const Text(
                    'Spotify is a proprietary Swedish audio streaming and media  services provider.',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(
                            side: BorderSide.none,
                          ),
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.black,
                          minimumSize: const Size(150, 80),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpPage()));
                        },
                        child: const Text(
                          'Register',
                          style: TextStyle(
                              fontSize: 20,
                              color: AppColors.lightBackground,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(
                            side: BorderSide.none,
                          ),
                          backgroundColor: AppColors.darkBackground,
                          foregroundColor: Colors.black,
                          minimumSize: const Size(150, 80),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Sign in',
                          style: TextStyle(
                              fontSize: 20,
                              color: AppColors.lightBackground,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

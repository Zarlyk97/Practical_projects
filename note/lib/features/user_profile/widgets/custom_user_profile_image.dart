import 'package:firebase_auth_cubit/constant/image_constant.dart';
import 'package:firebase_auth_cubit/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomUserImageProfile extends StatelessWidget {
  const CustomUserImageProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 100,
                child: SizedBox(
                  height: 150.0,
                  width: 150.0,
                  child: CircleAvatar(
                    backgroundImage:
                        const AssetImage(ImageConstant.backgroundImage),
                    child: GestureDetector(
                      onTap: () {
                        if (state.user?.photoURL !=
                            'https://png.pngtree.com/png-vector/20190501/ourmid/pngtree-vector-business-men-icon-png-image_1011286.jpg') {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                child: Container(
                                  decoration: const BoxDecoration(),
                                  child: Image.network(
                                    state.user?.photoURL ?? "",
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              );
                            },
                          );
                        } else {
                          Container();
                        }
                      },
                      child: SizedBox(
                        height: 140.0,
                        width: 140.0,
                        child: state.user?.photoURL != null
                            ? CircleAvatar(
                                backgroundImage: NetworkImage(state
                                        .user?.photoURL ??
                                    "https://png.pngtree.com/png-vector/20191101/ourmid/pngtree-cartoon-color-simple-male-avatar-png-image_1934459.jpg"),
                              )
                            : const CircleAvatar(
                                backgroundColor: Colors.white,
                              ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        } else {
          return const Positioned(
            top: 100,
            child: SizedBox(
              height: 150.0,
              width: 150.0,
              child: CircleAvatar(
                backgroundImage: AssetImage(ImageConstant.backgroundImage),
                child: SizedBox(
                  height: 140.0,
                  width: 140.0,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/common/widgets/appbar/app_bar.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        backgroundColor: AppColors.darkGrey,
        title: const Text(
          'Profile',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: Column(children: [_profileInfo(context)]),
    );
  }

  Widget _profileInfo(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 3.5,
      decoration: BoxDecoration(
        color:
            context.isDarkMode ? AppColors.darkGrey : AppColors.lightBackground,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(40),
          bottomLeft: Radius.circular(40),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(radius: 60),
          SizedBox(
            height: 20,
          ),
          Text('zzzzzzzzzzzzzzzzzzzzzzzzzzzzz'),
          SizedBox(
            height: 10,
          ),
          Text('zzzzzzzzzzzzzzzzzzzzzzzzzzzzz')
        ],
      ),
    );
  }
}

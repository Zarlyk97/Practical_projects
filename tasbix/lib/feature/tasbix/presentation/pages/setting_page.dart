import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasbix/bloc/cubit/theme_cubit.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    final isdarkTheme = context.watch<ThemeCubit>().state.isdark;
    return Scaffold(
      appBar: AppBar(title: const Text('Настройки'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: const Text(
                'Tемная тема',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              trailing: CupertinoSwitch(
                value: isdarkTheme,
                onChanged: (value) {
                  setState(() {
                    _setThemeBrightness(context, value);
                  });
                },
                activeColor: CupertinoColors.activeGreen,
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(thickness: 1);
          },
        ),
      ),
    );
  }

  void _setThemeBrightness(BuildContext context, bool value) {
    context
        .read<ThemeCubit>()
        .toggleTheme(value ? Brightness.dark : Brightness.light);
  }
}

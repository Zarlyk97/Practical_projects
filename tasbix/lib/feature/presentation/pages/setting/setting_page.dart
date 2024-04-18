import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasbix/bloc/language_cubit/language_cubit.dart';

import 'package:tasbix/bloc/theme_cubit/theme_cubit.dart';
import 'package:tasbix/feature/presentation/widgets/widgets.dart';
import 'package:tasbix/generated/l10n.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  @override
  Widget build(BuildContext context) {
    final isdark = context.watch<ThemeCubit>().state.isdark;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(S.of(context).settings,
                style: const TextStyle(fontWeight: FontWeight.w600)),
            centerTitle: true,
            elevation: 1,
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverToBoxAdapter(
            child: SettingsToggleCard(
              title: S.of(context).darkTheme,
              child: CupertinoSwitch(
                onChanged: (value) {
                  setState(() {
                    _setThemeBrightness(context, value);
                  });
                },
                value: isdark,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SettingsToggleCard(
              title: S.of(context).language,
              child: DropdownButton(
                onChanged: (String? value) {
                  if (value != null) {
                    context.read<LanguageCubit>().changeLanguage(value);
                  }
                },
                items: const [
                  DropdownMenuItem<String>(
                    value: 'en',
                    child: Text("English"),
                  ),
                  DropdownMenuItem<String>(
                    value: 'ru',
                    child: Text("Русский"),
                  ),
                  DropdownMenuItem<String>(
                    value: 'ky',
                    child: Text("Кыргызча"),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _setThemeBrightness(BuildContext context, bool value) {
    context
        .read<ThemeCubit>()
        .toggleTheme(value ? Brightness.dark : Brightness.light);
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasbix/bloc/language_cubit/language_cubit.dart';
import 'package:tasbix/bloc/theme_cubit/theme_cubit.dart';
import 'package:tasbix/feature/tasbix/presentation/widgets/widgets.dart';
import 'package:tasbix/generated/l10n.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
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
              child: BlocBuilder<LanguageCubit, LanguageState>(
                builder: (context, state) {
                  if (state is ChangeLanguageState) {
                    return DropdownButton<String>(
                      value: state.locale.languageCode,
                      onChanged: (String? value) {
                        if (value != null) {}
                      },
                      items: ['English', 'Русский', 'Кыргызча']
                          .map((String items) => DropdownMenuItem<String>(
                                value: items,
                                child: Text(items),
                              ))
                          .toList(),
                    );
                  } else {
                    return const SizedBox.shrink(); // же башка виджет
                  }
                },
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

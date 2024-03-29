import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasbix/bloc/cubit/theme_cubit.dart';
import 'package:tasbix/feature/tasbix/presentation/widgets/widgets.dart';
import 'package:tasbix/generated/l10n.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  // final localizationService = LocalizationService();

  @override
  Widget build(BuildContext context) {
    final isdarkTheme = context.watch<ThemeCubit>().state.isdark;
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
                value: isdarkTheme,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SettingsToggleCard(
              title: S.of(context).language,
              child: DropdownButton<Locale>(
                value: const Locale('en'), //localizationService.locale,
                onChanged: (Locale? newLocale) {},
                items: const [
                  DropdownMenuItem(
                    value: Locale('en'),
                    child: Text('English'),
                  ),
                  DropdownMenuItem(
                    value: Locale('ky'),
                    child: Text('Кыргызча'),
                  ),
                  DropdownMenuItem(
                    value: Locale('ky'),
                    child: Text('Русский'),
                  ),
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

// class LocalizationService {
//   Locale? _locale;

//   Locale get locale => _locale!;

//   void setLocale(Locale locale) {
//     _locale = locale;
//     // Тилди өзгөрткөндөн кийин колдонмону кайрадан жүктөңүз
//   }
// }

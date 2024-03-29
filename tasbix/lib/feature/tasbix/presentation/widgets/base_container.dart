import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasbix/bloc/theme_cubit/theme_cubit.dart';

class BaseConatiner extends StatelessWidget {
  const BaseConatiner({
    super.key,
    required this.child,
    this.width,
    this.margin,
    this.padding = const EdgeInsets.only(left: 12),
  });

  final double? width;
  final EdgeInsets? margin;
  final Widget child;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final isdarkTheme = context.watch<ThemeCubit>().state.isdark;

    final theme = Theme.of(context);
    return Container(
      height: 60,
      width: width,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        border: Border.all(
            color: isdarkTheme ? Colors.grey.shade300 : Colors.black26),
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: child,
    );
  }
}

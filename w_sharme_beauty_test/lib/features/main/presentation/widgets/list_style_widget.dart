// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ListStileWidget extends StatelessWidget {
  const ListStileWidget({
    super.key,
    required this.title,
    required this.subtitle,
    this.trailing,
    required this.theme,
    this.leading,
    this.onTap,
  });
  final Widget? leading;
  final String title;
  final String subtitle;
  final Widget? trailing;
  final Function()? onTap;

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      leading: leading,
      title: Text(
        title,
        style:
            theme.textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w700),
      ),
      subtitle: Text(
        subtitle,
        style: theme.textTheme.bodySmall!.copyWith(color: theme.disabledColor),
      ),
      trailing: trailing,
    );
  }
}

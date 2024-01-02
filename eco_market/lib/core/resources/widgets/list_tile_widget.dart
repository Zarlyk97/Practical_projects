import 'package:flutter/material.dart';
import 'package:eco_market/config/config.dart';

class ModuleHorWidget extends StatelessWidget {
  final Widget? leading;
  final Widget? trailing;
  final String title;
  final String? desc;
  final VoidCallback onTap;

  const ModuleHorWidget({
    super.key,
    this.leading,
    this.trailing,
    required this.title,
    this.desc,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: ListTile(
        leading: leading,
        trailing: trailing,
        minLeadingWidth: 30,
        title: Text(
          title,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: AppColors.white,
            overflow: TextOverflow.ellipsis,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        onTap: onTap,
        subtitle: desc != null
            ? Text(
                desc.toString(),
                style: theme.textTheme.bodySmall?.copyWith(
                  color: const Color(0x99EBEBF5),
                  fontSize: 14,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              )
            : null,
      ),
    );
  }
}

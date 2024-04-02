import 'package:flutter/material.dart';
import 'package:w_sharme_beauty_test/features/main/presentation/widgets/widgets.dart';

class ListStileWidget extends StatelessWidget {
  const ListStileWidget({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const CircleAvatar(
        child: Text("A"),
      ),
      title: Text(
        "Elena Ivanovna",
        style:
            theme.textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w700),
      ),
      subtitle: Text(
        "22-март в 10:00",
        style: theme.textTheme.bodySmall!.copyWith(color: theme.disabledColor),
      ),
      trailing: CustomButton(theme: theme),
    );
  }
}

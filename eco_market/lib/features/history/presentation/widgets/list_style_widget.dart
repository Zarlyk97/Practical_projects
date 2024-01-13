// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ListStyleWidget extends StatelessWidget {
  const ListStyleWidget({
    Key? key,
    required this.leading,
    required this.title,
    required this.subtitle,
    required this.trailing,
    this.onTap,
    required this.itemCount,
  }) : super(key: key);
  final Widget leading;

  final String title;
  final String subtitle;
  final String trailing;
  final Function()? onTap;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: itemCount,
      separatorBuilder: (BuildContext context, int index) => const SizedBox(
        height: 8,
      ),
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          onTap: onTap,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          tileColor: const Color(0xffF8F8F8),
          leading: leading,
          title: Text(
            title,
            style: const TextStyle(
              color: Color(0xFF1E1E1E),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: const TextStyle(
              color: Color(0xFFABABAD),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          trailing: Text(
            trailing,
            style: const TextStyle(
              color: Color(0xFF75DB1B),
              fontSize: 20,
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
        );
      },
    );
  }
}

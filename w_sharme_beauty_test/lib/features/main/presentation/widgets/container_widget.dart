// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({
    super.key,
    required this.text,
    required this.widget,
  });
  final String text;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.0),
            color: const Color(0xffF3F3F3)),
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Row(
            children: [
              widget,
              const SizedBox(width: 7),
              Text(
                text,
                style: const TextStyle(
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

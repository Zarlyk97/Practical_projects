import 'package:flutter/material.dart';
import 'package:rick_and_morty/common/app_colors.dart';
import 'package:rick_and_morty/feature/domain/entities/person_entity.dart';

class PersonCard extends StatelessWidget {
  final PersonEntity person;
  const PersonCard({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.cellBackgraund,
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          Container(
            color: Colors.transparent,
            child: Image.network(person.image),
          )
        ],
      ),
    );
  }
}

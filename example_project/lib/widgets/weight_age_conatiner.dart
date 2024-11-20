import 'package:flutter/material.dart';

class WeightAgeConatiner extends StatelessWidget {
  const WeightAgeConatiner({
    super.key,
    required this.text,
    required this.san,
    required this.iconAdd,
    required this.iconRemove,
  });
  final String text;
  final int san;
  final IconData iconAdd;
  final IconData iconRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 177,
      width: 150,
      decoration: BoxDecoration(
        color: const Color(0xff0A001f),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text.toUpperCase(),
              style: const TextStyle(
                color: Color(0xffceccd2),
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              san.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.w800,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  color: Colors.red,
                  icon: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(
                      iconRemove,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  color: Colors.red,
                  icon: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(
                      iconAdd,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

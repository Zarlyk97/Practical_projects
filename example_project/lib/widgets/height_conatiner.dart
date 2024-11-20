import 'package:flutter/material.dart';

class HeightConatiner extends StatelessWidget {
  const HeightConatiner({
    super.key,
    required this.text,
    required this.san,
    required this.sm,
  });
  final String text;
  final int san;
  final String sm;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335,
      height: 176,
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
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              textBaseline: TextBaseline.alphabetic,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              children: [
                Text(
                  san.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  sm,
                  style: const TextStyle(
                    color: Color(0xffceccd2),
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
            Slider.adaptive(
              thumbColor: const Color(0xffff0f65),
              activeColor: Colors.white,
              inactiveColor: Colors.grey,
              max: 230,
              value: 180,
              onChanged: (v) {},
            )
          ],
        ),
      ),
    );
  }
}

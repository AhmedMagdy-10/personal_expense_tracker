import 'package:flutter/material.dart';

class IcomeOutcomeMony extends StatelessWidget {
  const IcomeOutcomeMony({
    super.key,
    required this.imageIcon,
    required this.textName,
    required this.amount,
    this.color,
  });

  final String imageIcon;
  final String textName;
  final num amount;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  textName,
                  style: const TextStyle(
                    fontSize: 17,
                  ),
                ),
                Text.rich(
                  TextSpan(
                    text: 'EGP',
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                    children: [
                      TextSpan(
                        text: '$amount',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Image.asset(
                imageIcon,
                fit: BoxFit.scaleDown,
                width: 28,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

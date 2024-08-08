import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomCalender extends StatelessWidget {
  const CustomCalender({
    super.key,
    required this.previousOnTap,
    required this.nextOnTap,
    required this.selectedDate,
    required this.onTapMonths,
  });
  final void Function()? previousOnTap;
  final void Function()? nextOnTap;
  final DateTime selectedDate;
  final void Function()? onTapMonths;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          icon: const Icon(
            Icons.chevron_left,
            size: 40,
          ),
          onPressed: previousOnTap,
        ),
        const SizedBox(
          width: 40,
        ),
        GestureDetector(
          onTap: onTapMonths,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                const Icon(
                  Icons.calendar_month_outlined,
                  color: Colors.black,
                  size: 20,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  DateFormat('yMMMM').format(selectedDate),
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 40,
        ),
        if (selectedDate.month < DateTime.now().month)
          IconButton(
            icon: const Icon(
              Icons.chevron_right,
              size: 40,
            ),
            onPressed: nextOnTap,
          ),
      ],
    );
  }
}

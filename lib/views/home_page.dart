// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:personal_expense_tracker/constant/icon_broken.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    Future<void> selectMonth(BuildContext context) async {
      final DateTime? picked = await showMonthYearPicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(DateTime.now().year - 5, 1),
        lastDate: DateTime(DateTime.now().year + 5, 12),
      );

      if (picked != null && picked != selectedDate) {
        setState(() {
          selectedDate = picked;
        });
      }
    }

    void nextMonth() {
      setState(() {
        selectedDate = DateTime(selectedDate.year, selectedDate.month + 1);
        print(selectedDate);
      });
    }

    void previousMonth() {
      setState(() {
        selectedDate = DateTime(selectedDate.year, selectedDate.month - 1);
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('مصروفاتي'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.chevron_left,
                  size: 40,
                ),
                onPressed: previousMonth,
              ),
              const SizedBox(
                width: 40,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectMonth(context);
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
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
                  onPressed: nextMonth,
                ),
            ],
          ),
          const Text(
            'Account Balance',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          const Text(
            'EGP 9400',
            style: TextStyle(
              fontSize: 40,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xff00A86B),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Income',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        text: 'EGP',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                        children: [
                          TextSpan(
                            text: '5000',
                            style: TextStyle(
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
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Image.asset(
                    'assets/image/Frame 27.png',
                    fit: BoxFit.scaleDown,
                    width: 28,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

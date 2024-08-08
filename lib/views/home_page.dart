// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:personal_expense_tracker/views/widgets/custom_calender.dart';
import 'package:personal_expense_tracker/views/widgets/income_outcome_mony.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            CustomCalender(
              previousOnTap: previousMonth,
              nextOnTap: nextMonth,
              selectedDate: selectedDate,
              onTapMonths: () {
                setState(() {
                  selectMonth(context);
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '..Account Balance',
              style: TextStyle(
                color: Colors.grey[400],
              ),
            ),
            const Text.rich(
              TextSpan(
                text: 'EGP  ',
                style: TextStyle(
                  fontSize: 18,
                ),
                children: [
                  TextSpan(
                    text: '9400',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              children: [
                IcomeOutcomeMony(
                  textName: 'Expenses',
                  amount: 1200,
                  imageIcon: 'assets/image/Frame 26.png',
                  color: Color(0xffFD3C4A),
                ),
                SizedBox(
                  width: 20,
                ),
                IcomeOutcomeMony(
                  textName: 'Icome',
                  amount: 5000,
                  imageIcon: 'assets/image/Frame 27.png',
                  color: Color(0xff00A86B),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:personal_expense_tracker/generated/l10n.dart';
import 'package:personal_expense_tracker/views/widgets/custom_text_field.dart';

class DetailsOfMony extends StatefulWidget {
  const DetailsOfMony({super.key});

  @override
  State<DetailsOfMony> createState() => _DetailsOfMonyState();
}

class _DetailsOfMonyState extends State<DetailsOfMony> {
  TextEditingController? selectedCurrencyController = TextEditingController();
  TextEditingController? balanceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).DetailsAppBar),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              CustomTextField(
                readOnly: true,
                textAlign: TextAlign.center,
                hintText: S.of(context).selectedCurrency,
                controller: selectedCurrencyController,
                onTap: () {
                  selectCurrency(context);
                },
                prefixIcon: const Icon(
                  Icons.arrow_drop_down,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                keyboardType: TextInputType.number,
                controller: balanceController,
                hintText: S.of(context).selectedBalance,
                suffixIcon: const Icon(
                  Icons.account_balance_wallet_rounded,
                ),
              ),
            ],
          ),
        ));
  }

  void selectCurrency(BuildContext context) {
    return showCurrencyPicker(
        context: context,
        showCurrencyCode: false,
        theme: CurrencyPickerThemeData(
          flagSize: 25,
          titleTextStyle: const TextStyle(fontSize: 17),
          subtitleTextStyle:
              TextStyle(fontSize: 15, color: Theme.of(context).hintColor),
          bottomSheetHeight: MediaQuery.of(context).size.height / 1.15,
          inputDecoration: InputDecoration(
            labelText: 'Search',
            labelStyle: const TextStyle(color: Colors.blue),
            hintText: 'Start typing to search',
            prefixIcon: const Icon(Icons.search),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: const Color(0xFF8C98A8).withOpacity(0.2),
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: const Color(0xFF8C98A8).withOpacity(0.2),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.blue),
            ),
          ),
        ),
        onSelect: (Currency currency) {
          selectedCurrencyController!.text = currency.name;
          print(" #### ${currency.code}");
        });
  }
}

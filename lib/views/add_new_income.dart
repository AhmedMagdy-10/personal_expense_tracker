import 'package:flutter/material.dart';
import 'package:personal_expense_tracker/models/income_outcome_model.dart';
import 'package:personal_expense_tracker/views/widgets/custom_button.dart';
import 'package:personal_expense_tracker/views/widgets/custom_text_field.dart';

class AddNewIncome extends StatelessWidget {
  const AddNewIncome({super.key});

  final List<IncomeOutcomeModel> incomeCategory = const [
    IncomeOutcomeModel(
      image: 'assets/image/salary.png',
      title: 'الراتب',
    ),
    IncomeOutcomeModel(
      image: 'assets/image/benefit.png',
      title: 'المكافأت',
    ),
    IncomeOutcomeModel(
      image: 'assets/image/gift-box.png',
      title: 'الهدايا',
    ),
    IncomeOutcomeModel(
      image: 'assets/image/sales.png',
      title: 'المبيعات',
    ),
    IncomeOutcomeModel(
      image: 'assets/image/money.png',
      title: 'اضافه رصيد',
    ),
    IncomeOutcomeModel(
      image: 'assets/image/more.png',
      title: 'اخري',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey();
    final TextEditingController amountController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'اضافه دخل',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              CustomTextField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'ادخل المبلغ';
                  } else {
                    return null;
                  }
                },
                controller: amountController,
                hintText: 'المبلغ',
                prefixIcon: const Padding(
                  padding: EdgeInsetsDirectional.only(top: 14, start: 5),
                  child: Text(
                    'EGP',
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) => IcomeslistItems(
                          incomeOutcomeModel: incomeCategory[index],
                        ),
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: incomeCategory.length),
              ),
              CustomButton(
                child: const Text(
                  'اضافة',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                onTapButton: () {
                  if (formKey.currentState!.validate()) {}
                },
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class IcomeslistItems extends StatelessWidget {
  const IcomeslistItems({
    super.key,
    required this.incomeOutcomeModel,
  });

  final IncomeOutcomeModel incomeOutcomeModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: Image.asset(
              incomeOutcomeModel.image,
              width: 20,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            incomeOutcomeModel.title,
            style: const TextStyle(
              fontSize: 22,
            ),
          )
        ],
      ),
    );
  }
}

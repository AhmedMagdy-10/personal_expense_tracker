import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_expense_tracker/generated/l10n.dart';
import 'package:personal_expense_tracker/logic/cubit/start_view_cubit.dart';
import 'package:personal_expense_tracker/logic/cubit/start_view_states.dart';
import 'package:personal_expense_tracker/views/details_of_mony.dart';
import 'package:personal_expense_tracker/views/widgets/custom_button.dart';
import 'package:personal_expense_tracker/views/widgets/mode_item.dart';

class StartView extends StatelessWidget {
  const StartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StartViewCubit, StartViewStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              S.of(context).startTitle,
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).Mode,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const ModeItem(),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) => Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: SizedBox(
                          height: 100,
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  BlocProvider.of<StartViewCubit>(context)
                                      .changeLanguage('en');
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  S.of(context).English,
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                onTap: () {
                                  BlocProvider.of<StartViewCubit>(context)
                                      .changeLanguage('ar');
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  S.of(context).Arabic,
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[500],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          S.of(context).language,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Icon(Icons.g_translate),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                CustomButton(
                  onTapButton: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DetailsOfMony(),
                        ),
                        (route) => false);
                  },
                  child: Text(
                    S.of(context).buttonDetailsText,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

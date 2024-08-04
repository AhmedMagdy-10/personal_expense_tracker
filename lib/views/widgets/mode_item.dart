import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_expense_tracker/generated/l10n.dart';
import 'package:personal_expense_tracker/logic/cubit/start_view_cubit.dart';
import 'package:personal_expense_tracker/logic/cubit/start_view_states.dart';

class ModeItem extends StatelessWidget {
  const ModeItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List modes = [
      S.of(context).light,
      S.of(context).dark,
      S.of(context).system,
    ];
    return BlocBuilder<StartViewCubit, StartViewStates>(
      builder: (context, state) => SizedBox(
        height: 250,
        child: ListView.separated(
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  BlocProvider.of<StartViewCubit>(context).changeMode(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          modes[index],
                          style: const TextStyle(
                            fontSize: 19,
                          ),
                        ),
                      ),
                      if (BlocProvider.of<StartViewCubit>(context)
                              .currentIndex ==
                          index)
                        const Icon(
                          Icons.check_circle,
                          color: Colors.blue,
                        ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const Divider(
                  color: Colors.grey,
                ),
            itemCount: modes.length),
      ),
    );
  }
}

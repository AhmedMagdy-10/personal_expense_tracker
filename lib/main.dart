import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:personal_expense_tracker/constant/mode_style.dart';
import 'package:personal_expense_tracker/core/helper/cache_helper.dart';
import 'package:personal_expense_tracker/generated/l10n.dart';
import 'package:personal_expense_tracker/logic/cubit/start_view_cubit.dart';
import 'package:personal_expense_tracker/logic/cubit/start_view_states.dart';
import 'package:personal_expense_tracker/views/start_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();

  final savedMode = await CacheHelper.getSaveData(key: 'mode');
  // final deviceId = await UserIdManger.getDeviceId();

  runApp(MyApp(
    savedMode: savedMode,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    this.savedMode,
  });

  final int? savedMode;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<StartViewCubit>(
      create: (context) => StartViewCubit()..getlang(),
      child: BlocBuilder<StartViewCubit, StartViewStates>(
          builder: (context, state) {
        print(
            ' ######## ${BlocProvider.of<StartViewCubit>(context).themeMode}');

        return MaterialApp(
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: ThemeMode.system,
          color: Colors.black,
          locale: BlocProvider.of<StartViewCubit>(context).language,
          debugShowCheckedModeBanner: false,
          home: const StartView(),
        );
      }),
    );
  }
}

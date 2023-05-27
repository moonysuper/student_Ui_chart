import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testa/controller/cubitapp_cubit.dart';
import 'package:testa/controller/cubitapp_state.dart';
import 'package:testa/screen/add_std.dart';
import 'package:testa/screen/login.dart';
import 'package:testa/screen/shared/theme.dart';
import 'package:testa/screen/show_std.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..createDatabase(),
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: ThemeMode.light,
            home:  Directionality(
                textDirection: TextDirection.rtl,
                child: LoginScreen()),
          );
        },
      ),
    );
  }
}



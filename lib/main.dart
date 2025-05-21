import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos_app_odev/ui/cubits/main_cubit.dart';
import 'package:todos_app_odev/ui/cubits/save_cubit.dart';
import 'package:todos_app_odev/ui/cubits/update_cubit.dart';
import 'package:todos_app_odev/ui/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SaveCubit()),
        BlocProvider(create: (context) => UpdateCubit()),
        BlocProvider(create: (context) => MainCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MainScreen(),
      ),
    );
  }
}

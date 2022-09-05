import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ks_smart/src/features/admin/home/home.dart';
import 'package:ks_smart/src/features/auth/auth.dart';
import 'package:ks_smart/src/features/user/home/home.dart';

import 'src/features/admin/create_user/cubit/cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => LogInCubit(),
        ),
        BlocProvider(
          create: (_) => AdminHomeCubit(),
        ),
        BlocProvider(
          create: (_) => UserHomeCubit(),
        ),
        BlocProvider(
          create: (context) => CreateUserCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AuthView(),
      ),
    );
  }
}

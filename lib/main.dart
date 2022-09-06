import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ks_smart/src/features/admin/create_project/create_admin.dart';
import 'package:ks_smart/src/features/admin/home/home.dart';
import 'package:ks_smart/src/features/auth/admin/admin.dart';
import 'package:ks_smart/src/features/auth/home/home.dart';
import 'package:ks_smart/src/features/user/home/home.dart';

import 'src/features/admin/create_user/cubit/cubit.dart';
import 'src/features/auth/user/user.dart';

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
          create: (_) => AdminHomeCubit(),
        ),
        BlocProvider(
          create: (_) => UserHomeCubit(),
        ),
        BlocProvider(
          create: (_) => AuthAdminCubit(),
        ),
        BlocProvider(
          create: (_) => AuthUserCubit(),
        ),
        BlocProvider(
          create: (context) => CreateUserCubit(),
        ),
        BlocProvider(
          create: (context) => AuthHomeCubit(),
        ),
        BlocProvider(
          create: (context) => CreateProjectCubit(),
        ),
      ],
      child:const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AuthHomeView(), 
      ),
    );
  }
}

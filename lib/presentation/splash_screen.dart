import 'dart:async';

import 'package:banking_task/business_logic/home_cubit.dart';
import 'package:banking_task/business_logic/home_states.dart';
import 'package:banking_task/presentation/layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
     Future.delayed(const Duration(seconds: 5)).then((value) {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:
          (context) => HomeScreen() ,), (route) => false);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
return  Scaffold(
  body:   Center(
    child: Image.network('https://internship.thesparksfoundation.info/assests/img/logo.png'),
  ),
);
      },
    );
  }
}

import 'package:banking_task/business_logic/home_cubit.dart';
import 'package:banking_task/business_logic/home_states.dart';
import 'package:banking_task/presentation/transactions_screen.dart';
import 'package:banking_task/presentation/transfer_screen.dart';
import 'package:banking_task/presentation/users_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text('Banking Task')),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index){
             HomeCubit.get(context).navbarChanger(index);
            },
            currentIndex: HomeCubit.get(context).currentIndex ,
            items: const [
              BottomNavigationBarItem(label: 'Users', icon: Icon(Icons.person)),
              BottomNavigationBarItem(
                  label: 'Transactions', icon: Icon(Icons.currency_exchange)),
            ],
          ),
          body:  HomeCubit.get(context).currentIndex ==0 ?UsersScreen():TransactionsScreen(),
        );
      },
    );
  }
}

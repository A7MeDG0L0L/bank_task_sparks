import 'package:banking_task/presentation/transfer_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../business_logic/home_cubit.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: HomeCubit.get(context).users.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder:
                (context) => TransferScreen(index: index,receiverName: HomeCubit
                    .get
              (context).users[index]['name'],receiverEmail: HomeCubit.get
                  (context).users[index]['email'],receiverPhone: HomeCubit
                    .get(context).users[index]['phone'])
              ,));
          },
          child: Card(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('Name: '),
                        Text(HomeCubit.get(context).users[index]['name'],
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Balance: '),
                        Text(HomeCubit.get(context)
                            .users[index]['balance']
                            .toString() +
                            '\$'),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Email: '),
                        Text(HomeCubit.get(context).users[index]['email']),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Phone No: '),
                        Text('0' +
                            HomeCubit.get(context)
                                .users[index]['phone']
                                .toString()),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius:26,
                      child: Text(HomeCubit.get(context)
                          .users[index]['balance']
                          .toString() +
                          '\$'),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

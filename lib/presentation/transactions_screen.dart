import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../business_logic/home_cubit.dart';
import '../business_logic/home_states.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context, state) {

      },
      builder:  (context, state) {
return ListView.builder(itemCount: HomeCubit.get(context).transactions.length,
  itemBuilder:
    (context, index) {
  return Card(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text('Sender Name: '),
                Text(HomeCubit.get(context).transactions[index]['senderName'],
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            // Row(
            //   children: [
            //     Text('Amount: '),
            //     Text(HomeCubit.get(context)
            //         .transactions[index]['amount']
            //         .toString() +
            //         '\$'),
            //   ],
            // ),
            Row(
              children: [
                Text('Sender Email: '),
                Text(HomeCubit.get(context).transactions[index]['senderEmail']),
              ],
            ),
            Row(
              children: [
                Text('Sender Phone No: '),
                Text('0' +
                    HomeCubit.get(context)
                        .transactions[index]['senderPhone']
                        .toString()),
              ],
            ),
            SizedBox(height:  20,),
            Row(
              children: [
                Text('receiver Name: '),
                Text(HomeCubit.get(context)
                    .transactions[index]['receiverName'],
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            Row(
              children: [
                Text('Amount: '),
                Text(HomeCubit.get(context)
                    .transactions[index]['amount']
                    .toString() +
                    '\$'),
              ],
            ),
            Row(
              children: [
                Text('receiver Email: '),
                Text(HomeCubit.get(context)
                    .transactions[index]['receiverEmail']),
              ],
            ),
            Row(
              children: [
                Text('receiver Phone No: '),
                Text('0' +
                    HomeCubit.get(context)
                        .transactions[index]['receiverPhone']
                        .toString()),
              ],
            ),
          ],
        ),
        const Spacer(),
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius:26,
                child: Text(HomeCubit.get(context)
                    .transactions[index]['amount']
                    .toString() +
                    '\$'),
              )
            ],
          ),
        ),
      ],
    ),
  );

},);
      },
    );
  }
}

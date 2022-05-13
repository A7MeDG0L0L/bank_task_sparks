import 'package:banking_task/business_logic/home_cubit.dart';
import 'package:banking_task/business_logic/home_states.dart';
import 'package:banking_task/presentation/layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransferScreen extends StatelessWidget {
   TransferScreen({Key? key, required this.receiverName, required this.receiverEmail, required this.receiverPhone, required this.index}) : super(key: key);
  final String receiverName;
  final String receiverEmail;
  final int receiverPhone;
  final int index;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(listener: (context, state) {

    },
    builder:(context,state){
      return Scaffold(
        appBar: AppBar(title: Text('Transfer Money to $receiverName'),),
        body: Column(
          children: [
            Text('Transfer to : $receiverName'),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: controller,
              onEditingComplete: (){
                if(controller.text.isEmpty || controller.text == null ||
                    controller.text.length <=0){
                  print('nothing to transfer');
                }else{
                  HomeCubit.get(context).transferMoney(index: index,
                      senderName: 'Ahmed '
                      'Galal', senderEmail:'agalal819@gmail.com', amount:
                  int.parse(controller.text), senderPhone: 01119369127,
                      receiverName:
                  receiverName,
                      receiverEmail: receiverEmail, receiverPhone:
                      receiverPhone).then((value) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar
                          (content: Text('Transfer Done to $receiverName '
                            'with Amount ${controller.text}')));
                        Navigator.push(context, MaterialPageRoute(builder:
                            (context) => HomeScreen(),));
                  });
                }
              },
              autofocus: true,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: 'Enter Amount to '
                  'transfer',border: OutlineInputBorder(borderRadius: 
              BorderRadius.circular(30))),
            ),
          ],
        ),
      );
    });
  }
}

import 'dart:math';

import 'package:banking_task/business_logic/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

class HomeCubit extends Cubit <HomeStates>{
  HomeCubit():super(InitialHomeState());
  static HomeCubit get(context)=> BlocProvider.of(context);



   late Database database;
   List users=[];
  Future<void> createDatabase ()async{
    print('Creating Database ....');
      database = await openDatabase('database.db',version: 1,
        onCreate:
          (database,version)async{
            await database.execute(
                'CREATE TABLE users (id INTEGER PRIMARY KEY, name TEXT, '
                    'balance INTEGER,email TEXT,phone INTEGER)');
            await database.execute('CREATE TABLE transactions (id INTEGER '
                'PRIMARY KEY, '
                'senderName TEXT, '
                'amount INTEGER,senderEmail TEXT,senderPhone INTEGER,'
                'receiverName TEXT,receiverEmail TEXT,receiverPhone INTEGER)'
            ).then((value)async {
              print('Tables Created Successfully.');

            });

         },
        onOpen: (database)async{
          users = await database.rawQuery('SELECT * FROM users');
          transactions = await database.rawQuery('SELECT * FROM transactions');
          print(users);
          print(transactions);
          if(users.length<=10){
            print('adding Users...');
            List names = ['Galal','Tarek','Jhon','Sara','Pola','Ali','Marwa','Y'
                'ousra','Tawfik','Ramadan','Gaber','Ehab'];
            // Insert some records in a transaction
            for(int i =0;i<=10;i++){
              await database.transaction((txn) async{
                await txn.rawInsert(
                    'INSERT INTO users(name, balance, email, phone) VALUES'
                        '("${names[i]}", '
                        '${Random().nextInt(10000)}, "${names[i]}@gmail'
                        '.com",0111289812${Random().nextInt(9)})');
              });

            }
          }

        ///onOpenFinished
        }
      );

  }
  int currentIndex = 0;

  void navbarChanger(index){
    currentIndex = index;
    emit(NavBarChangerState());
  }
  
  List transactions=[];
  Future<void> transferMoney({required String senderName,required String
  senderEmail, required int amount, required int senderPhone, required String
  receiverName, required String receiverEmail, required int receiverPhone,required int
  index})
  async{
    await database.transaction((txn) async{
      txn.rawInsert('INSERT INTO transactions(senderName, amount, '
          'senderEmail, senderPhone, receiverName, receiverEmail, '
          'receiverPhone) VALUES("$senderName",$amount,"$senderEmail",'
          '$senderPhone,"$receiverName","$receiverEmail",$receiverPhone)').then(
              (value)async {
                transactions = await database.rawQuery('SELECT * FROM '
                    'transactions');
                addMoneyToUser(amount: amount, receiverName: receiverName);
                users = await database.rawQuery('SELECT * FROM users');

                print(users[index]);
                emit(TransferMoneySuccess());
              }).catchError((error){
                emit(TransferMoneyError(error.toString()));
      });
    });
  }
  Future<void> addMoneyToUser({required int amount, required String 
  receiverName})async {
    await database.transaction((txn)async {
      txn.rawUpdate('UPDATE users SET balance =balance + $amount WHERE name ='
          ' "$receiverName";');
    });
  }
}
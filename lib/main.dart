import 'package:first_app/widgets/new_transaction.dart';
import 'package:first_app/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import 'models/const.dart';
import './models/transaction.dart';

void main() => runApp(const BudgetApp());

class BudgetApp extends StatelessWidget {
  const BudgetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: appBarColor,
        ),
        buttonTheme: const ButtonThemeData(buttonColor: appBarColor),
        cardTheme: const CardTheme(color: cardBackgroundColor),
      ),
      title: "Budget App",
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Transaction> transactions = [];

  void startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
      // backgroundColor: ,
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      isScrollControlled: true,
      context: context,
      builder: (_) {
        return FractionallySizedBox(
          heightFactor: 0.74,
          child: NewTransaction(addNewTransaction),
        );
      },
    );
  }

  void addNewTransaction(
      double txAmount, String txDetail, DateTime chosenDate) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      category: "category",
      amount: txAmount,
      date: chosenDate,
      detail: txDetail,
    );

    setState(() {
      transactions.add(newTx);
      print(txAmount);
      print(txDetail);
      // print(transactions.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          elevation: 5,
          backgroundColor: appBarColor.withOpacity(0.9),
          child: const Icon(Icons.add, size: 40),
          onPressed: () {
            startAddNewTransaction(context);
          },
        ),
        appBar: AppBar(
          title: const Text("Budget App"),
        ),
        body: Column(
          children: <Widget>[
            Container(
              color: Colors.green,
              height: 115,
              width: double.infinity,
              child: const Center(
                child: Card(
                  child: Text("Chart"),
                ),
              ),
            ),
            TransactionList(transactions),
          ],
        ),
      ),
    );
  }
}

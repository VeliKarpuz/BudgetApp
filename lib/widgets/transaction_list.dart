import 'package:first_app/widgets/chart.dart';
import 'package:first_app/widgets/new_transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
import '../main.dart';

class TransactionList extends StatefulWidget {
  final List<Transaction> transactions;
  const TransactionList(this.transactions, {super.key});

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
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
          child: NewTransaction(editTransaction),
        );
      },
    );
  }

  List<Transaction> get recentTransactions {
    return widget.transactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void editTransaction(double editAmount, String editDetail) {
    final editTx = Transaction(
      id: DateTime.now().toString(),
      category: "category",
      amount: editAmount,
      detail: editDetail,
      date: DateTime.now(),
    );

    setState(() {
      widget.transactions.add(editTx);
    });
  }

  void editButton(String id) {
    setState(() {
      widget.transactions.removeWhere((tx) => tx.id == id);
      Chart(recentTransactions);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.transactions.length,
        itemBuilder: (context, index) => Card(
          child: ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.car_crash),
            ),
            title: Text(
              widget.transactions[index].amount.toString(),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(widget.transactions[index].detail),
                Text(
                  DateFormat.MMMd().format(widget.transactions[index].date),
                ),
              ],
            ),
            isThreeLine: true,
            dense: false,
            trailing: IconButton(
              onPressed: () {
                editButton(widget.transactions[index].id);
                NewTransaction(editTransaction);
              },
              icon: const Icon(Icons.edit),
              iconSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/const.dart';
import '../models/transaction.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;
  const NewTransaction(this.addTx, {super.key});
  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final List<Transaction> transactions = [];
  final detailController = TextEditingController();
  final amountController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  bool income = true;

  void submitData() {
    if (amountController.text.isEmpty) {
      return;
    }
    final enteredDetail = detailController.text;
    double enteredAmount = double.parse(amountController.text);
    if (income == true) {}
    if (income == false) {
      enteredAmount = -double.parse(amountController.text);
    }
    widget.addTx(enteredAmount, enteredDetail, selectedDate);
  }

  void datePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime.now(),
      // builder: (context, child) {
      //   return Theme(
      //     data: Theme.of(context).copyWith(
      //       colorScheme: const ColorScheme.dark(
      //           primary: appBarColor,
      //           onPrimary: Colors.white,
      //           surface: appBarColor,
      //           onSurface: Colors.black,
      //           background: cardBackgroundColor),
      //     ),
      //     child: child!,
      //   );
      // },
    ).then((pickedDate) {
      setState(() {
        selectedDate = pickedDate!;
      });
    });
    print("object");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 5,
                      backgroundColor: income ? Colors.green : Colors.grey,
                    ),
                    onPressed: () {
                      income = true;
                      setState(() {
                        submitData;
                      });
                    },
                    child: const Text("Income"),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: income ? Colors.grey : Colors.red,
                    ),
                    onPressed: () {
                      income = false;
                      setState(() {
                        submitData;
                      });
                    },
                    child: const Text("Expense"),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 90,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: 7,
            itemBuilder: (context, index) => Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const CircleAvatar(
                    backgroundColor: iconColor,
                    child: Icon(Icons.favorite, color: backgroundColor),
                  ),
                  iconSize: 50,
                ),
                const Text("Icon")
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            keyboardType: TextInputType.number,
            controller: amountController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.elliptical(10, 10),
                ),
              ),
              label: Text("Amount"),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            // onSubmitted: (value) => submitData(),
            controller: detailController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.elliptical(10, 10),
                ),
              ),
              label: Text("Details"),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Coosen Date: "),
                ),
                Text(
                  DateFormat.yMMMd().format(selectedDate).toString(),
                  style: TextStyle(color: Colors.green),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                style: TextButton.styleFrom(foregroundColor: Colors.green),
                onPressed: () {
                  datePicker();
                },
                child: const Text("Choose Date"),
              ),
            ),
          ],
        ),
        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: appBarColor),
            onPressed: () {
              submitData();
              amountController.clear();
              detailController.clear();
            },
            child: const Text("Add Transaction"),
          ),
        )
      ],
    );
  }
}

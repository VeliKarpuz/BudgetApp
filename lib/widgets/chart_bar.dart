import 'package:first_app/models/const.dart';
import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double percentOfTotal;
  const ChartBar(
      {super.key,
      required this.label,
      required this.spendingAmount,
      required this.percentOfTotal});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
            child: Text("$spendingAmount"),
          ),
          const SizedBox(
            height: 4,
          ),
          SizedBox(
            height: 60,
            width: 10,
            child: Stack(children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                ),
              ),
              FractionallySizedBox(
                heightFactor: percentOfTotal,
                child: Container(
                    color: spendingAmount > 0 ? appBarColor : Colors.redAccent),
              )
            ]),
          ),
          const SizedBox(height: 4),
          Text(label),
        ],
      ),
    );
  }
}

import 'dart:ffi';

import 'package:first_app/models/const.dart';
import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double percentOfTotal;
  ChartBar(
      {required this.label,
      required this.spendingAmount,
      required this.percentOfTotal});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Column(
        children: <Widget>[
          Container(
            height: 20,
            child: Text("$spendingAmount"),
          ),
          SizedBox(
            height: 4,
          ),
          Container(
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
          SizedBox(height: 4),
          Text(label),
        ],
      ),
    );
  }
}

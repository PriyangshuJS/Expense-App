import 'package:flutter/material.dart';

import '../model/transaction.dart';

class MyChart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  const MyChart(this.recentTransaction, {super.key});

  List<Map<String, Object>> get groupTransactionValues {
    return List.generate(7, (index) {
      return {"day": "day1", "amount": "amount1"};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 20,
        margin: const EdgeInsets.all(20),
        child: Row(
          children: const [],
        ));
  }
}

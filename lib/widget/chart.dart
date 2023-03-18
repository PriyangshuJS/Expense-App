import 'package:expense_app/widget/chartbar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/transaction.dart';

class MyChart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  const MyChart(this.recentTransaction, {super.key});

  List<Map<String, Object>> get groupTransactionValues {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(days: index));
      var totalsum = 0;
      for (var i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].date.day == weekday.day &&
            recentTransaction[i].date.month == weekday.month &&
            recentTransaction[i].date.year == weekday.year) {
          totalsum += recentTransaction[i].amount;
        }
      }
      return {
        "day": DateFormat.E().format(weekday).substring(0, 3),
        "amount": totalsum,
      };
    });
  }

  int get totalWeekSpending {
    return groupTransactionValues.fold(0, (sum, dayVal) {
      return sum + (dayVal["amount"] as int);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 20,
        margin: const EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: groupTransactionValues.map((data) {
                return Flexible(
                  fit: FlexFit.tight,
                  child: ChartBar(
                    data["day"].toString(),
                    (data["amount"] as int),
                    totalWeekSpending == 0.0
                        ? 0.0
                        : ((data["amount"] as int) / totalWeekSpending),
                  ),
                );
              }).toList()),
        ));
  }
}

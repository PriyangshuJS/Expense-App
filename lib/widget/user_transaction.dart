import 'package:flutter/material.dart';

import 'package:expense_app/widget/chart.dart';
import 'package:expense_app/widget/new_tansaction.dart';
import 'package:expense_app/widget/transaction_list.dart';
import '../model/transaction.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({super.key});

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _usertransaction = [
    Transaction(id: "I1", title: "Food", amount: 500, date: DateTime.now()),
    Transaction(id: "I2", title: "Clothes", amount: 2000, date: DateTime.now()),
    Transaction(id: "I3", title: "Sobji", amount: 1300, date: DateTime.now()),
  ];

  void _addTransaction(String txitle, int txamount) {
    final newtx = Transaction(
      id: ((_usertransaction.length) + 1).toString(),
      title: txitle,
      amount: txamount,
      date: DateTime.now(),
    );

    setState(() {
      _usertransaction.add(newtx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const MyChart(),
        NewTransaction(_addTransaction),
        const SizedBox(
          height: 15,
        ),
        TransactionList(_usertransaction),
      ],
    );
  }
}

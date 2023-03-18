import 'package:flutter/material.dart';

import 'model/transaction.dart';
import 'package:expense_app/widget/chart.dart';
import 'package:expense_app/widget/new_tansaction.dart';
import 'package:expense_app/widget/transaction_list.dart';

void main() => runApp(const ExpenseApp());

class ExpenseApp extends StatelessWidget {
  const ExpenseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Expense App",
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: HomePage(),
    );
  }
}

// ignore: use_key_in_widget_constructors
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _usertransaction = [
    // Transaction(id: "I1", title: "Food", amount: 500, date: DateTime.now()),
    // Transaction(id: "I2", title: "Clothes", amount: 2000, date: DateTime.now()),
    // Transaction(id: "I3", title: "Sobji", amount: 1300, date: DateTime.now()),
  ];

  List<Transaction> get _recentTransaction {
    return _usertransaction.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList();
  }

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

  void _startnewtransaction(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return NewTransaction(_addTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense App"),
        centerTitle: true,

        elevation: 15,
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () => _startnewtransaction(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            MyChart(_recentTransaction),
            const SizedBox(
              height: 10,
            ),
            TransactionList(_usertransaction),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startnewtransaction(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}

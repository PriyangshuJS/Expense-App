import 'package:flutter/material.dart';

import './transaction.dart';

void main() => runApp(const ExpenseApp());

class ExpenseApp extends StatelessWidget {
  const ExpenseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Expense App",
      home: HomePage(),
    );
  }
}

// ignore: use_key_in_widget_constructors
class HomePage extends StatelessWidget {
  final List<Transaction> transaction = [
    Transaction(id: "I1", title: "Food", amount: 500, date: DateTime.now()),
    Transaction(id: "I2", title: "Clothes", amount: 2000, date: DateTime.now()),
    Transaction(id: "I3", title: "Sobji", amount: 1300, date: DateTime.now()),
    Transaction(id: "I3", title: "Sobji", amount: 1300, date: DateTime.now()),
  ];
  String titlein = "";
  String amountin = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Expense App"),
          centerTitle: true,
          backgroundColor: Colors.teal,
          elevation: 15,
        ),
        body: Column(
          //This Column Holds the CHART and REPORT
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Card(
              child: Text("CHART"),
            ),
            // ignore: prefer_const_constructors
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: "Title"),
                    onChanged: (val) => titlein = val,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: "Amount"),
                    onChanged: (val) => amountin = val,
                  ),
                  TextButton(
                    child: Text("Add Transaction"),
                    onPressed: () {
                      print(titlein);
                      print(amountin);
                    },
                  ),
                ],
              ),
            ),
            Column(
              //This column holds all the transactions.
              children: transaction.map(
                (tx) {
                  return Card(
                    elevation: 10,
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: ListTile(
                      title: Text(
                        tx.title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: Text(
                        tx.id,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(tx.date.toString()),
                      leading: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.teal,
                            width: 2,
                          ),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "\$${tx.amount}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
          ],
        ));
  }
}

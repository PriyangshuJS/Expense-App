import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/transaction.dart';

// ignore: use_key_in_widget_constructors
class TransactionList extends StatelessWidget {
  final List<Transaction> usertransaction;
  final Function txdelete;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  TransactionList(this.usertransaction, this.txdelete);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: usertransaction.isEmpty
          ? Column(
              children: [
                const SizedBox(
                  height: 70,
                ),
                const Text(
                  "No Expenditure Listed !! ",
                  style: TextStyle(fontSize: 25),
                ),
                const SizedBox(
                  height: 100,
                ),
                SizedBox(
                  height: 200,
                  child: Image.asset(
                    "assets/images/empty.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  elevation: 10,
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: ListTile(
                    title: Text(
                      usertransaction[index].title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      color: const Color.fromARGB(255, 255, 124, 124),
                      onPressed: () => txdelete(usertransaction[index].id),
                    ),
                    subtitle: Text(
                      DateFormat.yMMMMd().format(usertransaction[index].date),
                      style: const TextStyle(fontSize: 13),
                    ),
                    leading: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 3, color: Theme.of(context).primaryColor),
                      ),
                      child: Text(
                        "₹${usertransaction[index].amount}",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColorDark,
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: usertransaction.length,
            ),
    );
  }
}

import 'package:flutter/material.dart';
import '../model/transaction.dart';

// ignore: use_key_in_widget_constructors
class TransactionList extends StatelessWidget {
  final List<Transaction> usertransaction;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  TransactionList(this.usertransaction);
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
                  "No Transaction Listed !! ",
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
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      usertransaction[index].id,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(usertransaction[index].date.toString()),
                    leading: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).primaryColorDark,
                          width: 2,
                        ),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "\$${usertransaction[index].amount}",
                        style: TextStyle(
                          fontSize: 18,
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

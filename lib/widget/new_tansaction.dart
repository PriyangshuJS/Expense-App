import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addtx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addtx, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            decoration: const InputDecoration(labelText: "Title"),
            controller: titleController,
          ),
          TextField(
            decoration: const InputDecoration(labelText: "Amount"),
            controller: amountController,
          ),
          TextButton(
            child: const Text("Add Transaction"),
            onPressed: () {
              addtx(titleController.text, int.parse(amountController.text));
            },
          ),
        ],
      ),
    );
  }
}

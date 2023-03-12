import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  NewTransaction({super.key});

  final titleController = TextEditingController();
  final amountController = TextEditingController();

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
              debugPrint(titleController.text);
              debugPrint(amountController.text);
            },
          ),
        ],
      ),
    );
  }
}

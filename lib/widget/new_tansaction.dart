import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addtx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  void onSubmit() {
    final titlesub = titleController.text;
    final amountsub = int.parse(amountController.text);
    if (titlesub.isEmpty || amountsub <= 0) {
      return;
    }
    addtx(titlesub, amountsub);
  }

  NewTransaction(this.addtx, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: "Title"),
            controller: titleController,
            onChanged: (_) => onSubmit,
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: "Amount"),
            controller: amountController,
            keyboardType: TextInputType.number,
            onChanged: (_) => onSubmit,
          ),
          TextButton(
            onPressed: onSubmit,
            child: const Text("Add Transaction"),
          ),
        ],
      ),
    );
  }
}

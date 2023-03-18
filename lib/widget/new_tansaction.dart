import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addtx;
  const NewTransaction(this.addtx, {super.key});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void onSubmit() {
    final titlesub = titleController.text;
    final amountsub = int.parse(amountController.text);
    if (titlesub.isEmpty || amountsub <= 0) {
      return;
    }
    widget.addtx(titlesub, amountsub);
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(
            height: 15,
          ),
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
          const SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: onSubmit,
            child: const Text(
              "Add Transaction",
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}

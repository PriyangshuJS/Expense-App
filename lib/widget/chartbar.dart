import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String day;
  final int amount;
  final double amoutPercentage;

  const ChartBar(this.day, this.amount, this.amoutPercentage, {super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          day,
          style: const TextStyle(fontSize: 14),
        ),
        const SizedBox(
          height: 4,
        ),
        SizedBox(
          height: 80,
          width: 25,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 2),
                  color: const Color.fromARGB(255, 226, 255, 252),
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2.0,
                      spreadRadius: 0.0,
                      offset: Offset(3, 3), // shadow direction: bottom right
                    )
                  ],
                ),
              ),
              FractionallySizedBox(
                heightFactor: amoutPercentage,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 2),
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        FittedBox(
          child: Text("₹ ${amount.toString()}"),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double value;
  final double percentage;

  const ChartBar({
    super.key,
    required this.label,
    required this.value,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Ensures proper spacing
          children: [
            SizedBox(
              height: constraints.maxHeight * 0.15,
              child: Align(
                alignment: Alignment.center,
                child: Text(value.toStringAsFixed(2), textAlign: TextAlign.center),
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.7,
              width: 10,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      color: const Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: percentage,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.15,
              child: Align(
                alignment: Alignment.center,
                child: Text(label, textAlign: TextAlign.center),
              ),
            ),
          ],
        );
      },
    );
  }
}

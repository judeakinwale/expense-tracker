// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  // const ChartBar({Key? key}) : super(key: key);
  final String label;
  final double spendingAmount;
  final double spendingPercentage; // spending percentage of total spending

  ChartBar(this.label, this.spendingAmount, this.spendingPercentage);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Column(
          children: [
            Container(
              // height: 20,
              height: constraints.maxHeight * 0.15,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: FittedBox(
                child: Text('\$${spendingAmount.toStringAsFixed(0)}'),
              ),
            ),
            SizedBox(
              // height: 4,
              height: constraints.maxHeight * 0.05,
            ),
            Container(
              // height: 60,
              height: constraints.maxHeight * 0.6,
              width: 10,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: spendingPercentage,
                    child: Container(
                      decoration: BoxDecoration(
                        // border: Border.all(color: Colors.grey, width: 1),
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              // height: 4,
              height: constraints.maxHeight * 0.05,
            ),
            Container(
              // height: 20,
              height: constraints.maxHeight * 0.15,
              child: Text(label),
            )
          ],
        );
      },
    );
    // return Column(
    //   children: [
    //     Container(
    //       height: 20,
    //       child: FittedBox(
    //         child: Text('\$${spendingAmount.toStringAsFixed(0)}'),
    //       ),
    //     ),
    //     SizedBox(
    //       height: 4,
    //     ),
    //     Container(
    //       height: 60,
    //       width: 10,
    //       child: Stack(
    //         children: [
    //           Container(
    //             decoration: BoxDecoration(
    //               border: Border.all(color: Colors.grey, width: 1),
    //               color: Color.fromRGBO(220, 220, 220, 1),
    //               borderRadius: BorderRadius.circular(10),
    //             ),
    //           ),
    //           FractionallySizedBox(
    //             heightFactor: spendingPercentage,
    //             child: Container(
    //               decoration: BoxDecoration(
    //                 // border: Border.all(color: Colors.grey, width: 1),
    //                 color: Theme.of(context).primaryColor,
    //                 borderRadius: BorderRadius.circular(10),
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //     SizedBox(
    //       height: 4,
    //     ),
    //     Text(label)
    //   ],
    // );
  }
}

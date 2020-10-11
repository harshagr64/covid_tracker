import 'package:flutter/material.dart';

class TodaysStatsWidget extends StatelessWidget {
  final String title;
  final String caseNo;

  TodaysStatsWidget(this.title, this.caseNo);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
//                          border: Border.all(width: 2, color: Color.fromRGBO(34, 34, 59, 0.7),),
              borderRadius: BorderRadius.circular(60),
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(34, 34, 59, 0.7),
                  Color.fromRGBO(74, 78, 105, 0.9),
                ],
              )),
        ),
        Container(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(242, 233, 228, 0.8),
                Color.fromRGBO(242, 233, 228, 0.5),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$title",
                style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '$caseNo',
                style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).primaryColor.withOpacity(0.8)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

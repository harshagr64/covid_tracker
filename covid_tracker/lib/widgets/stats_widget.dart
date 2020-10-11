import 'package:flutter/material.dart';

class StatsWidget extends StatelessWidget {
  final String title;
  final String casesNo;

  StatsWidget(this.title, this.casesNo);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
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
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "$casesNo",
            style: TextStyle(
                fontSize: 19,
                color: Theme.of(context).primaryColor.withOpacity(0.8)),
          )
        ],
      ),
    );
  }
}

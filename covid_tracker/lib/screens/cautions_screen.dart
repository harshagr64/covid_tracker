import "package:flutter/material.dart";

class CautionsScreen extends StatelessWidget {
  Widget cardWidgetBuilder(context, String title, String image) {
    return Card(
      elevation: 5,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            width: 120,
            height: 120,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            title,
            style: TextStyle(
                fontSize: 20,
                letterSpacing: 0.7,
                wordSpacing: 2,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  static const routeName = 'cautions';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: null,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: ListView(
          children: [
            Row(
              children: [
                Text(
                  "Prevention Tips",
                  style:
                      TextStyle(fontSize: 20, letterSpacing: 1, wordSpacing: 3),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            cardWidgetBuilder(
                context, 'Avoid Close Contact', 'assets/images/distance.png'),
            SizedBox(
              height: 20,
            ),
            cardWidgetBuilder(context, 'Wear Mask', 'assets/images/mask.png'),
            SizedBox(
              height: 20,
            ),
            cardWidgetBuilder(context, 'Wash Hands Regularly',
                'assets/images/wash_hands.png'),
            SizedBox(
              height: 10,
            ),
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context).primaryColor.withOpacity(0.5),
                          Theme.of(context).primaryColor.withOpacity(1)
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20)),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.all(15),
                      width: 120,
                      height: 120,
                      child: Image.asset(
                        'assets/images/own_test.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(children: [
                      Text(
                        " Query Related to COVID-19",
                        style: TextStyle(
                          fontSize: 17,
                          color: Color.fromRGBO(242, 233, 228, 1),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text(
                        "Call on: 1075",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromRGBO(242, 233, 228, 1),
                        ),
                      )
                    ])
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

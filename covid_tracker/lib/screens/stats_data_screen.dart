import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "../providers/get_stats_data_provider.dart";

class StatsDataScreen extends StatelessWidget {
  static const routeName = 'states-data';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("State-Wise Data"),
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Confirmed',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                  ),
                  Text(
                    'Deaths',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                  ),
                  Text(
                    'Recovered',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                  ),
                  Text(
                    'Active',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
              FutureBuilder(
                  future:
                      Provider.of<GetStatsDataProvider>(context, listen: false)
                          .fetchData(),
                  builder: (ctx, snapshot) {
                    return snapshot.connectionState == ConnectionState.waiting
                        ? Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(20),
                            child: CircularProgressIndicator(
                              backgroundColor: Theme.of(context).primaryColor,
                            ),
                          )
                        : Expanded(
                            child: ListView.builder(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              itemBuilder: (ctx, index) => Column(
                                children: [
                                  Container(
                                    color: Color.fromRGBO(242, 233, 228, 1),
                                    width: double.infinity,
                                    height: 30,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 0, vertical: 10),
                                    child: Text(
                                      "${snapshot.data[index]['state']}",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Theme.of(context).primaryColor),
                                    ),
                                    alignment: Alignment.center,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${snapshot.data[index]['confirmed']}",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      Text("${snapshot.data[index]['deaths']}",
                                          style: TextStyle(fontSize: 16)),
                                      Text(
                                          "${snapshot.data[index]['recovered']}",
                                          style: TextStyle(fontSize: 16)),
                                      Text("${snapshot.data[index]['active']}",
                                          style: TextStyle(fontSize: 16))
                                    ],
                                  )
                                ],
                              ),
                              itemCount: snapshot.data.length,
                            ),
                          );
                  })
            ],
          )),
    );
  }
}

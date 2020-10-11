import 'package:covidtracker/widgets/stats_widget.dart';
import "package:flutter/material.dart";
import "../providers/get_data_provider.dart";
import "package:provider/provider.dart";
import "stats_data_screen.dart";
import "../widgets/todays_stats_widget.dart";
import "../providers/get_stats_data_provider.dart";

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = false;

  @override
  void initState() {
    setState(() {
      _isLoading = true;
    });
    // TODO: implement initState
    Provider.of<GetDataProvider>(context, listen: false).fetchData().then((_) {
      Provider.of<GetStatsDataProvider>(context, listen: false).fetchData();

      setState(() {
        _isLoading = false;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final extractedData =
        Provider.of<GetDataProvider>(context, listen: false).getData;
    final extractedTodaysData =
        Provider.of<GetDataProvider>(context, listen: false).todaysData;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: null,
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                backgroundColor: Theme.of(context).primaryColor,
              ),
            )
          : Padding(
              padding: EdgeInsets.only(right: 20, left: 20, top: 0, bottom: 10),
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    alignment: Alignment.center,
                    child: Text(
                      "India's Stats",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor.withOpacity(0.8),
                      ),
                    ),
                  ),
//              SizedBox(
//                height: 0,
//              ),

                  Container(
                    padding: EdgeInsets.all(5),
                    height: 380,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(34, 34, 59, 0.7),
                            Color.fromRGBO(74, 78, 105, 0.9),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(30)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            StatsWidget(
                              'Total Cases',
                              extractedData['totalCases'].toString(),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            StatsWidget('Total Deaths',
                                extractedData['totalDeaths'].toString()),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            StatsWidget('Active Cases',
                                extractedData['activeCases'].toString()),
                            SizedBox(
                              width: 10,
                            ),
                            StatsWidget('Recovered',
                                extractedData['recovered'].toString()),
                          ],
                        ),
                        Expanded(
                          child: ListTile(
                            leading: Text(
                              "State-Wise Data",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.white70),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward,
                              size: 25,
                              color: Colors.white70,
                            ),
                            onTap: () => Navigator.of(context)
                                .pushNamed(StatsDataScreen.routeName),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(children: [
                    Text(
                      "Today's Stats",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor.withOpacity(0.8),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 150,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          TodaysStatsWidget("Total",
                              extractedTodaysData['totalCases'].toString()),
                          SizedBox(
                            width: 10,
                          ),
                          TodaysStatsWidget("Recovered",
                              extractedTodaysData['recovered'].toString()),
                          SizedBox(
                            width: 10,
                          ),
                          TodaysStatsWidget("Deaths",
                              extractedTodaysData['totalDeaths'].toString()),
                        ],
                      ),
                    ),
                  ]),
                ],
              ),
            ),
    );
  }
}

import 'package:covidtracker/screens/tabs_screen.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import "package:provider/provider.dart";
import "providers/get_data_provider.dart";
import "screens/home_screen.dart";
import "providers/get_stats_data_provider.dart";
import "screens/stats_data_screen.dart";
import "screens/cautions_screen.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<int, Color> priColor = {
      50: Color.fromRGBO(34, 34, 59, .1),
      100: Color.fromRGBO(34, 34, 59, .2),
      200: Color.fromRGBO(34, 34, 59, .3),
      300: Color.fromRGBO(34, 34, 59, .4),
      400: Color.fromRGBO(34, 34, 59, .5),
      500: Color.fromRGBO(34, 34, 59, .6),
      600: Color.fromRGBO(34, 34, 59, .7),
      700: Color.fromRGBO(34, 34, 59, .8),
      800: Color.fromRGBO(34, 34, 59, .9),
      900: Color.fromRGBO(34, 34, 59, 1),
    };
    MaterialColor colorCustom = MaterialColor(0xFF22223B, priColor);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => GetDataProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => GetStatsDataProvider(),
        )
      ],
      builder: (ctx, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Covid Tracker',
        home: TabsScreen(),
        theme: ThemeData(
          primarySwatch: colorCustom,
          accentColor: Color.fromRGBO(242, 233, 228, 1),
          fontFamily: 'Syne',
        ),
        routes: {
          StatsDataScreen.routeName: (ctx) => StatsDataScreen(),
          CautionsScreen.routeName: (ctx) => CautionsScreen(),
        },
      ),
    );
  }
}

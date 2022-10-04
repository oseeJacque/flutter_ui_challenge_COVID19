
import 'package:flutter/material.dart';
import 'package:covid_ui_design_challenge/src/models/TextStyler.dart';
import 'package:pie_chart/pie_chart.dart';


import '../../constants.dart';
import '../../flutter_icons.dart';


class StatisticPage extends StatefulWidget {
  @override
  _StatisticPageState createState() => _StatisticPageState();
}

class _StatisticPageState extends State<StatisticPage> {
  
  List <Color> cat=[Colors.redAccent,Colors.yellowAccent,Colors.blueAccent]; 
  Map <String,double> datMap={
    "Confirmed": 25.0, 
    "Recovered": 75.0, 
    "Deaths": 15.0
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColrs.bgClolor,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width*.85,
                height: 275,
                decoration: BoxDecoration(
                  color: AppColrs.mainColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                padding: const EdgeInsets.only(top: 25),
                child: Image.asset("assets/images/virus2.png"),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _CustomAppBarWidget(),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "STATISTICS",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  _buildStatistic(),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: _buildGender(FlutterIcons.male,
                              Colors.orangeAccent, "MALE", "59.5%"),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: _buildGender(FlutterIcons.female,
                              Colors.pinkAccent, "FEMALE", "40.5%"),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: RichText(
                      text: TextSpan(
                        text: "Global Cases of ",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.black87,
                        ),
                        children: [
                          TextSpan(
                            text: "COVID 19",
                            style: TextStyle(
                              color: AppColrs.mainColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      height: 170,
                      child: Center(child: Image.asset("assets/images/map.png")),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildGender(IconData icon, Color color, String title, String value) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        border: Border.all(color: Colors.white),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(1, 1),
            spreadRadius: 1,
            blurRadius: 1,
          ),
        ],
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                icon,
                size: 60,
                color: color,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontSize: 24,
                    ),
                  ),
                  const Text(
                    "Confirmed\nCase",
                    style: TextStyle(
                      color: Colors.black38,
                      height: 1.5,
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            value,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildStatistic() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        border: Border.all(color: Colors.white),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(1, 1),
            spreadRadius: 1,
            blurRadius: 1,
          ),
        ],
      ),
      margin: const EdgeInsets.only(top:20.0,left: 30.0, right: 30.0),
      padding: EdgeInsets.all(24),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              width: 150,
              height: 150,
              child:PieChart(
                dataMap: datMap, 
                colorList: cat,
                chartRadius: MediaQuery.of(context).size.width/.8,
                chartType: ChartType.ring,
                ringStrokeWidth: 24.0,
                chartValuesOptions: const ChartValuesOptions(
                showChartValues: true, 
                
                  ),
                  legendOptions: LegendOptions(showLegends: false),

                ) ,
            ),
            SizedBox(width: 25),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildStatisticItem(
                    Colors.blueAccent, "Confirmed", "23,29,539"),
                _buildStatisticItem(
                    Colors.yellowAccent, "Recovered", "5,92,229"),
                _buildStatisticItem(Colors.redAccent, "Deaths", "1,60,717"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatisticItem(Color color, String title, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Icon(
          FlutterIcons.label,
          size: 50,
          color: color,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(
                color: Colors.black38,
              ),
            ),
            SizedBox(height: 5),
            Text(value),
          ],
        ),
      ],
    );
  }
  
  Widget _CustomAppBarWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        const IconButton(
          icon: Icon(
            FlutterIcons.menu,
            color: Colors.white,
          ),
          onPressed: null,
        ),
        Container(
          width: MediaQuery.of(context).size.width*0.1,
          height: MediaQuery.of(context).size.height*0.08,
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: const BorderRadius.all(
              Radius.circular(100),
            ),
            image: const DecorationImage(
              image: AssetImage("assets/images/profile.jpg",),
              fit: BoxFit.cover
            ),
          ),
        )
      ],
    );
  }
  
  
}
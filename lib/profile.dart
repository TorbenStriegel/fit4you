import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends State<ProfilePage> {
  List<_CaloriesData> data = [
    _CaloriesData('Jan', 10324),
    _CaloriesData('Feb', 7384),
    _CaloriesData('Mar', 8904),
    _CaloriesData('Apr', 6934),
    _CaloriesData('May', 5934),
    _CaloriesData('Jun', 5436),
    _CaloriesData('Jul', 5132),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Your personal training data"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              //Initialize the chart widget
              SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  // Chart title
                  title: ChartTitle(text: 'Calories'),
                  // Enable legend
                  legend: Legend(isVisible: true),
                  // Enable tooltip
                  tooltipBehavior: TooltipBehavior(enable: true),
                  series: <ChartSeries<_CaloriesData, String>>[
                    LineSeries<_CaloriesData, String>(
                        dataSource: data,
                        xValueMapper: (_CaloriesData calories, _) =>
                            calories.year,
                        yValueMapper: (_CaloriesData calories, _) =>
                            calories.calories,
                        name: 'Calories',
                        // Enable data label
                        dataLabelSettings: DataLabelSettings(isVisible: true))
                  ]),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  //Initialize the spark charts widget
                  child: SfSparkLineChart.custom(
                    //Enable the trackball
                    trackball: SparkChartTrackball(
                        activationMode: SparkChartActivationMode.tap),
                    //Enable marker
                    marker: SparkChartMarker(
                        displayMode: SparkChartMarkerDisplayMode.all),
                    //Enable data label
                    labelDisplayMode: SparkChartLabelDisplayMode.all,
                    xValueMapper: (int index) => data[index].year,
                    yValueMapper: (int index) => data[index].calories,
                    dataCount: 7,
                  ),
                ),
              )
            ])));
  }
}

class _CaloriesData {
  _CaloriesData(this.year, this.calories);

  final String year;
  final double calories;
}

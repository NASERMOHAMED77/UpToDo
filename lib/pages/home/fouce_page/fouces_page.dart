// ignore_for_file: unused_element

import 'dart:async';

import 'package:firee/core/theme/constant.dart';
import 'package:firee/models/chart_model.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class FouceModePage extends StatefulWidget {
  const FouceModePage({super.key});

  @override
  State<FouceModePage> createState() => _FoucesPageState();
}

class _FoucesPageState extends State<FouceModePage> {
  Timer? timer;
  bool isactive = false;
  Duration duration = Duration(minutes: 60);
  TooltipBehavior? _tooltipBehavior;
  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(
        enable: true,
        canShowMarker: false,
        format: 'point.x : point.y sq.km',
        header: '');
    super.initState();
  }

  void stopTimer() {
    isactive = false;
    setState(() {});
    timer!.cancel();
  }

  void startTimer() {
    isactive = true;
    const oneSec = Duration(
      seconds: 1,
    );
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (duration.inMinutes >= 60) {}
        final seconds = duration.inSeconds - 1;
        setState(() {
          duration = Duration(seconds: seconds);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text(
            'Focus Mode',
            style: TextStyles().subTitleStyle1.copyWith(fontSize: 20),
          )),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularPercentIndicator(
              radius: MediaQuery.of(context).size.width * .25,
              lineWidth: 10,
              center: buildTimer(),
              progressColor: ThemeColors.secondary,
              percent: 0.01666666666 * duration.inMinutes
                ..toDouble(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'While your focus mode is on, all of your notifications will be off',
                style: TextStyles().subTitleStyle1,
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  isactive == false ? startTimer() : stopTimer();
                },
                child: Text(
                    isactive == false ? 'Start Focusing' : 'Stop Focusing')),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Overview',
                    style: TextStyles().titleStyle.copyWith(fontSize: 20),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Container(
                      height: 30,
                      width: 120,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: ThemeColors.third,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'This Week',
                            style: TextStyle(color: Colors.white),
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SfCartesianChart(
              plotAreaBorderWidth: 0,
              primaryXAxis: const CategoryAxis(
                labelStyle: TextStyle(color: Colors.white),
                axisLine: AxisLine(width: 0),
                labelPosition: ChartDataLabelPosition.inside,
                majorTickLines: MajorTickLines(width: 0),
                majorGridLines: MajorGridLines(width: 0),
              ),
              primaryYAxis:
                  const NumericAxis(isVisible: false, minimum: 0, maximum: 10),
              series: _getRoundedColumnSeries(),
              tooltipBehavior: _tooltipBehavior,
            )
          ],
        )),
      ),
    );
  }

  Text buildTimer() {
    String twoDigit(int num) {
      return num.toString().padLeft(2, "0");
    }

    final seconds = twoDigit(duration.inSeconds.remainder(60));
    final minutes = twoDigit(duration.inMinutes.remainder(60));
    final hours = twoDigit(duration.inHours.remainder(60));
    return Text(
      minutes + ":" + seconds,
      style: TextStyles().titleStyle,
    );
  }
}

class ChartSampleData {
  /// Holds the datapoint values like x, y, etc.,
  ChartSampleData(
      {this.x,
      this.y,
      this.xValue,
      this.yValue,
      this.secondSeriesYValue,
      this.thirdSeriesYValue,
      this.pointColor,
      this.size,
      this.text,
      this.open,
      this.close,
      this.low,
      this.high,
      this.volume});

  /// Holds x value of the datapoint
  final dynamic x;

  /// Holds y value of the datapoint
  final num? y;

  /// Holds x value of the datapoint
  final dynamic xValue;

  /// Holds y value of the datapoint
  final num? yValue;

  /// Holds y value of the datapoint(for 2nd series)
  final num? secondSeriesYValue;

  /// Holds y value of the datapoint(for 3nd series)
  final num? thirdSeriesYValue;

  /// Holds point color of the datapoint
  final Color? pointColor;

  /// Holds size of the datapoint
  final num? size;

  /// Holds datalabel/text value mapper of the datapoint
  final String? text;

  /// Holds open value of the datapoint
  final num? open;

  /// Holds close value of the datapoint
  final num? close;

  /// Holds low value of the datapoint
  final num? low;

  /// Holds high value of the datapoint
  final num? high;

  /// Holds open value of the datapoint
  final num? volume;
}

/// Get rounded corner column series
List<ColumnSeries<ChartXYModel, String>> _getRoundedColumnSeries() {
  return <ColumnSeries<ChartXYModel, String>>[
    ColumnSeries<ChartXYModel, String>(
      width: 0.9,
      color: ThemeColors.secondary,
      dataLabelSettings: const DataLabelSettings(
          isVisible: true, labelAlignment: ChartDataLabelAlignment.top),
      dataSource: <ChartXYModel>[
        ChartXYModel('Sun', 5),
        ChartXYModel('Mon', 6),
        ChartXYModel('Tue', 2),
        ChartXYModel('Wen', 8),
        ChartXYModel('Thu', 2),
        ChartXYModel('Fri', 4),
        ChartXYModel('Sut', 1),
      ],

      /// If we set the border radius value for column series,
      /// then the series will appear as rounder corner.
      borderRadius: BorderRadius.circular(10),
      xValueMapper: (ChartXYModel sales, _) => sales.day as String,
      yValueMapper: (ChartXYModel sales, _) => sales.hours,
    ),
  ];
}

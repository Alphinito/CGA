import 'package:cga/src/identidad/marca.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Graphic1 extends StatelessWidget {

  final double day1;
  final double day2;
  final double day3;
  final double day4;
  final double day5;
  final double day6;
  final double day7;

  Graphic1({
    required this.day1,
    required this.day2,
    required this.day3,
    required this.day4,
    required this.day5,
    required this.day6,
    required this.day7,
  });

  @override
  Widget build(BuildContext context) {
    return LineChart(LineChartData(
        minX: 1,
        maxX: 7,
        minY: 0,
        maxY: 10,
        titlesData: FlTitlesData(
            show: true,
            //topTitles: AxisTitles(drawBehindEverything: false),
            //rightTitles: AxisTitles(drawBehindEverything: false),
            leftTitles: AxisTitles(drawBehindEverything: false),
            bottomTitles: AxisTitles(drawBehindEverything: false),
            ),
        gridData: FlGridData(
          show: true,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: Color(identidadColor('Primario Azul')),
              strokeWidth: 0.1,
            );
          },
          drawVerticalLine: true,
          getDrawingVerticalLine: (value) {
            return FlLine(
              color: Color(identidadColor('Primario Azul')),
              strokeWidth: 0.1,
            );
          },
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(color: Color(identidadColor('Primario Azul')), width: 1),
        ),
        lineBarsData: [
          LineChartBarData(
              spots: [
                FlSpot(7, day1),
                FlSpot(6, day2),
                FlSpot(5, day3),
                FlSpot(4, day4),
                FlSpot(3, day5),
                FlSpot(2, day6),
                FlSpot(1, day7)
              ],
              isCurved: true,
              color: Color(identidadColor('Primario Azul')),
              barWidth: 1,
              dotData: FlDotData(show: false),
              belowBarData:
                  BarAreaData(show: true, color: Color(identidadColor('Azul'))))
        ]));
  }
}

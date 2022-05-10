import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'indicator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PieChartSample2(),
    );
  }
}

class PieChartSample2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Card(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            const SizedBox(
              height: 18,
            ),
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: PieChart(
                  PieChartData(
                      pieTouchData:
                      PieTouchData(touchCallback: (FlTouchEvent event, pieTouchResponse) {
                        setState(() {
                          if (!event.isInterestedForInteractions ||
                              pieTouchResponse == null ||
                              pieTouchResponse.touchedSection == null) {
                            touchedIndex = -1;
                            return;
                          }
                          touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
                        });
                      }),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      sectionsSpace: 0,
                      centerSpaceRadius: 40,
                      sections: showingSections()),
                ),
              ),
            ),


            //凡例を表示するコード
            // Column(
            //   mainAxisSize: MainAxisSize.max,
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: const <Widget>[
            //     Indicator(
            //       color: Color(0xff0293ee),
            //       text: 'First',
            //       isSquare: true,
            //     ),
            //     SizedBox(
            //       height: 4,
            //     ),
            //     Indicator(
            //       color: Color(0xfff8b250),
            //       text: 'Second',
            //       isSquare: true,
            //     ),
            //     SizedBox(
            //       height: 4,
            //     ),
            //     Indicator(
            //       color: Color(0xff845bef),
            //       text: 'Third',
            //       isSquare: true,
            //     ),
            //     SizedBox(
            //       height: 4,
            //     ),
            //     Indicator(
            //       color: Color(0xff13d38e),
            //       text: 'Fourth',
            //       isSquare: true,
            //     ),
            //     SizedBox(
            //       height: 18,
            //     ),
            //   ],
            // ),


            const SizedBox(
              width: 28,
              height: 100,
              child: Card(
                color: Colors.yellow,
              ),
            ),
          ],
        ),
      ),
    );
  }

  //円グラフを描画するコード
  List<PieChartSectionData> showingSections() {
    //グラフ化する要素の個数
    return List.generate(4, (i) {

      final isTouched = i == touchedIndex;
      //円グラフないのフォントサイズ
      final fontSize = isTouched ? 25.0 : 16.0;
      //円グラフの半径  :楕円の幅
      final radius = isTouched ? 60.0 : 50.0;


      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff0293ee),
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff845bef),
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xff13d38e),
            value: 15,
            title: '15.0%',
            radius: radius,
            // titleStyle: TextStyle(
            //     fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        default:
          throw Error();
      }
    });
  }
}
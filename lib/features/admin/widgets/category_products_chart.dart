import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:ecomm/features/admin/models/sales.dart';

class CategoryProductsChart extends StatelessWidget {
  final List<BarChartGroupData> seriesList;

  const CategoryProductsChart({
    Key? key,
    required this.seriesList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barGroups: seriesList,
      ),
    );
  }
}

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({Key? key}) : super(key: key);

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  List<Sales> earnings = [
    Sales(category: 'Fruit', value: 100),
    Sales(category: 'Cake', value: 200),
    Sales(category: 'Vegetable', value: 150),
  ];

  @override
  Widget build(BuildContext context) {
    final seriesList = earnings.asMap().entries.map((entry) {
      final index = entry.key;
      final sales = entry.value;
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: sales.value.toDouble(),
            color: Colors.blue,
          ),
        ],
      );
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Analytics'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 250,
            child: CategoryProductsChart(seriesList: seriesList),
          ),
        ],
      ),
    );
  }
}

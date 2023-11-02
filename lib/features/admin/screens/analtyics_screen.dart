import 'package:ecomm/common/widgets/loader.dart';
import 'package:ecomm/features/admin/models/sales.dart';
import 'package:ecomm/features/admin/services/admin_services.dart';
import 'package:ecomm/features/admin/widgets/category_products_chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({Key? key}) : super(key: key);

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  final AdminServices adminServices = AdminServices();
  int? totalSales;
  List<Sales>? earnings;
  List<String> categories = ['Fruit', 'Cake', 'Vegetable'];

  @override
  void initState() {
    super.initState();
    getEarnings();
  }

  getEarnings() async {
    var earningData = await adminServices.getEarnings(context);
    totalSales = earningData['totalEarnings'];
    earnings = earningData['sales'];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return earnings == null || totalSales == null
        ? const Loader()
        : Column(
            children: [
              Text(
                '\$$totalSales',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 250,
                child: CategoryProductsChart(
                    seriesList: earnings!.map((sales) {
                  final index = categories.indexOf(sales.category);
                  return BarChartGroupData(
                    x: index,
                    barRods: [
                      BarChartRodData(
                        color: Colors.blue,
                        toY: sales.earning?.toDouble() ?? 0.0,
                      ),
                    ],
                  );
                }).toList()),
              )
            ],
          );
  }
}

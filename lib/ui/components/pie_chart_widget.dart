import 'package:eriell_app/domain/manager/bitcoin_data/bitcoin_data_bloc.dart';
import 'package:eriell_app/ui/style/app_colors.dart';
import 'package:eriell_app/ui/style/app_style.dart';
import 'package:eriell_app/ui/style/chart_gradient_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:pie_chart/pie_chart.dart';


class PieChartWidget extends StatelessWidget {
  const PieChartWidget({
    super.key,
    required this.state,
  });
  final BitcoinDataLoadedState state;
  @override
  Widget build(BuildContext context) {
    return PieChart(
      chartType: ChartType.disc,
      dataMap: state.dataMap,
      animationDuration: const Duration(milliseconds: 800),
      chartLegendSpacing: 32,
      gradientList: ChartGradientColors.gradientList,
      chartRadius: MediaQuery.of(context).size.width / 2,
      legendOptions: const LegendOptions(
        showLegendsInRow: false,
        legendPosition: LegendPosition.right,
        showLegends: true,
        legendShape: BoxShape.circle,
        legendTextStyle: AppStyle.fontStyle,
      ),
      chartValuesOptions: ChartValuesOptions(
        showChartValueBackground: false,
        showChartValues: true,
        showChartValuesInPercentage: false,
        showChartValuesOutside: false,
        decimalPlaces: 1,
        chartValueStyle: AppStyle.fontStyle.copyWith(
          color: AppColors.blue,
          fontSize: 12,
        ),
      ),
    );
  }
}

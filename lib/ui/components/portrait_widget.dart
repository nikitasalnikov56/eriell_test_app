import 'package:eriell_app/domain/database/hive_box.dart';
import 'package:eriell_app/domain/manager/auth/auth_bloc.dart';
import 'package:eriell_app/domain/manager/bitcoin_data/bitcoin_data_bloc.dart';
import 'package:eriell_app/ui/components/pie_chart_widget.dart';
import 'package:eriell_app/ui/components/table_widget.dart';
import 'package:eriell_app/ui/style/app_colors.dart';
import 'package:eriell_app/ui/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PortraitWidget extends StatelessWidget {
  const PortraitWidget({
    super.key,
    required this.state,
  });
  final BitcoinDataLoadedState state;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        actions: [
          IconButton(
            onPressed: () {
              final box = HiveBoxes.data;
              final users = box.values;
              for (var user in users) {
                if (user.isAuthenticated == true) {
                  user.isAuthenticated = false;
                  box.put(
                      user.userEmail, user); // обновляем пользователя в боксе
                }
              }
              context.read<AuthBloc>().add(CheckAuthEvent());
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body:  PortraitBody(state:  state,),
    );
  }
}

class PortraitBody extends StatelessWidget {
  const PortraitBody({super.key, required this.state});
  final BitcoinDataLoadedState state;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '${state.bitcoinPriceData?.chartName}',
            style: AppStyle.fontStyle.copyWith(fontSize: 35),
          ),
          PieChartWidget(
            state: state,
          ),
          const SizedBox(height: 15),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TableWidget(
                state: state,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

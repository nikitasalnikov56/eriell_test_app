import 'package:eriell_app/domain/manager/bitcoin_data/bitcoin_data_bloc.dart';
import 'package:eriell_app/ui/components/table_widget.dart';
import 'package:eriell_app/ui/style/app_colors.dart';
import 'package:flutter/material.dart';

class LandscapeWidget extends StatelessWidget {
  const LandscapeWidget({
    super.key,
    required this.state,
  });
  final BitcoinDataLoadedState state;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: LanscapeBody(
        state: state,
      ),
    );
  }
}

class LanscapeBody extends StatelessWidget {
  const LanscapeBody({
    super.key,
    required this.state,
  });
  final BitcoinDataLoadedState state;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TableWidget(
          state: state,
        ),
      ),
    );
  }
}

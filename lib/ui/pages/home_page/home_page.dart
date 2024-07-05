import 'package:eriell_app/domain/api/repository_data.dart';
import 'package:eriell_app/domain/manager/bitcoin_data/bitcoin_data_bloc.dart';
import 'package:eriell_app/ui/components/landscape_widget.dart';
import 'package:eriell_app/ui/components/portrait_widget.dart';
import 'package:eriell_app/ui/style/app_colors.dart';
import 'package:eriell_app/ui/style/app_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BitcoinDataBloc(repositoryData: RepositoryData())
        ..add(BitcoinDataLoadEvent()),
      child: const ColoredBox(
        color: AppColors.white,
        child: BlocBuilderWidget(),
      ),
    );
  }
}

class BlocBuilderWidget extends StatelessWidget {
  const BlocBuilderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BitcoinDataBloc, BitcoinDataState>(
      builder: (context, state) {
        if (state is BitcoinDataLoadingState) {
          return const Center(
            child: CupertinoActivityIndicator(
              color: AppColors.blue,
              radius: 15,
            ),
          );
        }
        if (state is BitcoinDataLoadedState) {
          return OrientationBuilder(builder: (context, orientation) {
            if (orientation == Orientation.portrait) {
              return PortraitWidget(
                state: state,
              );
            } else {
              return LandscapeWidget(
                state: state,
              );
            }
          });
        }
        if (state is BitcoinDataErrorState) {
          return Center(
            child: Text(
              'Error Fetching Data: ${state.errorMessage}',
              style: AppStyle.fontStyle,
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}

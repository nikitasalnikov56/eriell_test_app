import 'package:eriell_app/domain/manager/bitcoin_data/bitcoin_data_bloc.dart';
import 'package:eriell_app/ui/style/app_colors.dart';
import 'package:eriell_app/ui/style/app_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class TableWidget extends StatelessWidget {
  const TableWidget({
    super.key,
    required this.state,
  });
  final BitcoinDataLoadedState state;
  @override
  Widget build(BuildContext context) {
    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      border: TableBorder.all(width: 2),
      
      children: [
        TableRow(
          decoration: BoxDecoration(
            color: AppColors.blue,
            border: Border.all(
              color: AppColors.black,
            ),
          ),
          children: [
            const Text(''),
            Text(
              'Updated time: \n${state.bitcoinPriceData?.time?.updated}',
              textAlign: TextAlign.center,
              style: AppStyle.fontStyle.copyWith(
                // fontWeight: FontWeight.bold,
                color: AppColors.white,
                fontSize: 16,
              ),
            ),
            const Text(''),
          ],
        ),
        TableRow(
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(
              color: AppColors.black,
            ),
          ),
          children: [
            Text(
              '${state.bitcoinPriceData?.bpi?.uSD?.code}',
              textAlign: TextAlign.center,
              style: AppStyle.fontStyle.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.black,
                fontSize: 16,
              ),
            ),
            Text(
              '${state.bitcoinPriceData?.bpi?.gBP?.code}',
              textAlign: TextAlign.center,
              style: AppStyle.fontStyle.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.black,
                fontSize: 16,
              ),
            ),
            Text(
              '${state.bitcoinPriceData?.bpi?.eUR?.code}',
              textAlign: TextAlign.center,
              style: AppStyle.fontStyle.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.black,
                fontSize: 16,
              ),
            ),
          ],
        ),
        TableRow(
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(
              color: AppColors.black,
            ),
          ),
          children: [
            Text(
              '${state.bitcoinPriceData?.bpi?.uSD?.description}',
              textAlign: TextAlign.center,
              style: AppStyle.fontStyle.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w300,
              ),
            ),
            Text(
              '${state.bitcoinPriceData?.bpi?.gBP?.description}',
              textAlign: TextAlign.center,
              style: AppStyle.fontStyle.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w300,
              ),
            ),
            Text(
              '${state.bitcoinPriceData?.bpi?.eUR?.description}',
              textAlign: TextAlign.center,
              style: AppStyle.fontStyle.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
        TableRow(
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(
              color: AppColors.black,
            ),
          ),
          children: [
            Text(
              '${state.bitcoinPriceData?.bpi?.uSD?.rate}',
              textAlign: TextAlign.center,
              style: AppStyle.fontStyle.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            ),
            Text(
              '${state.bitcoinPriceData?.bpi?.gBP?.rate}',
              textAlign: TextAlign.center,
              style: AppStyle.fontStyle.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            ),
            Text(
              '${state.bitcoinPriceData?.bpi?.eUR?.rate}',
              textAlign: TextAlign.center,
              style: AppStyle.fontStyle.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

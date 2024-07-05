import 'package:eriell_app/ui/resources/app_icons.dart';
import 'package:eriell_app/ui/style/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';


class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.5),
            offset: const Offset(0, 4),
            blurRadius: 5,
          ),
        ],
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: SvgPicture.asset(
          AppIcons.logo,
          width: 50,
          height: 50,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 80);
}

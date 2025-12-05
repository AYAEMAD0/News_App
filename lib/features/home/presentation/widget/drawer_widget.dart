import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_asset.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';
import 'app_config.dart';
import 'divider_widget.dart';
import 'drop_menu_widget.dart';

typedef OnDrawerClick = void Function();

class DrawerWidget extends StatelessWidget {
  final OnDrawerClick onDrawerClick;
  const DrawerWidget({super.key, required this.onDrawerClick});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 260.h,
          alignment: Alignment.center,
          color: AppColors.primaryLight,
          margin: EdgeInsets.only(bottom: 30.h),
          child: Text(AppStrings.newsApp, style: TextStyles.font24BlackBold),
        ),
        InkWell(
          onTap: () {
            //todo calling
            onDrawerClick();
          },
          child: AppConfig(text: AppStrings.goTOHome, icon: AppAsset.homeIcon),
        ),
        SizedBox(height: 14.h),
        DividerWidget(),
        SizedBox(height: 14.h),
        AppConfig(text: AppStrings.theme, icon: AppAsset.themeIcon),
        SizedBox(height: 14.h),
        DropMenuWidget(),
      ],
    );
  }
}

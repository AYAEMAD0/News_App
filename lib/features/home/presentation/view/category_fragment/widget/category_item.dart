import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../../../model/category_model.dart';


class CategoryItem extends StatelessWidget {
  final CategoryModel model;
  final int index;
  const CategoryItem({super.key, required this.model, required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: index.isEven ? Alignment.bottomRight : Alignment.bottomLeft,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Image.asset(model.image),
        ),
        Container(
          width: 168.w,
          height: 60.h,
          margin: EdgeInsetsDirectional.only(
            bottom: 8.h,
            start: index.isEven ? 0 : 8.w,
            end: index.isEven ?8.w : 0,
          ),
          padding: EdgeInsetsDirectional.only(
            end: index.isEven ? 0 : 18.w,
            start: index.isEven ? 18.w : 0,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(40.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            textDirection: index.isEven ? TextDirection.ltr : TextDirection.rtl,
            children: [
              Text(
                AppStrings.viewAll,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              CircleAvatar(
                radius: 29.r,
                backgroundColor: Theme.of(context).dividerColor,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal:15.w,),
                  child: Icon(
                    index.isEven
                        ? Icons.arrow_forward_ios_rounded
                        : Icons.arrow_back_ios,
                    size: 25,
                    color: Theme.of(context).canvasColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

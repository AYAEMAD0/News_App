import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_time_ago/get_time_ago.dart';
import 'package:news_app/domain/entities/news/articles.dart';

import '../../../../../../core/theme/app_styles.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';

class NewsItem extends StatelessWidget {
  final Articles articles;
  const NewsItem({super.key, required this.articles});
  @override
  Widget build(BuildContext context) {
    var convertedTimestamp = DateTime.parse(articles.publishedAt ?? "");
    var time = GetTimeAgo.parse(convertedTimestamp);
    return InkWell(
      onTap: () {
        //todo open bottom sheet
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 7.w,
          vertical: 8.h,
        ),
        margin: EdgeInsets.symmetric(horizontal: 12.w,vertical: 8.h),
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).canvasColor),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          spacing: 12.h,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: CachedNetworkImage(
                imageUrl: articles.urlToImage ?? "",
                placeholder: (context, url) => CircularProgressIndicator(
                  color: Theme.of(context).canvasColor,
                ),
                errorWidget: (context, url, error) =>
                    Icon(Icons.error, color: AppColors.gray, size: 40),
              ),
            ),
            Text(
              articles.title ?? AppStrings.noTitle,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "By: ${articles.author}",
                    style: TextStyles.font14GrayMedium,
                  ),
                ),
                //todo convert time minute  2025-10-23T09:42:28Z
                Text(time, style: TextStyles.font14GrayMedium),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/domain/entities/news/articles.dart';

import '../../../../../../core/constants/app_strings.dart';
import '../../../../../../core/theme/app_colors.dart';

class BottomSheetWidget extends StatelessWidget {
  final ScrollController scrollController;
  final Articles news;

  const BottomSheetWidget({
    super.key,
    required this.scrollController,
    required this.news,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
        child: Column(
          spacing: 12.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: CachedNetworkImage(
                imageUrl: news.urlToImage ?? "",
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).canvasColor,
                  ),
                ),
                errorWidget: (context, url, error) =>
                    Icon(Icons.error, color: AppColors.gray, size: 40),
              ),
            ),
            Text(
              news.content ?? AppStrings.noContent,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 6.h),
            ElevatedButton(
              onPressed: () {
                // todo: view article in webView
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).dividerColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 6.w),
                minimumSize: Size(double.infinity, 60.h),
              ),
              child: Text(
                AppStrings.viewArticle,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


import '../../../../core/constants/app_asset.dart';
class CategoryModel {
  final String id;
  final String title;
  final String image;
  CategoryModel({required this.id, required this.title, required this.image});

  //business entertainment general health science sports technology
  static List<CategoryModel> getCategoryList(bool isDark) {
    return [
      CategoryModel(
        id: 'general',
        title: 'General',
        image: isDark ? AppAsset.generalThemeDark : AppAsset.generalThemeLight,
      ),
      CategoryModel(
        id: 'business',
        title: 'Business',
        image: isDark
            ? AppAsset.businessThemeDark
            : AppAsset.businessThemeLight,
      ),   CategoryModel(
        id: 'sports',
        title: 'Sports',
        image: isDark ? AppAsset.sportsThemeDark : AppAsset.sportsThemeLight,
      ),
      CategoryModel(
        id: 'technology',
        title: 'Technology',
        image: isDark
            ? AppAsset.technologyThemeDark
            : AppAsset.technologyThemeLight,
      ),
      CategoryModel(
        id: 'entertainment',
        title: 'Entertainment',
        image: isDark
            ? AppAsset.entertainmentThemeDark
            : AppAsset.entertainmentThemeLight,
      ),
      CategoryModel(
        id: 'health',
        title: 'Health',
        image: isDark ? AppAsset.healthThemeDark : AppAsset.healthThemeLight,
      ),
      CategoryModel(
        id: 'science',
        title: 'Science',
        image: isDark ? AppAsset.scienceThemeDark : AppAsset.scienceThemeLight,
      ),
    ];
  }
}

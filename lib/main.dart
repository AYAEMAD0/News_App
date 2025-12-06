import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';
import 'package:news_app/data/model_hive/news/articles_model.dart';
import 'package:news_app/data/model_hive/source/source_response_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'core/config/di.dart';
import 'core/config/my_bloc_observer.dart';
import 'core/helper/shared_check_helper.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'core/theme/app_theme.dart';
import 'data/model_hive/news/news_response_model.dart';
import 'data/model_hive/news/source_model.dart';
import 'data/model_hive/source/sources_model.dart';
import 'features/home/presentation/viewmodel/theme_provider/theme_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await dotenv.load(fileName: ".env");
  Bloc.observer = MyBlocObserver();
  final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentsDir.path);
  Hive.registerAdapter(ArticlesModelAdapter());
  Hive.registerAdapter(NewsResponseModelAdapter());
  Hive.registerAdapter(SourceModelAdapter());
  Hive.registerAdapter(SourceResponseModelAdapter());
  Hive.registerAdapter(SourcesModelAdapter());


  await SharedCheckHelper.init();
  final bool isDark = await SharedCheckHelper.getTheme();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(isDark),
      child: MyApp(appRouter: AppRouter(),),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({super.key,required this.appRouter});
  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeProvider>(context);
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.themeLight,
          darkTheme: AppTheme.themeDark,
          themeMode: theme.themeApp,
          initialRoute: Routes.homeRouteName,
          onGenerateRoute: appRouter.generateRoute,
        );
      },
    );
  }
}

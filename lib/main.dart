import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'core/config/di.dart';
import 'core/config/my_bloc_observer.dart';
import 'core/helper/shared_check_helper.dart';
import 'core/theme/app_theme.dart';
import 'features/home/presentation/viewmodel/theme_provider/theme_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  Bloc.observer = MyBlocObserver();
  await SharedCheckHelper.init();
  final bool isDark = await SharedCheckHelper.getTheme();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(isDark),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
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

          // initialRoute: Routes.homeRouteName,
        );
      },
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:catcher/catcher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'themes/light.dart';
import 'router.gr.dart';

void main() async {
  // NOTE: flutter widget binding init
  WidgetsFlutterBinding.ensureInitialized();

  // NOTE: easy_localization
  await EasyLocalization.ensureInitialized();

  final releaseCatcherOptions = CatcherOptions(
    SilentReportMode(),
    [],
    localizationOptions: [
      LocalizationOptions.buildDefaultEnglishOptions(),
      LocalizationOptions.buildDefaultChineseOptions(),
    ],
  );

  Catcher(
    runAppFunction: () {
      runApp(
        ProviderScope(
          child: EasyLocalization(
            supportedLocales: const [
              Locale('zh', 'TW'),
              Locale('en', 'US'),
            ],
            path: 'assets/translations',
            fallbackLocale: const Locale('zh', 'TW'),
            child: const MainApp(),
          ),
        ),
      );
    },
    debugConfig: CatcherOptions.getDefaultDebugOptions(),
    releaseConfig: releaseCatcherOptions,
  );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late final AppRouter _appRouter;

  @override
  void initState() {
    super.initState();

    _appRouter = AppRouter(
      Catcher.navigatorKey,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: AutoRouterDelegate(
        _appRouter,
        navigatorObservers: () => [
          AutoRouteObserver(),
        ],
      ),
      theme: lightThemeData,
      themeMode: ThemeMode.light,
    );
  }
}

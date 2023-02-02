import 'package:auto_route/auto_route.dart';

import 'pages/app.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      page: AppPage,
      path: '',
      initial: true,
    ),
  ],
)
class $AppRouter {}

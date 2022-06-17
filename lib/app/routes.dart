import 'package:get/get.dart';
import 'package:splitcalc/app/view/controllers/split/split_binding.dart';
import 'package:splitcalc/app/view/controllers/sum/sum_binding.dart';
import 'package:splitcalc/app/view/uis/home/home_page.dart';
import 'package:splitcalc/app/view/uis/split/my/split_my_page.dart';
import 'package:splitcalc/app/view/uis/split/random/split_random_page.dart';
import 'package:splitcalc/app/view/uis/sum/my/sum_my_page.dart';
import 'package:splitcalc/app/view/uis/sum/random/sum_random_page.dart';

class Routes {
  // static const splash = '/';

  static const home = '/home';
  static const splitMy = '/split/my';
  static const splitRandom = '/split/ramdom';
  static const sumMy = '/sum/my';
  static const sumRandom = '/sum/ramdom';

  static final pageList = [
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      children: [
        GetPage(
          name: Routes.splitMy,
          binding: SplitBinding(),
          page: () => SplitMyPage(),
        ),
        GetPage(
          name: Routes.splitRandom,
          binding: SplitBinding(),
          page: () => SplitRandomPage(),
        ),
        GetPage(
          name: Routes.sumMy,
          binding: SumBinding(),
          page: () => SumMyPage(),
        ),
        GetPage(
          name: Routes.sumRandom,
          binding: SumBinding(),
          page: () => SumRandomPage(),
        ),
      ],
    ),
  ];
}

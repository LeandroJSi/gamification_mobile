import 'package:get/get.dart';
import 'package:tcc_gamification/modules/access_new_raffle/access_new_raffle_binding.dart';
import 'package:tcc_gamification/modules/access_new_raffle/access_new_raffle_view.dart';
import 'package:tcc_gamification/modules/dashboard/dashboard_binding.dart';
import 'package:tcc_gamification/modules/dashboard/dashboard_view.dart';
import 'package:tcc_gamification/modules/make_new_raffle/make_new_raffle_binding.dart';
import 'package:tcc_gamification/modules/make_new_raffle/make_new_raffle_view.dart';
import 'package:tcc_gamification/modules/raffle_list/raffle_list_binding.dart';
import 'package:tcc_gamification/modules/raffle_list/raffle_list_view.dart';
import 'package:tcc_gamification/modules/raffle_result/raffle_result_binding.dart';
import 'package:tcc_gamification/modules/raffle_result/raffle_result_view.dart';
import 'package:tcc_gamification/routes/app_routes.dart';

import '../modules/search_user_by_phone/search_user_by_phone_binding.dart';
import '../modules/search_user_by_phone/search_user_by_phone_view.dart';
import '../modules/search_user_by_phone_result/search_user_by_phone_result_binding.dart';
import '../modules/search_user_by_phone_result/search_user_by_phone_result_view.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: AppRoutes.dashboard,
        page: () => const DashboardView(),
        binding: DashboardBinding()),
    GetPage(
        name: AppRoutes.raffleList,
        page: () => const RaffleListView(),
        binding: RaffleListBinding(),
        transition: Transition.fadeIn),
    GetPage(
        name: AppRoutes.accessNewRaffle,
        page: () => AccessNewRaffleView(),
        binding: AccessNewRaffleBinding(),
        transition: Transition.fadeIn),
    GetPage(
        name: AppRoutes.makeNewRaffle,
        page: () => MakeNewRaffleView(),
        binding: MakeNewRaffleBinding(),
        transition: Transition.fadeIn),
    GetPage(
        name: AppRoutes.raffleResult,
        page: () => const RaffleResultView(),
        binding: RaffleResultBinding(),
        transition: Transition.fadeIn),
    GetPage(
        name: AppRoutes.searchUserByDocument,
        page: () => const SearchUserByPhoneView(),
        binding: SearchUserByPhoneBinding(),
        transition: Transition.fadeIn),
    GetPage(
        name: AppRoutes.searchUserByPhoneResult,
        page: () => const SearchUserByPhoneResultView(),
        binding: SearchUserByPhoneResultBinding(),
        transition: Transition.fadeIn),
  ];
}

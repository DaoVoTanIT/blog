import 'package:cmms/feature/detail_work_order/screen/detail_work_order.dart';
import 'package:cmms/feature/detail_work_order/screen/check_list_word_order.dart';
import 'package:cmms/feature/home_dashboard/screen/home.dart';
import 'package:cmms/feature/login_signup/screen/sign_up.dart';
import 'package:cmms/feature/notification/screen/notification.dart';
import 'package:cmms/feature/work_order/screen/calendar_work_order.dart';
import 'package:cmms/feature/work_order/screen/work_order.dart';
import 'package:flutter/material.dart';
import 'package:cmms/feature/domain/screen/domain.dart';
import 'package:cmms/feature/forgot_password/screen/change_pass_success.dart';
import 'package:cmms/feature/forgot_password/screen/change_password.dart';
import 'package:cmms/feature/forgot_password/screen/forgot_password.dart';
import 'package:cmms/feature/assets_maintenance/screen/assets_home.dart';
import 'package:cmms/feature/login_signup/screen/login.dart';
import 'routes.dart';

mixin RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      /// route catalog Login
      case Routes.login:
        return MaterialPageRoute<dynamic>(
          settings: const RouteSettings(name: Routes.login),
          builder: (context) => const Login(),
        );
      case Routes.domain:
        return MaterialPageRoute<dynamic>(
          settings: const RouteSettings(name: Routes.domain),
          builder: (context) => const DomainPage(),
        );
      case Routes.home:
        return MaterialPageRoute<dynamic>(
          settings: const RouteSettings(name: Routes.domain),
          builder: (context) => const Home(),
        );
      case Routes.assetsPage:
        return MaterialPageRoute<dynamic>(
          settings: const RouteSettings(name: Routes.assetsPage),
          builder: (context) => const AssetsPage(),
        );
      case Routes.forgotPassword:
        return MaterialPageRoute<dynamic>(
          settings: const RouteSettings(name: Routes.forgotPassword),
          builder: (context) => ForgotPassword(),
        );
      case Routes.changePassSuccess:
        return MaterialPageRoute<dynamic>(
          settings:
              const RouteSettings(name: Routes.authenticateCodeForgotPassword),
          builder: (context) => const ChangePassSuccess(),
        );
      case Routes.changePassword:
        return MaterialPageRoute<dynamic>(
          settings: const RouteSettings(name: Routes.changePassword),
          builder: (context) => ChangePasswordPage(
            context: context,
          ),
        );

      case Routes.detailWorkOrder:
        return MaterialPageRoute<dynamic>(
          settings: const RouteSettings(name: Routes.domain),
          builder: (context) => const DetailWorkOrder(),
        );
      case Routes.checkListWorkOrderAssets:
        return MaterialPageRoute<dynamic>(
          settings: const RouteSettings(name: Routes.domain),
          builder: (context) => const CheckListWorkOrderAssets(),
        );
      case Routes.workOrder:
        return MaterialPageRoute<dynamic>(
          settings: const RouteSettings(name: Routes.domain),
          builder: (context) => const WorkOrderPage(),
        );
      case Routes.notification:
        return MaterialPageRoute<dynamic>(
          settings: const RouteSettings(name: Routes.domain),
          builder: (context) => const NotificationPage(),
        );
      case Routes.calendarWorkOrderPage:
        return MaterialPageRoute<dynamic>(
          settings: const RouteSettings(name: Routes.domain),
          builder: (context) => const CalendarWorkOrderPage(),
        );
      case Routes.signUp:
        return MaterialPageRoute<dynamic>(
          settings: const RouteSettings(name: Routes.domain),
          builder: (context) => const SignUpPage(),
        );
      //route ask a question
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute<dynamic>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}

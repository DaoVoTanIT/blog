import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:cmms/app/injection.dart';

import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cmms/translations/codegen_loader.g.dart';
import 'app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(debug: true, ignoreSsl: true);
  FlutterDownloader.registerCallback(MyApp.downloadCallback);

  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();

  setupGetIt();
  await GetIt.I.isReady<SharedPreferences>();
  // await setValueString(SharedPrefKey.domain, 'api.publicapis.org');
  // Future.delayed(const Duration(seconds: 15), () async {
  //   print('Done ' +
  //       (await setValueString(SharedPrefKey.domain, 'haha')).toString());
  // });
  final EasyLocalization blocProvider = EasyLocalization(
      supportedLocales: const [Locale('vi'), Locale('en')],
      path:
          'assets/translations', // <-- change the path of the translation files
      fallbackLocale: const Locale('vi'),
      saveLocale: false,
      useOnlyLangCode: true,
      assetLoader: const CodegenLoader(),
      child: const MyApp());
  runApp(blocProvider);
  // await SentryFlutter.init(
  //   (options) {
  //     options.dsn =
  //         'https://432cb1d0b3344189b82df7437c17b3b1@o1367012.ingest.sentry.io/6667445';
  //     // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
  //     // We recommend adjusting this value in production.
  //     options.tracesSampleRate = 1.0;
  //   },
  //   appRunner: () => ,
  // );
}

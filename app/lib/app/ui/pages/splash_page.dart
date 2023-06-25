// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:core/app/micro_core_utils.dart';
import 'package:core/app/utils/local_storage/ilocal_storage_util.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final ILocalStorageUtil localStorageUtil = autoInjector.get();

  @override
  void initState() {
    super.initState();

    scheduleMicrotask(() async {
      await SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: [
          SystemUiOverlay.top,
        ],
      );
      if ((await localStorageUtil.getValue<String?>(
            ValuesTypes.string,
            'accessToken',
          )) !=
          null) {
        context.go('/home');
        return;
      }
      context.go('/auth');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ColoredBox(
        color: Color(0xFF806BFF),
      ),
    );
  }
}

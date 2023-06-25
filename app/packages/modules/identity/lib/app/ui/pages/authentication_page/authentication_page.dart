import 'package:flutter/material.dart';
import 'package:identity/app/ui/pages/authentication_page/organisms/authentication_code_body_organism.dart';
import 'package:identity/app/ui/pages/authentication_page/organisms/login_body_organism.dart';
import 'package:identity/app/ui/pages/authentication_page/organisms/register_body_organism.dart';
import 'package:identity/app/ui/pages/authentication_page/organisms/welcome_body_organism.dart';
import 'package:identity/app/ui/shared/identity_scafold_organism.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  late PageController pageController;

  void nextPage() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  void previousPage() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  void authenticationCodePage() {
    pageController.jumpToPage(4);
  }

  void loginPage() {
    pageController.jumpToPage(2);
  }

  @override
  Widget build(BuildContext context) {
    return IdentityScafoldOrganism(
      builder: (context, controller) {
        pageController = controller;

        return [
          WelcomeBodyOrganism(
            onTap: nextPage,
          ),
          LoginBodyOrganism(
            goToRegisterPage: nextPage,
            goToAuthenticationCodePage: authenticationCodePage,
          ),
          RegisterBodyOrganism(
            goToPreviusPage: previousPage,
            goToAuthenticationCodePage: authenticationCodePage,
          ),
          AuthenticationCodeBodyOrganism(
            goToPreviusPage: loginPage,
          ),
        ];
      },
    );
  }
}

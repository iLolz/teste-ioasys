import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:teste_ioasys/app/modules/login/widgets/curved_clip.dart';
import 'package:teste_ioasys/shared/utils/colors.dart';
import 'package:teste_ioasys/shared/widgets/clear_button.dart';
import 'package:teste_ioasys/shared/widgets/custom_text_form_field.dart';
import 'package:teste_ioasys/shared/widgets/default_button.dart';

import '../../../../app_status.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    reaction<AppStatus>(
      (_) => controller.appStatus,
      (event) {
        if (event == AppStatus.success) {
          Modular.to.pushReplacementNamed("/home/");
        } else if (event == AppStatus.none) {
          Modular.to.pop();
        } else {
          if (event == AppStatus.error) {
            Modular.to.pop();
          }
          event.toWidget;
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      resizeToAvoidBottomInset: true,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: Container(),
            backgroundColor: AppColors.ruby,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      AppColors.whisper,
                      AppColors.ruby,
                      AppColors.ruby,
                      AppColors.whisper,
                    ],
                    stops: [
                      0.000001,
                      0.3,
                      0.8,
                      1.2,
                    ]),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0.0),
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/logo_home.png",
                    color: AppColors.whisper,
                    width: 40.0,
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Seja bem vindo ao empresas!",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Container(height: 40),
                ],
              ),
            ),
            expandedHeight: 200,
          ),
          SliverToBoxAdapter(
            child: ClipPath(
              clipper: AppBarBottomClipper(),
              child: Container(
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        AppColors.whisper,
                        AppColors.whisper,
                        AppColors.ruby,
                        AppColors.ruby,
                      ],
                      stops: [
                        0.000000001,
                        0.034,
                        0.42,
                        0.82,
                      ]),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: CustomTextFormField(
                    labelText: "Email",
                    controller: _emailController,
                    errorMessage: controller.hasError ? " " : null,
                    textInputAction: TextInputAction.next,
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Observer(builder: (_) {
                    return CustomTextFormField(
                      labelText: "Senha",
                      controller: _passwordController,
                      obscureText: controller.passwordVisibility,
                      errorMessage: controller.errorMessage,
                      suffixIcon: controller.hasError
                          ? ClearButton(
                              onClear: () {
                                _passwordController.clear();
                                controller.setStatus(status: AppStatus.none);
                                controller.resetErrorMessage();
                              },
                            )
                          : InkWell(
                              child: controller.passwordVisibility
                                  ? Icon(Icons.visibility,
                                      color: AppColors.grey40)
                                  : Icon(Icons.visibility_off,
                                      color: AppColors.grey40),
                              onTap: () => controller.changeObscure(),
                            ),
                    );
                  }),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 29.0),
                  child: DefaultButton(
                    text: "Entrar",
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      controller.login(
                          email: _emailController.value.text,
                          password: _passwordController.value.text);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

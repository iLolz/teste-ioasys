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
        shrinkWrap: true,
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            leading: Container(),
            flexibleSpace: ClipPath(
              clipper: AppBarBottomClipper(),
              child: Container(
                  height: 240,
                  child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(height: 10),
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
                      ]),
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
                  )),
            ),
            pinned: true,
            primary: true,
            floating: true,
            snap: true,
            collapsedHeight: 160,
            expandedHeight: 200,
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

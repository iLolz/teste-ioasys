import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:teste_ioasys/shared/utils/colors.dart';
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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppColors.ruby,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(100)),
              side: BorderSide.none,
            ),
            expandedHeight: 200,
          ),
          SliverList(
            delegate: SliverChildListDelegate.fixed(
              [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: CustomTextFormField(
                    labelText: "Email",
                    controller: _emailController,
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
                      suffixIcon: InkWell(
                        child: controller.passwordVisibility
                            ? Icon(Icons.visibility, color: AppColors.grey40)
                            : Icon(Icons.visibility_off,
                                color: AppColors.grey40),
                        onTap: () => controller.changeObscure(),
                      ),
                    );
                  }),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 29.0),
                  child: Expanded(
                      child: DefaultButton(
                    text: "Entrar",
                    onPressed: () {
                      controller.login(
                          email: _emailController.value.text,
                          password: _passwordController.value.text);
                    },
                  )),
                ),
              ],
            ),
          ),
        ],
        shrinkWrap: true,
      ),
    );
  }
}

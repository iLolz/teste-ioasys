import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
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
            shape: RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(100)),
            ),
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
                  Container(
                    height: 40,
                    width: 300,
                  ),
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
                width: 500,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        AppColors.whisper,
                        AppColors.whisper,
                        AppColors.ruby,
                      ],
                      stops: [
                        0.00001,
                        0.1,
                        0.42,
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

class AppBarBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    // TODO: The wavy clipping magic happens here, between the bottom left and bottom right points.

    // The bottom right point also isn't at the same level as its left counterpart,
    // so we'll adjust that one too.

    path.lineTo(0.0, 0.0);

    var firstControlPoint = Offset(size.width / 2, size.height);
    var firstEndPoint = Offset(size.width, 0.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    path.lineTo(size.width, 0.0);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:teste_ioasys/app/app_status.dart';
import 'package:teste_ioasys/app/modules/home/shared/widgets/company_card.dart';
import 'package:teste_ioasys/shared/utils/colors.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    reaction<AppStatus>(
      (_) => controller.appStatus,
      (event) {
        if (event == AppStatus.success) {
          Modular.to.pop();
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

    controller.getEnterprises();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: [
      SliverAppBar(
        backgroundColor: AppColors.ruby,
        expandedHeight: 200,
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
      ),
      Observer(builder: (_) {
        if (controller.appStatus == AppStatus.success) {
          if (controller.copmanies.isNotEmpty) {
            return SliverToBoxAdapter(
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                        controller.copmanies.length.toString() +
                            " resultados encontrados",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 14.0,
                          color: AppColors.graniteGray,
                        ))));
          } else {
            return SliverToBoxAdapter(
                child: Center(
                    child: Text("Nenhum resultado encontrado",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 14.0,
                          color: AppColors.graniteGray,
                        ))));
          }
        } else {
          return SliverToBoxAdapter(child: Container());
        }
      }),
      Observer(builder: (_) {
        if (controller.appStatus == AppStatus.success)
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => CompanyCard(
                company: controller.copmanies[index],
              ),
            ),
          );

        return SliverToBoxAdapter(child: Container());
      }),
    ]));
  }
}

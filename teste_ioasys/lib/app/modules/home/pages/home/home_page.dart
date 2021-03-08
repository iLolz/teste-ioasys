import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_ioasys/app/app_status.dart';
import 'package:teste_ioasys/app/modules/home/shared/widgets/company_card.dart';
import 'package:teste_ioasys/shared/utils/colors.dart';
import 'package:teste_ioasys/shared/widgets/radial_progress_indicator/loading_widget.dart';

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
          if (controller.companies.isNotEmpty) {
            return SliverToBoxAdapter(
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                        controller.companies.length.toString() +
                            " resultados encontrados",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 14.0,
                          color: AppColors.graniteGray,
                        ))));
          } else {
            return SliverToBoxAdapter(
                child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Text("Nenhum resultado encontrado",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 14.0,
                          color: AppColors.graniteGray,
                        ))),
              ],
            ));
          }
        } else {
          return SliverToBoxAdapter(
              child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
              ),
              Center(child: LoadingWidget()),
            ],
          ));
        }
      }),
      Observer(builder: (_) {
        if (controller.appStatus == AppStatus.success)
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => CompanyCard(
                company: controller.companies[index],
              ),
            ),
          );

        return SliverToBoxAdapter(child: Container());
      }),
    ]));
  }
}

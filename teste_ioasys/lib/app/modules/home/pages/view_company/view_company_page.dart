import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_ioasys/app/modules/home/shared/widgets/company_header.dart';
import 'package:teste_ioasys/shared/models/enterprises.dart';
import 'package:teste_ioasys/shared/utils/colors.dart';
import 'view_company_controller.dart';

class ViewCompanyPage extends StatefulWidget {
  final Company company;
  const ViewCompanyPage({Key key, this.company}) : super(key: key);

  @override
  _ViewCompanyPageState createState() => _ViewCompanyPageState();
}

class _ViewCompanyPageState
    extends ModularState<ViewCompanyPage, ViewCompanyController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: Icon(
            Icons.arrow_back,
            color: AppColors.ruby,
          ),
          onTap: () => Modular.to.pop(),
        ),
        backgroundColor: Colors.white,
        title: Text(
          widget.company.enterpriseName,
          style:
              Theme.of(context).textTheme.headline4.apply(color: Colors.black),
        ),
      ),
      body: Column(
        children: <Widget>[
          CompanyHeader(
            company: widget.company,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 24,
            ),
            child: Text(
              widget.company.description,
              style: Theme.of(context).textTheme.subtitle2,
            ),
          )
        ],
      ),
    );
  }
}

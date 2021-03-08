import 'package:flutter/material.dart';
import 'package:teste_ioasys/shared/models/enterprises.dart';
import 'package:teste_ioasys/shared/utils/colors.dart';

class CompanyHeader extends StatelessWidget {
  const CompanyHeader({
    Key key,
    @required this.company,
    this.borderRadius,
  }) : super(key: key);

  final Company company;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: AppColors.blue,
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: NetworkImage(
              "https://empresas.ioasys.com.br/" + company.photo,
            ),
          )),
      child: Center(
          child: Text(
        company.enterpriseName,
        style: Theme.of(context).textTheme.headline4,
        textAlign: TextAlign.center,
      )),
    );
  }
}

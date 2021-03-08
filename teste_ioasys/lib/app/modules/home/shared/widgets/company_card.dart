import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_ioasys/shared/models/enterprises.dart';

import 'company_header.dart';

class CompanyCard extends StatelessWidget {
  const CompanyCard({
    Key key,
    @required this.company,
  }) : super(key: key);

  final Company company;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
      child: InkWell(
        onTap: () =>
            Modular.link.pushNamed("/view_company", arguments: company),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
          child: Expanded(
            child: CompanyHeader(
              company: company,
              borderRadius: BorderRadius.circular(4.0),
            ),
          ),
        ),
      ),
    );
  }
}

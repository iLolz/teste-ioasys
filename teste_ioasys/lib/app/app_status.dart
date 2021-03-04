import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_ioasys/shared/utils/colors.dart';
import 'package:teste_ioasys/shared/widgets/default_button.dart';
import 'package:teste_ioasys/shared/widgets/radial_progress_indicator/animated_radial_progress.dart';

///Status of aplication
enum AppStatus {
  ///implement loading status
  loading,

  ///implement success status
  success,

  /// implement error status
  error,

  /// implement none Status
  none
}

///This extensions provide Actions for each AppStatus
///Example
///reaction<AppStatus>(
///        (_) => controller.appStatus,
///        (event) async {
///         Remover models
///          if (event == AppStatus.success) {
///            Ação ao ter sucesso
///          } else if (event == AppStatus.none && event.value == 1) {
///            Ação ao ter sucesso e c/ valor definido
///          }
///          } else {
///           Redirecionar nos casos de Loading e error
///            event.toWidget;
///          }
///        },
///      );

extension AppStatusExtension on AppStatus {
  static var _value;
  static String _message = "Aguarde...";

  ///Show value inside appStatus
  // ignore: type_annotate_public_apis
  get value => _value;

  ///Set a new value to AppStatus value
  // ignore: type_annotate_public_apis
  set value(value) => _value = value;

  ///In case of AppStatus is equal to AppStatus.error,
  /// this message has showed to the user
  String get message => _message;

  ///Set error message
  set message(String message) => _message = message;

  ///Deci
  void get toWidget {
    if (this == AppStatus.loading) {
      Modular.to.showDialog(
        builder: (BuildContext context) => Stack(children: [
          Center(
            child: Container(
              child: AppAnimatedRadialProgress(
                size: 55,
                animationConstant: 2,
              ),
            ),
          ),
          Center(
            child: Container(
              child: AppAnimatedRadialProgress(
                size: 85,
                animationConstant: -2,
              ),
            ),
          ),
        ]),
      );
    } else if (this == AppStatus.error) {
      Modular.to.showDialog(
        builder: (BuildContext context) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Ops! Tivemos um problema.",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        this.message,
                        textAlign: TextAlign.center,
                        softWrap: true,
                      ),
                      SizedBox(height: 32.0),
                      DefaultButton(
                        text: "Voltar",
                        onPressed: () => Modular.to.pop(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      print(this);
    }
  }
}

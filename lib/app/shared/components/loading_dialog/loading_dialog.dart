import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'loading_dialog.g.dart';

abstract class ILoadingDialog {
  void show();
  Future<void> hide();
}

@Injectable(singleton: false)
class LoadingDialog implements ILoadingDialog {
  OverlayEntry entry;

  LoadingDialog() {
    entry = OverlayEntry(
      builder: (context) {
        return Container(
          color: Colors.black.withOpacity(.3),
          alignment: Alignment.center,
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  @override
  Future<void> hide() async {
    try {
      entry.remove();
      await Future.delayed(Duration(milliseconds: 500));
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  @override
  void show() {
    try {
      FocusManager.instance.primaryFocus.unfocus();
      asuka.addOverlay(entry);
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}

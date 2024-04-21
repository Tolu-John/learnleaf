import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class FlushBarHelper{
  BuildContext? c;
  Flushbar? flush;
  FlushBarHelper(this.c);

  showFlushBar(String message, FlushBarType flushBarType){
    flush = Flushbar(
      message:  message, padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      borderColor: flushBarType == FlushBarType.success ? const Color(0XFFE6FFF8) : const Color(0xFFFFCCCC),
      messageColor: flushBarType == FlushBarType.success ? const Color(0xFF333333) : Colors.black,
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: flushBarType == FlushBarType.success ? const Color(0XFFE6FFF8) : Theme.of(Get.context!).colorScheme.background,
      margin: const EdgeInsets.all(15),
      borderRadius: BorderRadius.circular(12),
      isDismissible: true,
      icon: flushBarType == FlushBarType.success ? SizedBox(
          width: 24, height: 24,
          child: SvgPicture.asset("IImageAssets.alertSuccessNew"),
      ) : SizedBox(
          width: 24, height: 24,
          child: SvgPicture.asset("IImageAssets.alertFailedNew"),
      ),
      duration: const Duration(seconds: 4),
      mainButton: IconButton(
          onPressed: (){
            flush?.dismiss(true);
          },
          icon: const Icon(Icons.clear, color: Colors.black, size: 18,)
      ),
    )..show(c ?? Get.context!);
  }
}

enum FlushBarType{error, success}
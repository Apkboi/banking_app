import 'dart:developer';
import 'dart:ui';

import 'package:banking_app/app/presentation/widgets/danger_dialog.dart';
import 'package:banking_app/core/constants/storage_keys.dart';
import 'package:banking_app/core/helpers/storage_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class AppUtils {
  AppUtils._();

  static Future<DateTime?> pickDate(BuildContext context) {
    return showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        builder: (context, child) => Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                  onSurface: Theme.of(context).colorScheme.onPrimary,
                  primary: Theme.of(context).primaryColor,
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    // foregroundColor:
                    //     Theme.of(context).primaryColor, // button text color
                  ),
                ),
              ),
              child: child!,
            ),
        firstDate: DateTime(1),
        lastDate: DateTime(2030));
  }

  static Future<TimeOfDay?> pickTime(BuildContext context) {
    return showTimePicker(
      context: context,
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            onSurface: Theme.of(context).colorScheme.onPrimary,
            primary: Theme.of(context).primaryColor,
          ),
          timePickerTheme: TimePickerThemeData(
              helpTextStyle:
                  TextStyle(color: Theme.of(context).colorScheme.onPrimary),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              hourMinuteColor: MaterialStateColor.resolveWith((states) =>
                  states.contains(MaterialState.selected)
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).cardColor),
              hourMinuteTextColor: MaterialStateColor.resolveWith((states) =>
                  states.contains(MaterialState.selected)
                      ? Colors.white
                      : Theme.of(context).colorScheme.onPrimary),
              dialHandColor: Theme.of(context).primaryColor,
              dialBackgroundColor: Theme.of(context).cardColor,
              dialTextColor: MaterialStateColor.resolveWith((states) =>
                  states.contains(MaterialState.selected)
                      ? Colors.white
                      : Theme.of(context).colorScheme.onPrimary),
              entryModeIconColor: Theme.of(context).primaryColor),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              // foregroundColor:
              //     Theme.of(context).primaryColor, // button text color
            ),
          ),
        ),
        child: child!,
      ),
      initialTime: TimeOfDay.now(),
    );
  }

  static String formatDateTime(DateTime? t) {
    return DateFormat("E MMM d, yyyy").format(t!);
  }

  static void showCustomToast(String msg, [Color? bgColor, Color? textColor]) =>
      Fluttertoast.showToast(
          msg: msg,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: bgColor ?? Colors.black,
          textColor: textColor ?? Colors.white,
          fontSize: 16);

  static void cancelAllShowingToasts() => Fluttertoast.cancel();

  static void showAnimatedProgressDialog(BuildContext context,
      {String? title}) {
    showGeneralDialog(
      useRootNavigator: false,
      context: context,
      barrierDismissible: false,
      barrierLabel: 'label',
      transitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (_, __, ___) => Dialog(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: IntrinsicHeight(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SizedBox(
              height: 80,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(width: 30),
                  Flexible(
                    child: Text(
                      title ?? 'Please wait...',
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
              .animate(anim),
          child: child,
        );
      },
    );
  }

  static void showErrorDialog(BuildContext context,
      {String? title,
      String? message,
      String? buttonText,
      bool? isDismissible = true,
      VoidCallback? onDismiss}) {
    showDialog(
      context: context,
      builder: (context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
        child: AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            contentPadding: EdgeInsets.zero,
            content: DangerDialog(
              title: title,
              message: message,
              buttonText: buttonText,
              onDismiss: onDismiss,
            )),
      ),
    );
  }

  static void showConfirmDialog(BuildContext context,
      {String? tittle,
      String? confirmButtonText,
      String? cancelButtonText,
      VoidCallback? onDismiss,
      VoidCallback? onConfirm}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(tittle ?? 'Are you sure you want to exit ?'),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          // foregroundColor: Colors.transparent
                          ),
                      onPressed:onDismiss ?? () {
                        Navigator.pop(context);

                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          color: Colors.redAccent,
                        ),
                      )),
                  const SizedBox(),
                  TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          // foregroundColor: Colors.transparent
                      ),
                      onPressed:onConfirm ?? () {
                        Navigator.pop(context);

                      },
                      child: const Text(
                        'Yes',
                        style: TextStyle(color: Colors.indigo),
                      )),
                ],
              )
            ],
          )),
    );
  }

  static Future<Widget> getFirstScreen() async {
    bool hasOnboarded =
        await StorageHelper.getBoolean(StorageKeys.hasOnBoarded, true);
    bool isLoggedIn =
        await StorageHelper.getBoolean(StorageKeys.stayLoggedIn, false);

    // String? token =
    // await StorageHelper.getString(StorageKeys.token);
    log("IS FIRST TIME USER: $hasOnboarded");
    log("IS LOGGED IN: $isLoggedIn");
    if (!hasOnboarded) {
      return Container();
    } else {
      //-----------Login Check--------------
      if (isLoggedIn) {
        return Container();
        // return const HomeScreen();
      } else {
        return Container();
      }
    }
  }
}

class CustomSnackBar {
  final BuildContext context;

  CustomSnackBar({required this.context});

  CustomSnackBar.showMessage(
    this.context, {
    required String message,
    Function? action,
    String? actionMessage,
    Color? backgroundColor,
  }) {
    final snackBar = SnackBar(
      action: action == null
          ? null
          : SnackBarAction(
              label: actionMessage ?? "OK",
              onPressed: () => action,
              textColor: Colors.white,
            ),
      backgroundColor: backgroundColor ?? backgroundColor ?? Colors.black,
      content: Text(
        message,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  CustomSnackBar.show(
    this.context, {
    required Widget body,
    Function? action,
    String? actionMessage,
    Color? backgroundColor,
  }) {
    final snackBar = SnackBar(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      duration: const Duration(seconds: 5),
      dismissDirection: DismissDirection.horizontal,
      action: action == null
          ? null
          : SnackBarAction(
              label: actionMessage ?? "OK",
              onPressed: () => action,
              textColor: Colors.white,
            ),
      backgroundColor: backgroundColor ?? backgroundColor ?? Colors.black,
      content: body,
      behavior: SnackBarBehavior.floating,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      snackBar,
    );
  }

  CustomSnackBar.showError(
    this.context, {
    required String message,
    Function? action,
    String? actionMessage,
    Color? backgroundColor,
  }) {
    final snackBar = SnackBar(
      action: action == null
          ? null
          : SnackBarAction(
              label: actionMessage ?? "OK",
              onPressed: () => action,
              textColor: Colors.white,
            ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      backgroundColor: backgroundColor ?? backgroundColor ?? Colors.red,
      content: Text(
        message,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

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
                foregroundColor:
                Theme.of(context).primaryColor, // button text color
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
              foregroundColor:
              Theme.of(context).primaryColor, // button text color
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

  // static void showShowConfirmDialog(BuildContext context,
  //     {required String message,
  //     required String cancelButtonText,
  //     required String confirmButtonText,
  //     required VoidCallback onConfirmed,
  //     required VoidCallback onCancel,
  //     Color? color,
  //     bool? isDismissible,
  //     Widget? icon}) {
  //   showDialog(
  //     context: context,
  //     barrierDismissible: isDismissible ?? true,
  //     builder: (context) => AlertDialog(
  //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
  //       backgroundColor: Theme.of(context).bottomSheetTheme.backgroundColor,
  //       content: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           if (icon != null) icon,
  //           if (icon != null)
  //             const SizedBox(
  //               height: 32.0,
  //             ),
  //           Text(
  //             message,
  //             textAlign: TextAlign.center,
  //             style: TextStyle(color: color ?? Colors.grey[500]),
  //           ),
  //           const SizedBox(
  //             height: 32.0,
  //           ),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceAround,
  //             children: [
  //               Expanded(
  //                   child: TextButton(
  //                       child: Text(
  //                         confirmButtonText,
  //                         style: TextStyle(
  //                             color: Theme.of(context).colorScheme.onPrimary),
  //                       ),
  //                       onPressed: onConfirmed)),
  //               const SizedBox(
  //                 width: 16,
  //               ),
  //               Expanded(
  //                   child: TextButton(
  //                       child: Text(
  //                         cancelButtonText,
  //                         style: TextStyle(
  //                             color: Theme.of(context).colorScheme.onPrimary),
  //                       ),
  //                       onPressed: onCancel)),
  //             ],
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }
  //
  // static void showErrorDialog(BuildContext context,
  //     {String? title,
  //     String? message,
  //     String? buttonText,
  //     bool? isDismissible = true,
  //     VoidCallback? onDismiss}) {
  //   AwesomeDialog(
  //           context: context,
  //           dialogType: DialogType.ERROR,
  //           body: RichText(
  //             textAlign: TextAlign.center,
  //             text: TextSpan(
  //               children: [
  //                 TextSpan(
  //                   text: title ?? 'Hooray! 🎉 🎉',
  //                   style: TextStyle(
  //                       color: Theme.of(context).colorScheme.onPrimary,
  //                       fontSize: 18.0,
  //                       fontWeight: FontWeight.bold),
  //                 ),
  //                 TextSpan(
  //                   text: '\n\n$message',
  //                   style: TextStyle(
  //                       color: Theme.of(context)
  //                           .colorScheme
  //                           .onPrimary
  //                           .withOpacity(0.5),
  //                       fontSize: 14.0,
  //                       fontWeight: FontWeight.w400),
  //                 ),
  //               ],
  //             ),
  //           ),
  //           dismissOnBackKeyPress: isDismissible!,
  //           dismissOnTouchOutside: isDismissible,
  //           headerAnimationLoop: false,
  //           btnOkText: buttonText ?? 'Got it',
  //           dialogBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
  //           btnOkColor: Theme.of(context).colorScheme.secondary,
  //           btnOkOnPress: () {
  //             // Navigator.of(context).pop();
  //             if (onDismiss != null) onDismiss();
  //           },
  //           padding: const EdgeInsets.all(16.0))
  //       .show();
  // }
  //
  // static Size getDeviceSize(BuildContext context) =>
  //     MediaQuery.of(context).size;
  //
  // static void showSuccessDialog(BuildContext context,
  //     {String? title,
  //     String? message,
  //     String? buttonText,
  //     bool? isDismissible = true,
  //     VoidCallback? onDismiss}) {
  //   AwesomeDialog(
  //           context: context,
  //           dialogType: DialogType.SUCCES,
  //           body: RichText(
  //             textAlign: TextAlign.center,
  //             text: TextSpan(
  //               children: [
  //                 TextSpan(
  //                   text: title ?? 'Hooray! 🎉 🎉',
  //                   style: TextStyle(
  //                       color: Theme.of(context).colorScheme.onPrimary,
  //                       fontSize: 18.0,
  //                       fontWeight: FontWeight.bold),
  //                 ),
  //                 TextSpan(
  //                   text: '\n\n $message',
  //                   style: TextStyle(
  //                       color: Theme.of(context)
  //                           .colorScheme
  //                           .onPrimary
  //                           .withOpacity(0.5),
  //                       fontSize: 14.0,
  //                       fontWeight: FontWeight.w400),
  //                 ),
  //               ],
  //             ),
  //           ),
  //           dismissOnBackKeyPress: isDismissible!,
  //           dismissOnTouchOutside: isDismissible,
  //           headerAnimationLoop: false,
  //           btnOkText: buttonText ?? 'Got it',
  //           dialogBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
  //           btnOkColor: Theme.of(context).colorScheme.secondary,
  //           btnOkOnPress: () {
  //             // Navigator.of(context).pop();
  //             if (onDismiss != null) onDismiss();
  //           },
  //           padding: const EdgeInsets.all(16.0))
  //       .show();
  // }
  //
  // static void showSuccessSuccessDialog(BuildContext context,
  //     {String? title, String? message}) {
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (context) => AlertDialog(
  //       content: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           SvgPicture.asset(
  //             AppIcons.svgGood,
  //             width: 100,
  //             height: 100,
  //           ),
  //           const SizedBox(
  //             height: 32.0,
  //           ),
  //           if (title != null)
  //             Text(
  //               title,
  //               textAlign: TextAlign.center,
  //               style: const TextStyle(
  //                   color: app_colors.black,
  //                   fontSize: 18,
  //                   fontWeight: FontWeight.bold),
  //             ),
  //           if (title != null)
  //             const SizedBox(
  //               height: 32.0,
  //             ),
  //           Text(
  //             '$message',
  //             textAlign: TextAlign.center,
  //             style: const TextStyle(color: app_colors.textColor, fontSize: 13),
  //           ),
  //           const SizedBox(
  //             height: 32.0,
  //           ),
  //           CustomButton(
  //             child: const Text('OK'),
  //             onTap: () => Navigator.pop(context),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }
  //
  // static void showMessageDialog(BuildContext context,
  //     {String? title, String? message, required VoidCallback onClose}) {
  //   showDialog(
  //     context: context,
  //     barrierDismissible: true,
  //     builder: (context) => AlertDialog(
  //       backgroundColor: Theme.of(context).bottomSheetTheme.backgroundColor,
  //       content: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           Image.asset(
  //             'assets/images/png/sorry.png',
  //             width: 150,
  //             height: 150,
  //           ),
  //           const SizedBox(
  //             height: 18.0,
  //           ),
  //           if (title != null)
  //             Text(
  //               title,
  //               textAlign: TextAlign.center,
  //               style: TextStyle(
  //                   color: Theme.of(context).colorScheme.onPrimary,
  //                   fontSize: 18,
  //                   fontWeight: FontWeight.bold),
  //             ),
  //           if (title != null)
  //             const SizedBox(
  //               height: 32.0,
  //             ),
  //           Text(
  //             '$message',
  //             textAlign: TextAlign.center,
  //             style: const TextStyle(color: Colors.blueGrey),
  //           ),
  //           const SizedBox(
  //             height: 20.0,
  //           ),
  //           CustomButton(
  //             child: const Text(
  //               'CONTINUE',
  //               style: TextStyle(color: Colors.white),
  //             ),
  //             onTap: onClose,
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }
  //
  // static Future<List<String>> fetchImages({bool allowMultiple = false}) async {
  //   try {
  //     FilePicker filePicker = FilePicker.platform;
  //     FilePickerResult? result = await filePicker.pickFiles(
  //       type: FileType.image,
  //       allowCompression: true,
  //       dialogTitle: 'SELECT IMAGE',
  //       withData: true,
  //       allowMultiple: allowMultiple,
  //       // allowedExtensions: ['jpg', 'jpeg', 'png', 'gif'],
  //     );
  //     if (result != null) {
  //       return result.files.map((file) => file.path!).toList();
  //     } else {
  //       return [];
  //     }
  //   } catch (e) {
  //     return [];
  //   }
  // }
  //
  // static Future<String?> fetchImageFromCamera() async {
  //   try {
  //     var pickedFile = await ImagePicker()
  //         .pickImage(source: ImageSource.camera, imageQuality: 70);
  //     if (pickedFile != null) {
  //       return pickedFile.path;
  //     } else {
  //       return null;
  //     }
  //   } catch (e) {
  //     return null;
  //   }
  // }
  //
  // static selectImage(BuildContext context, Function(List<String>) onSelected,
  //     {bool allowMultiple = false,
  //     bool hasViewAction = false,
  //     VoidCallback? onViewAction}) async {
  //   await showMaterialModalBottomSheet(
  //       context: context,
  //       shape: const RoundedRectangleBorder(
  //         borderRadius: BorderRadius.only(
  //             topLeft: Radius.circular(16), topRight: Radius.circular(16)),
  //       ),
  //       backgroundColor: Theme.of(context).scaffoldBackgroundColor,
  //       builder: (context) {
  //         return ListView(
  //           padding: EdgeInsets.zero,
  //           shrinkWrap: true,
  //           children: <Widget>[
  //             InkWell(
  //               child: Container(
  //                   padding: const EdgeInsets.all(16),
  //                   color: Theme.of(context).cardColor,
  //                   child: Text('Take a photo',
  //                       style: TextStyle(
  //                           color: Theme.of(context).colorScheme.onPrimary),
  //                       textAlign: TextAlign.center)),
  //               onTap: () {
  //                 Navigator.pop(context);
  //                 fetchImageFromCamera().then((value) {
  //                   if (null != value) {
  //                     return onSelected([value]);
  //                   }
  //                 });
  //               },
  //             ),
  //             const SizedBox(height: 1),
  //             InkWell(
  //               child: Container(
  //                   padding: const EdgeInsets.all(16),
  //                   color: Theme.of(context).cardColor,
  //                   child: Text('Select from Gallery',
  //                       style: TextStyle(
  //                           color: Theme.of(context).colorScheme.onPrimary),
  //                       textAlign: TextAlign.center)),
  //               onTap: () async {
  //                 Navigator.pop(context);
  //                 var list = await fetchImages(allowMultiple: allowMultiple);
  //                 onSelected(list);
  //               },
  //             ),
  //             if (hasViewAction)
  //               Column(
  //                 children: [
  //                   const SizedBox(height: 1),
  //                   InkWell(
  //                     child: Container(
  //                         width: MediaQuery.of(context).size.width,
  //                         padding: const EdgeInsets.all(16),
  //                         color: Theme.of(context).cardColor,
  //                         child: Text('View Photo',
  //                             style: TextStyle(
  //                                 color:
  //                                     Theme.of(context).colorScheme.onPrimary),
  //                             textAlign: TextAlign.center)),
  //                     onTap: () {
  //                       Navigator.pop(context);
  //                       if (onViewAction != null && hasViewAction) {
  //                         onViewAction();
  //                       }
  //                     },
  //                   ),
  //                 ],
  //               ),
  //             const SizedBox(height: 16),
  //             InkWell(
  //               child: Container(
  //                   padding: const EdgeInsets.all(16),
  //                   color: Theme.of(context).cardColor,
  //                   child: Text(
  //                     'Cancel',
  //                     textAlign: TextAlign.center,
  //                     style: TextStyle(
  //                         color: Theme.of(context).colorScheme.onPrimary),
  //                   )),
  //               onTap: () {
  //                 Navigator.pop(context);
  //                 // _openCamera();
  //               },
  //             ),
  //           ],
  //         );
  //       });
  // }
  //
  // static Future<List<Map<String, String?>>> fetchVideos(
  //     {bool allowMultiple = false}) async {
  //   try {
  //     FilePicker filePicker = FilePicker.platform;
  //     FilePickerResult? result = await filePicker.pickFiles(
  //       type: FileType.video,
  //       allowCompression: true,
  //
  //       allowMultiple: allowMultiple,
  //       // allowedExtensions: ['mp4'],
  //     );
  //     if (result != null) {
  //       return result.files
  //           .map((file) => {'path': file.path, 'size': file.size.toString()})
  //           .toList();
  //     } else {
  //       return [];
  //     }
  //   } catch (e) {
  //     return [];
  //   }
  // }
  //
  // static Future<List<PlatformFile>> fetchMedia(
  //     {bool allowMultiple = false,
  //     Function(FilePickerResult? result)? onSelect}) async {
  //   try {
  //     FilePicker filePicker = FilePicker.platform;
  //     FilePickerResult? result = await filePicker.pickFiles(
  //       type: FileType.custom,
  //       allowCompression: true,
  //       allowMultiple: allowMultiple,
  //       allowedExtensions: ['mp4', 'mov', 'jpg', 'jpeg', 'png'],
  //     ).then((value) {
  //       onSelect!(value);
  //       return null;
  //     });
  //     if (result != null) {
  //       return result.files;
  //     } else {
  //       return [];
  //     }
  //   } catch (e) {
  //     return [];
  //   }
  // }
  //
  // static String getDateAndTime(DateTime createdAt) {
  //   return DateFormat("MMMM dd, yyyy hh:mm a").format(createdAt);
  // }
  //
  // static String getGroupLabel(int groupByValue) {
  //   DateTime date = DateTime.fromMillisecondsSinceEpoch(groupByValue);
  //   if (date.day == DateTime.now().day) {
  //     return 'Today';
  //   } else if (date.day == DateTime.now().day - 1) {
  //     return 'Yesterday';
  //   }
  //
  //   return DateFormat.yMMMEd()
  //       .format(DateTime.fromMillisecondsSinceEpoch(groupByValue));
  // }
  //
  // static Future<bool> confirmPin(String pin) async {
  //   String? correctPin =
  //       await StorageHelper.getString(StorageKeys.transactionKey);
  //
  //   if (correctPin != null) {
  //     log('CoORRECT $correctPin');
  //     log('PIN$pin');
  //     return pin == correctPin;
  //   } else {
  //     log('CoORRECT $correctPin');
  //
  //     return false;
  //   }
  // }
  //
  // static void updateFingerPrintEnabled(bool val) async {
  //   StorageHelper.setBoolean(StorageKeys.fingerPrintEnabled, val);
  // }
  //
  // static Future<bool> fingerPrintEnabled() async {
  //   return await StorageHelper.getBoolean(
  //       StorageKeys.fingerPrintEnabled, false);
  // }
  //
  // static void showConfirmPinDialog(BuildContext context,
  //     {required VoidCallback onCorrect,
  //     required VoidCallback onInCorrect,
  //     required PINController controller,
  //     String message =
  //         'Please Enter your secret pin to complete transaction.'}) async {
  //   // bool isFingerPrintEnabled = await fingerPrintEnabled();
  //   UserData? userData = await getUserData();
  //
  //   showDialog(
  //       context: context,
  //       builder: (context) => ConFirmPinDialog(
  //           onCorrect: onCorrect,
  //           onInCorrect: onInCorrect,
  //           controller: controller,
  //           userData: userData,
  //           message: message));
  // }
}

// class ConFirmPinDialog extends StatefulWidget {
//   const ConFirmPinDialog(
//       {Key? key,
//       required this.onCorrect,
//       required this.onInCorrect,
//       required this.controller,
//       this.userData,
//       required this.message})
//       : super(key: key);
//   final VoidCallback onCorrect;
//   final VoidCallback onInCorrect;
//   final PINController controller;
//   final UserData? userData;
//   final String message;
//
//   @override
//   State<ConFirmPinDialog> createState() => _ConFirmPinDialogState();
// }

// class _ConFirmPinDialogState extends State<ConFirmPinDialog> {
//   AuthBloc authBloc = AuthBloc(injector.get());
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<AuthBloc, AuthState>(
//       bloc: authBloc,
//       listener: (context, state) {
//         if (state is ResendOtpLoadingState) {
//           AppUtils.showAnimatedProgressDialog(context,
//               title: "Sending an OTP, please wait.");
//         }
//         if (state is ResendOtpSuccessState) {
//           Navigator.pop(context);
//           Navigator.pop(context);
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) =>
//                     ScreenOtpVerify(email: widget.userData!.user.email,userId: widget.userData!.user.id,otpType: OtpType.pinChange),
//               ));
//         }
//       },
//       child: Scaffold(
//         body: Center(
//           child: Column(
//             children: [
//               const SizedBox(
//                 height: 20,
//               ),
//               // const CircleAvatar(
//               //   backgroundColor: Colors.amber,
//               //   radius: 45,
//               //   backgroundImage:
//               //   NetworkImage('https://freesvg.org/img/winkboy.png'),
//               // ),
//               const SizedBox(
//                 height: 16,
//               ),
//               Text(
//                 widget.message,
//                 textAlign: TextAlign.center,
//                 style: const TextStyle(
//                     color: Colors.blueGrey,
//                     fontSize: 18,
//                     fontWeight: FontWeight.w500),
//               ),
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.all(28.0),
//                   child: PinDigitsLayout(
//                       onDigitPressed: (val) {},
//                       onDelete: () {},
//                       onDone: (val) async {
//                         bool confirmed = await AppUtils.confirmPin(val);
//                         log(confirmed.toString());
//                         if (!confirmed) {
//                           widget.controller.resetPin();
//                           widget.onInCorrect();
//                         } else {
//                           widget.onCorrect();
//                         }
//
//                         // showCustomToast('hello');
//                       },
//                       pinController: widget.controller),
//                 ),
//               ),
//               FutureBuilder(
//                 future: AppUtils.isFingerprint(),
//                 builder: (context, AsyncSnapshot<bool> snapshot) {
//                   if (snapshot.hasData) {
//                     return Visibility(
//                       visible: snapshot.data!,
//                       child: Center(
//                         child: InkWell(
//                           onTap: () async {
//                             final LocalAuthentication auth =
//                                 LocalAuthentication();
//                             try {
//                               final bool didAuthenticate = await auth
//                                   .authenticate(
//                                       localizedReason: 'Authenticate with biometric',
//                                       options: const AuthenticationOptions(
//                                           biometricOnly: true))
//                                   .then((value) {
//                                 if (value) {
//                                   widget.onCorrect();
//                                 }
//                                 return value;
//                               });
//                               // ···
//                             } on PlatformException catch (e) {
//                               if (e.code == auth_error.notAvailable) {
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                     const SnackBar(
//                                         content: Text(
//                                             'Fingerprint not available!')));
//                                 log('not Available');
//                                 // Add handling of no hardware here.
//                               } else if (e.code == auth_error.notEnrolled) {
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                     const SnackBar(
//                                         content:
//                                             Text('Fingerprint not enrolled!')));
//                                 log('not enrolled');
//                                 // ...
//                               } else {
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                     SnackBar(
//                                         content: Text(e.message.toString())));
//
//                                 log(e.message.toString());
//                                 // ...
//                               }
//                             }
//                           },
//
//                           child: Text(
//                             'Use fingerprint biometric',
//                             style: TextStyle(
//                                 color: Theme.of(context).colorScheme.onPrimary),
//                           ),
//
//                           // child: CircleAvatar(
//                           //   backgroundColor: Theme.of(context).cardColor,
//                           //   child: const Icon(
//                           //     Icons.fingerprint,
//                           //     size: 40,
//                           //     color: Colors.blueGrey,
//                           //   ),
//                           //   radius: 45,
//                           // ),
//                         ),
//                       ),
//                     );
//                   }
//                   return const SizedBox();
//                 },
//               ),
//               const SizedBox(
//                 height: 16,
//               ),
//
//               GestureDetector(
//                   onTap: () {
//                     authBloc.add(ResendOtpEvent(
//                         email: widget.userData!.user.email,
//                         userId: widget.userData!.user.id.toString()));
//                   },
//                   child: Text(
//                     'Forgot PIN ?',
//                     style: TextStyle(
//                         color: Theme.of(context).colorScheme.onPrimary),
//                   )),
//               const SizedBox(
//                 height: 40,
//               ),
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class CustomSnackBar {
  final BuildContext context;

  CustomSnackBar({required this.context});

  CustomSnackBar.show(
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
        style:  const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
        style:  const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

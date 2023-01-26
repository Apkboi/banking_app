import 'package:banking_app/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart' as app_colors;
import 'package:shared_preferences/shared_preferences.dart';

class AppTheme {
  //

  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: app_colors.lightBackgroundColor,
    fontFamily: 'Poppins',
    cardColor: app_colors.lightCardColor,
    primaryColor: app_colors.primaryColor,
    bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: app_colors.lightBottomSheetColor),
    appBarTheme: AppBarTheme(
      color: app_colors.lightBackgroundColor,
      systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: app_colors.white,
      ),
      toolbarTextStyle: const TextStyle(
        color: app_colors.black,
      ),
      iconTheme: const IconThemeData(
        color: Colors.blueGrey,
      ),
    ),
    colorScheme: const ColorScheme.light(
        primary: app_colors.primaryColor,
        onPrimary: app_colors.black,
        primaryContainer: Colors.white38,
        secondary: Color.fromARGB(255, 47, 121, 200),
        onBackground: Colors.red,
        onSecondary: Colors.blueGrey),
    cardTheme: CardTheme(
      color: const Color(0xFF393939).withOpacity(0.1),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black),
    iconTheme: const IconThemeData(
      color: Colors.blueGrey,
    ),
    textTheme: const TextTheme(
      button: TextStyle(color: Colors.black),
      headline6: TextStyle(
        color: Colors.black,
        // fontSize: 20.0,
      ),
      subtitle2: TextStyle(
        color: Colors.blueGrey,
        // fontSize: 18.0,
      ),
    ),
  );

  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  //   SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
  //   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFF1f1d2b),
    cardColor: const Color(0xFF252836),
    bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: app_colors.darkBottomSheetColor),
    fontFamily: 'Poppins',
    appBarTheme: AppBarTheme(
      color: const Color(0xFF1f1d2b),
      systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: const Color(0xFF121212),
      ),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
    ),
    colorScheme: const ColorScheme.light(
      primary: Colors.black,
      onPrimary: Colors.white,
      primaryContainer: Color(0xFF141d26),
      secondary: Color.fromARGB(255, 47, 121, 200),
      onSecondary: Colors.white,
    ),
    cardTheme: const CardTheme(
      color: Color(0xFF252836),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xFF252836),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white),
    iconTheme: const IconThemeData(
      color: Colors.white54,
    ),
    textTheme: const TextTheme(
      caption: TextStyle(color: Colors.white),
      headline6: TextStyle(
        color: Colors.white,
        // fontSize: 20.0,
      ),
      subtitle2: TextStyle(
        color: Colors.white70,
        // fontSize: 18.0,
      ),
    ),
  );
  static InputDecoration filledTextFieldDecoration = InputDecoration(
    filled: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 16),
    border: OutlineInputBorder(
        gapPadding: 2,
        borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
  );

  static Future<bool> getPhoneTheme() async {
    try {
      var brightness = SchedulerBinding.instance.window.platformBrightness;
      return brightness == Brightness.dark;
      // }
    } catch (e) {
      debugPrint('Fetch theme error:${e.toString()}');
      return false;
    }
  }

  static Future<bool> getThemeValue() async {
    try {
      var preferences = await SharedPreferences.getInstance();
      // bool value = preferences.getBool(Constants.themeKey)!;
     await  initializeTheme();
      String themeMode = preferences.getString(Constants.themeMode)!;

      if (themeMode == 'PHONE') {
        debugPrint('Theme value:PHONE');
        return await getPhoneTheme();
      } else if (themeMode == 'DARK') {
        debugPrint('Theme value:DARK');
        return true;
      } else if (themeMode == 'LIGHT') {
        debugPrint('Theme value:LIGHT');
        return false;
      } else {
        return false;
      }

      // }
    } catch (e) {
      debugPrint('Fetch theme error:${e.toString()}');
      return false;
    }
  }

  static Future<void> initializeTheme() async {
    try {
      var preferences = await SharedPreferences.getInstance();
      String? themeMode = preferences.getString(Constants.themeMode);
      if (themeMode == null) {
        setThemeMode('PHONE');
      }

      debugPrint('Theme value:$themeMode');

      // }
    } catch (e) {
      debugPrint('Fetch theme error:${e.toString()}');
    }
  }

  static Future<void> setThemeMode(String val) async {
    try {
      var preferences = await SharedPreferences.getInstance();
      bool value = await preferences.setString(Constants.themeMode, val);
      debugPrint("ThemeMode set :$value");
    } catch (e) {
      debugPrint('Set theme mode error:${e.toString()}');
    }
  }

  static Future<bool> setThemeValue(bool val) async {
    try {
      var preferences = await SharedPreferences.getInstance();
      bool value = await preferences.setBool(Constants.themeMode, val);
      debugPrint("Theme set to:$value");
      return val;
    } catch (e) {
      debugPrint('Set theme error:${e.toString()}');
      return false;
    }
  }

  static Future<bool> get isFirstTimeUser async {
    try {
      var preferences = await SharedPreferences.getInstance();
      var object = preferences.get(Constants.firstTimeUserKey);
      if (object == null) {
        return true;
      } else {
        bool value = preferences.getBool(Constants.firstTimeUserKey)!;
        return value;
      }
    } catch (e) {
      debugPrint('get first time user error:${e.toString()}');
      return false;
    }
  }

  static Future<bool> setFirstTimeUser(bool val) async {
    try {
      var preferences = await SharedPreferences.getInstance();
      bool value = await preferences.setBool(Constants.firstTimeUserKey, val);
      debugPrint("First time user set to:$value");
      return val;
    } catch (e) {
      debugPrint('Set First time user error:${e.toString()}');
      return false;
    }
  }

  static Color alphaBlend(Color foreground, Color background) {
    final int alpha = foreground.alpha;
    if (alpha == 0x00) {
      // Foreground completely transparent.
      return background;
    }
    final int invAlpha = 0xff - alpha;
    int backAlpha = background.alpha;
    if (backAlpha == 0xff) {
      // Opaque background case
      return Color.fromARGB(
        0xff,
        (alpha * foreground.red + invAlpha * background.red) ~/ 0xff,
        (alpha * foreground.green + invAlpha * background.green) ~/ 0xff,
        (alpha * foreground.blue + invAlpha * background.blue) ~/ 0xff,
      );
    } else {
      // General case
      backAlpha = (backAlpha * invAlpha) ~/ 0xff;
      final int outAlpha = alpha + backAlpha;
      assert(outAlpha != 0x00);
      return Color.fromARGB(
        outAlpha,
        (foreground.red * alpha + background.red * backAlpha) ~/ outAlpha,
        (foreground.green * alpha + background.green * backAlpha) ~/ outAlpha,
        (foreground.blue * alpha + background.blue * backAlpha) ~/ outAlpha,
      );
    }
  }

  static Color getTextColor(Color color) {
    int d = 0;
// Counting the perceptive luminance - human eye favors green color...
    double luminance =
        (0.299 * color.red + 0.587 * color.green + 0.114 * color.blue) / 255;

    if (luminance > 0.5) {
      d = 0;
    } else {
      d = 255;
    } // dark colors - white font

    return Color.fromARGB(color.alpha, d, d, d);
  }

  static InputDecoration inputDecoration(BuildContext context) =>
      InputDecoration(
        hintStyle: TextStyle(
          color: Theme.of(context).colorScheme.onPrimary,
          fontSize: 16.0,
        ),
        filled: true,
        counterStyle: const TextStyle(color: Colors.blueGrey),
        fillColor: Theme.of(context).cardColor,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8.0)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8.0)),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8.0)),
        // enabledBorder: OutlineInputBorder(
        //     borderRadius: BorderRadius.all(Radius.circular(5.0)),
        //     borderSide: BorderSide(
        //       color: Theme.of(context).colorScheme.secondary,
        //     )),
        // focusedBorder: OutlineInputBorder(
        //     borderRadius: BorderRadius.all(Radius.circular(5.0)),
        //     borderSide: BorderSide(
        //       color: Theme.of(context).colorScheme.secondary,
        //     )),
        // border: OutlineInputBorder(
        //     borderRadius: BorderRadius.all(Radius.circular(5.0)),
        //     borderSide: BorderSide(
        //       color: Theme.of(context).colorScheme.secondary,
        // )
        // )
      );
}

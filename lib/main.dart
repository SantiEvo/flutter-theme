import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_ecommerce_ui_kit/auth/auth.dart';
import 'package:flutter_ecommerce_ui_kit/blocks/auth_block.dart';
import 'package:flutter_ecommerce_ui_kit/cart.dart';
import 'package:flutter_ecommerce_ui_kit/categorise.dart';
import 'package:flutter_ecommerce_ui_kit/home/home.dart';
import 'package:flutter_ecommerce_ui_kit/localizations.dart';
import 'package:flutter_ecommerce_ui_kit/product_detail.dart';
import 'package:flutter_ecommerce_ui_kit/settings.dart';
import 'package:flutter_ecommerce_ui_kit/shop/shop.dart';
import 'package:flutter_ecommerce_ui_kit/wishlist.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:theme_provider/theme_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider<AuthBlock>.value(value: AuthBlock())],
    child: EcommerceApp()
  ));
}

class EcommerceApp extends StatelessWidget {
  EcommerceApp({super.key});
  
  final Locale locale = Locale('en');

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      saveThemesOnChange: true,
        onInitCallback: (controller, previouslySavedThemeFuture) async {
          String? themeId = const String.fromEnvironment("THEME_ID",
              defaultValue: "custom_theme_1");
          if (kDebugMode) {
            print(themeId);
          }
          controller.setTheme(themeId);
        },
        themes: [
          AppTheme(
            id: "custom_theme_1", // Id(or name) of the theme(Has to be unique)
            description: "My Custom Theme 3", // Description of theme
            data: ThemeData(
                // Real theme data
                accentColor: Colors.blue,
                primaryColor: Colors.blue,
                buttonTheme: ButtonThemeData(
                  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(primary: Colors.blue)
                ),
                textTheme: TextTheme(
                  headline1: TextStyle(color: Colors.blue),
                  headline2: TextStyle(color: Colors.blue),
                  headline3: TextStyle(color: Colors.blue),
                  headline4: TextStyle(color: Colors.blue),
                  headline5: TextStyle(color: Colors.blue),
                  headline6: TextStyle(color: Colors.blue),
                  bodyText1: TextStyle(color: Colors.blue),
                  bodyText2: TextStyle(color: Colors.blue),
                ),
                iconTheme: IconThemeData(color: Colors.blue),
                listTileTheme: ListTileThemeData(
                  iconColor: Colors.blue,
                ),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                    backgroundColor: Colors.grey),
                colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
                    .copyWith(secondary: Colors.blue)),
          ),
          AppTheme(
            id: "custom_theme_2", // Id(or name) of the theme(Has to be unique)
            description: "My Custom Theme 2", // Description of theme
            data: ThemeData(
                // Real theme data
                accentColor: Colors.red,
                primaryColor: Colors.red,
                buttonTheme: ButtonThemeData(
                  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red).copyWith(primary: Colors.red)
                ),
                textTheme: TextTheme(
                  headline1: TextStyle(color: Colors.red),
                  headline2: TextStyle(color: Colors.red),
                  headline3: TextStyle(color: Colors.red),
                  headline4: TextStyle(color: Colors.red),
                  headline5: TextStyle(color: Colors.red),
                  headline6: TextStyle(color: Colors.red),
                  bodyText1: TextStyle(color: Colors.red),
                  bodyText2: TextStyle(color: Colors.red),
                ),
                iconTheme: IconThemeData(color: Colors.red),
                listTileTheme: ListTileThemeData(
                  iconColor: Colors.red,
                ),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                    backgroundColor: Colors.white),
                colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red)
                    .copyWith(secondary: Colors.white)),

          ),
          AppTheme(
            id: "custom_theme_3", // Id(or name) of the theme(Has to be unique)
            description: "My Custom Theme 3", // Description of theme
            data: ThemeData(
                // Real theme data
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                    backgroundColor: Colors.black),
                colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)
                    .copyWith(secondary: Colors.orange)),
          ),
        ],
        child: ThemeConsumer(
            child: Builder(
              builder: (themeContext) => MaterialApp(
                theme: ThemeProvider.themeOf(themeContext).data,
                title: 'Material App',
                localizationsDelegates: [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: [Locale('en'), Locale('ar')],
                locale: locale,
                debugShowCheckedModeBanner: false,
                initialRoute: '/',
                routes: <String, WidgetBuilder>{
                  '/': (BuildContext context) => Home(),
                  '/auth': (BuildContext context) => Auth(),
                  '/shop': (BuildContext context) => Shop(),
                  '/categorise': (BuildContext context) => Categorise(),
                  '/wishlist': (BuildContext context) => WishList(),
                  '/cart': (BuildContext context) => CartList(),
                  '/settings': (BuildContext context) => Settings(),
                  '/products': (BuildContext context) => Products()
                },
              ),
            )
        )
    );
  }

}
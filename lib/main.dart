// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: deprecated_member_use

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';
import './utils/themes/blue.dart';
import 'utils/themes/light.dart';
import './utils/themes/dark.dart';

void main() {
  runApp(const MyApp());
}

class IndexPage extends StatelessWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Index"),
      ),
    );
  }
}

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      child: Scrollbar(
        child: Align(
          alignment: Alignment.topCenter,
          child: Card(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 400),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ...[
                      TextFormField(
                        decoration: const InputDecoration(
                          filled: true,
                          labelText: 'Nombre',
                        ),
                        onChanged: (value) {
                          print(value);
                        },
                      ),
                      TextFormField(
                          decoration: const InputDecoration(
                            filled: true,
                            labelText: 'Apellidos',
                          ),
                          onChanged: (value) {
                            print(value);
                          }),
                      TextFormField(
                          decoration: const InputDecoration(
                            filled: true,
                            labelText: 'Teléfono',
                          ),
                          onChanged: (value) {
                            print(value);
                          }),
                      TextFormField(
                          decoration: const InputDecoration(
                            filled: true,
                            labelText: 'Email',
                          ),
                          onChanged: (value) {
                            print(value);
                          }),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Enviar'),
                      ),
                    ].expand(
                      (widget) => [
                        widget,
                        const SizedBox(
                          height: 24,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ));
  }
}

class ServicesPage extends StatelessWidget {
  final List<String> items;

  const ServicesPage({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            child: Text(items[index]),
          );
        },
      ),
    ));
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const List<String> services = [
    "service_1",
    "service_2",
    "service_3",
    "service_4"
  ];
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    IndexPage(),
    ServicesPage(
      items: services,
    ),
    ContactPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
        ),
        body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Servicios',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'Contacto',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        BlueTheme().getTheme(),
        LightTheme().getTheme(),
        DartTheme().getTheme(),
      ],
      child: ThemeConsumer(
        child: Builder(
          builder: (themeContext) => MaterialApp(
            theme: ThemeProvider.themeOf(themeContext).data,
            title: 'Material App',
            home: const HomePage(),
          ),
        ),
      ),
    );
  }
}

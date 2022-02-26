import 'package:flutter/material.dart';
import 'package:math_tools/src/congruence/congruence_page.dart';
import 'package:math_tools/src/euclidean/euclidean_page.dart';
import 'package:math_tools/src/menu/page.dart' as menu;

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../settings/settings_view.dart';

/// Displays a list of SampleItems.
class MenuListView extends StatelessWidget {
  const MenuListView({
    Key? key,
  }) : super(key: key);

  static const routeName = '/';

  static const List<menu.Page> pages = [
    menu.Page(
      EuclideanPage.routeName,
      EuclideanPage.pageName,
    ),
    menu.Page(
      CongruenceSystemPage.routeName,
      CongruenceSystemPage.pageName,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(localization.appTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),
      body: ListView.builder(
        restorationId: 'toolsList',
        itemCount: pages.length,
        itemBuilder: (BuildContext context, int index) {
          final page = pages[index];
          return ListTile(
              title: Text(page.displayName(localization)),
              leading: const CircleAvatar(
                foregroundImage: AssetImage('assets/images/flutter_logo.png'),
              ),
              onTap: () {
                Navigator.restorablePushNamed(
                  context,
                  page.pageRoute,
                );
              });
        },
      ),
    );
  }
}

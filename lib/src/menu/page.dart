import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Page {
  final String pageRoute;
  final String Function(AppLocalizations localizations) displayName;

  const Page(this.pageRoute, this.displayName);
}

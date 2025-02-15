import 'package:enpal_tech_chall/core/localizations/localizations.dart';
import 'package:flutter/material.dart';

class NoInternetWidget extends StatelessWidget {
  final bool showOfflineWidget;

  final VoidCallback onRefresh;

  final Widget child;

  const NoInternetWidget({
    super.key,
    required this.showOfflineWidget,
    required this.child,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return showOfflineWidget
        ? LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return AspectRatio(
              aspectRatio: 1,
              child: Column(
                spacing: 16,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Icon(Icons.signal_wifi_off, size: 48),
                  Text(
                    LocaleKeys.no_internet_connection_title.tr(),
                    style: Theme.of(context).textTheme.displaySmall,
                    textAlign: TextAlign.center,
                  ),
                  ElevatedButton(
                    onPressed: onRefresh,
                    child: Text(LocaleKeys.retry.tr()),
                  ),
                ],
              ),
            );
          },
        )
        : child;
  }
}

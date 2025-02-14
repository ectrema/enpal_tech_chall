import 'package:enpal_tech_chall/ui/screens/main/main.view_model.dart';
import 'package:enpal_tech_chall/ui/screens/main/main.view_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MainViewModel viewModel = ref.read(mainViewModelProvider.notifier);
    final int currentIndex = ref.watch(
      mainViewModelProvider.select((MainState s) => s.index),
    );

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 24, left: 24, right: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List<Widget>.generate(3, (int index) {
              final (String, IconData) info = viewModel.navBarInfo(index);

              return Expanded(
                child: GestureDetector(
                  onTap: () => viewModel.onItemTapped(index, navigationShell),
                  child: AnimatedContainer(
                    margin: EdgeInsets.only(top: 4, bottom: 4),
                    duration: Duration(milliseconds: 200),
                    decoration: ShapeDecoration(
                      shape: StadiumBorder(),
                      color: currentIndex == index ? Colors.white : null,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topCenter,
                            heightFactor: 1.0,
                            child: Icon(info.$2),
                          ),
                          Text(info.$1),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

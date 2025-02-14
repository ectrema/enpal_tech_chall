import 'package:enpal_tech_chall/ui/screens/main/solar/solar.view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SolarScreen extends ConsumerStatefulWidget {
  const SolarScreen({super.key});

  @override
  ConsumerState<SolarScreen> createState() => _SolarScreenState();
}

class _SolarScreenState extends ConsumerState<SolarScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(solarViewModelProvider.notifier).getMonitoring();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 16),
        child: SafeArea(child: Center(child: Text('Solar Screen'))),
      ),
    );
  }
}

import 'package:enpal_tech_chall/core/localizations/localizations.dart';
import 'package:enpal_tech_chall/core/utils/utils.dart';
import 'package:enpal_tech_chall/ui/screens/main/house/house.view_model.dart';
import 'package:enpal_tech_chall/ui/screens/main/house/house.view_state.dart';
import 'package:enpal_tech_chall/ui/widget/custom_line_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HouseScreen extends ConsumerStatefulWidget {
  const HouseScreen({super.key});

  @override
  ConsumerState<HouseScreen> createState() => _HouseScreenState();
}

class _HouseScreenState extends ConsumerState<HouseScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
      ref.read(houseViewModelProvider.notifier).getMonitoring();
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.house_consumption.tr(),
          style: textTheme.headlineMedium,
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[const _Header(), const _Graph()],
        ),
      ),
    );
  }
}

class _Header extends ConsumerWidget {
  const _Header();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DateTime date = ref.watch(
      houseViewModelProvider.select((HouseState value) => value.date),
    );
    final HouseViewModel viewModel = ref.read(houseViewModelProvider.notifier);

    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: TextButton(
        onPressed: () async {
          final DateTime? selectedDate = await Utils.showNativeDatePicker(
            context: context,
            initialDate: date,
          );
          if (selectedDate != null) {
            viewModel.setDate(selectedDate);
          }
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(Utils.formatDate(date)),
            const SizedBox(width: 8),
            const Icon(Icons.calendar_today, size: 16),
          ],
        ),
      ),
    );
  }
}

class _Graph extends ConsumerWidget {
  const _Graph();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Map<DateTime, double> data = ref.watch(
      houseViewModelProvider.select(
        (HouseState value) => value.monitoring.hourlySum,
      ),
    );

    if (data.isEmpty) {
      return Center(child: Text(LocaleKeys.no_data.tr()));
    }

    return AspectRatio(
      aspectRatio: 1.3,
      child: Padding(
        padding: const EdgeInsets.only(right: 18, top: 24),
        child: CustomLineChart(data: data),
      ),
    );
  }
}

import 'package:enpal_tech_chall/core/utils/utils.dart';
import 'package:flutter/material.dart';

class SelectDateButton extends StatelessWidget {
  final DateTime date;

  final Function(DateTime) onPressed;

  const SelectDateButton({
    super.key,
    required this.date,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        final DateTime? selectedDate = await Utils.showNativeDatePicker(
          context: context,
          initialDate: date,
        );
        if (selectedDate != null) {
          onPressed(selectedDate);
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
    );
  }
}

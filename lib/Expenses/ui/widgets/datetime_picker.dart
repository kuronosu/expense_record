import 'package:expense_record/Expenses/ui/widgets/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatetimePicker extends StatefulWidget {
  const DatetimePicker({
    Key? key,
    required this.label,
    required this.firstDate,
    required this.lastDate,
    required this.initialDate,
    required this.onChanged,
  }) : super(key: key);
  final String label;
  final DateTime firstDate, lastDate, initialDate;
  final ValueChanged<DateTime> onChanged;

  @override
  State<DatetimePicker> createState() => _DatetimePickerState();
}

class _DatetimePickerState extends State<DatetimePicker> {
  late TextEditingController _dateController;
  DateTime? __date;
  var _withTime = true;

  DateTime get _date => __date ?? widget.initialDate;
  set _date(DateTime val) => __date = val;

  @override
  void initState() {
    super.initState();
    _dateController = TextEditingController(text: formatter.format(_date));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: TextFormField(
          controller: _dateController,
          style: const TextStyle(color: Colors.white),
          readOnly: true,
          onTap: () {
            _showPicker(_date, widget.firstDate, widget.lastDate);
          },
          decoration: InputDecoration(
              icon: whiteIcon(Icons.calendar_month_rounded),
              border: inputBorder(Colors.white54),
              enabledBorder: inputBorder(Colors.white54),
              disabledBorder: inputBorder(Colors.white12),
              focusedBorder: inputBorder(Colors.white),
              errorBorder: inputBorder(Colors.red),
              labelText: 'Date',
              labelStyle: const TextStyle(color: Colors.white)),
        )),
        Container(
            margin: const EdgeInsets.only(top: 10),
            child: Switch(
              value: _withTime,
              activeColor: const Color(0xFF64b5f6),
              inactiveTrackColor: const Color(0xFF003064),
              activeTrackColor: Colors.blue,
              onChanged: (value) {
                setState(() {
                  _withTime = value;
                  onChanged();
                });
              },
            ))
      ],
    );
  }

  Future<void> _showPicker(
    DateTime initialDate,
    DateTime firstDate,
    DateTime lastDate,
  ) async {
    var date = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );
    if (date != null && _withTime) {
      final time = await showTimePicker(
        initialTime: TimeOfDay.fromDateTime(initialDate),
        context: context,
      );
      if (time != null) {
        date =
            DateTime(date.year, date.month, date.day, time.hour, time.minute);
      } else {
        return;
      }
    }
    if (date != null) {
      setState(() {
        _date = date!;
        onChanged();
      });
    }
  }

  void onChanged() {
    _dateController.text = formatter.format(_date);
    final dt = _date;
    var tmp = DateTime(dt.year, dt.month, dt.day, dt.hour, dt.minute, dt.second,
        dt.millisecond, dt.microsecond);
    if (!_withTime) {
      tmp = DateTime(dt.year, dt.month, dt.day);
    }
    widget.onChanged(tmp);
  }

  DateFormat get formatter =>
      _withTime ? DateFormat.yMMMMd().add_jm() : DateFormat.yMMMMd();
}

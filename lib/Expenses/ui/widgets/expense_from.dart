import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:expense_record/Expenses/model/expense.dart';
import 'package:expense_record/utils/datetime_utils.dart';
import 'package:expense_record/Expenses/ui/widgets/datetime_picker.dart';
import 'package:expense_record/Expenses/ui/widgets/utils.dart';

const url = 'https://c.tenor.com/IMNDZBkct8gAAAAC/anime-girl.gif';

typedef OnSubmitExpenseForm = void Function(
    String description, DateTime date, double value);

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({
    Key? key,
    this.initialData,
    required this.buttonText,
    required this.onSubmit,
  }) : super(key: key);

  final String buttonText;
  final OnSubmitExpenseForm onSubmit;
  final Expense? initialData;

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _formKey = GlobalKey<FormState>();
  var withTime = true;

  late String description;
  late DateTime date;
  late double value;

  late TextEditingController _descriptionFieldController;
  late TextEditingController _valueFieldController;

  @override
  void initState() {
    super.initState();
    date = widget.initialData?.date ?? DateTime.now();
    description = widget.initialData?.description ?? '';
    value = widget.initialData?.price ?? 0;
    _descriptionFieldController = TextEditingController(text: description);
    _valueFieldController = TextEditingController(text: value.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          descriptionField,
          valueField,
          DatetimePicker(
            label: 'Date',
            initialDate: date,
            firstDate: DateTime(1990),
            lastDate: DateTime(3000),
            onChanged: (dt) => date = dt,
            initialWithTime: !date.isOnlyDate(),
          ),
          Container(
              padding: const EdgeInsets.only(top: 40.0),
              child: ElevatedButton(
                child: Text(widget.buttonText),
                onPressed: () {
                  if (_formKey.currentState != null &&
                      _formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    widget.onSubmit(description, date, value);
                  }
                },
              )),
        ],
      ),
    );
  }

  TextFormField get descriptionField => TextFormField(
        controller: _descriptionFieldController,
        style: const TextStyle(color: Colors.white),
        onSaved: (String? value) => description = value ?? "",
        validator: (value) {
          if (value == null || value.isEmpty || value.trim().isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        decoration: InputDecoration(
            icon: whiteIcon(Icons.description_rounded),
            border: inputBorder(Colors.white54),
            enabledBorder: inputBorder(Colors.white54),
            disabledBorder: inputBorder(Colors.white12),
            focusedBorder: inputBorder(Colors.white),
            errorBorder: inputBorder(Colors.red),
            labelText: 'Description',
            labelStyle: const TextStyle(color: Colors.white)),
      );

  TextFormField get valueField => TextFormField(
        controller: _valueFieldController,
        style: const TextStyle(color: Colors.white),
        keyboardType:
            const TextInputType.numberWithOptions(decimal: true, signed: false),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
          TextInputFormatter.withFunction((oldValue, newValue) {
            try {
              final text = newValue.text;
              if (text.isNotEmpty) double.parse(text);
              return newValue;
            } catch (e) {
              return oldValue;
            }
          }),
        ],
        onSaved: (String? value) =>
            this.value = value != null ? double.parse(value) : 0,
        validator: (value) {
          if (value == null ||
              value.isEmpty ||
              value.trim().isEmpty ||
              (double.tryParse(value.trim()) ?? 0) <= 0) {
            return 'Please enter a valid value';
          }
          return null;
        },
        decoration: InputDecoration(
            icon: whiteIcon(Icons.monetization_on_rounded),
            border: inputBorder(Colors.white54),
            enabledBorder: inputBorder(Colors.white54),
            disabledBorder: inputBorder(Colors.white12),
            focusedBorder: inputBorder(Colors.white),
            errorBorder: inputBorder(Colors.red),
            labelText: 'Value',
            labelStyle: const TextStyle(color: Colors.white)),
      );
}

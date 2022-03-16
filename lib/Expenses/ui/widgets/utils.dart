import 'package:flutter/material.dart';

Icon whiteIcon(IconData icon) => Icon(icon, color: Colors.white);

InputBorder inputBorder(Color color) =>
    UnderlineInputBorder(borderSide: BorderSide(color: color));

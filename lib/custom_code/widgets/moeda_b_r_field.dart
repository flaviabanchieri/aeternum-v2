// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class MoedaBRField extends StatefulWidget {
  const MoedaBRField({
    Key? key,
    this.width,
    this.height,
    required this.bordercolor,
    required this.borderRadius,
    required this.initialValue,
    this.labelText,
    this.labelTextColor,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Color bordercolor;
  final double borderRadius;
  final String initialValue;
  final String? labelText;
  final Color? labelTextColor;

  @override
  _MoedaBRFieldState createState() => _MoedaBRFieldState();
}

class _MoedaBRFieldState extends State<MoedaBRField> {
  late TextEditingController _priceEditingController;
  final currencyFormat = NumberFormat("#,##0.00", "pt_BR");

  @override
  void initState() {
    super.initState();
    _priceEditingController = TextEditingController();
    _priceEditingController.text = widget.initialValue;
  }

  @override
  void dispose() {
    _priceEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width, // Largura fixa de 50px
      height: widget.height,
      child: TextField(
        controller: _priceEditingController,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.right,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          TextInputFormatter.withFunction((oldValue, newValue) {
            final text = newValue.text;
            final selection = newValue.selection;
            if (text.isEmpty) {
              return TextEditingValue(text: '', selection: selection);
            } else if (text.length == 1) {
              final number = int.tryParse(text);
              if (number == null) {
                return oldValue;
              } else {
                final newText = '0.${number.toString()}';
                return TextEditingValue(
                  text: newText,
                  selection: TextSelection.collapsed(offset: newText.length),
                );
              }
            } else {
              final price = double.parse(text.replaceAll('.', '')) / 100;
              final newText = currencyFormat.format(price);
              // Fictitious function call for updating price
              // replace this with actual logic
              FFAppState().update(() {
                FFAppState().valorMeta = price;
              });
              final newSelectionIndex =
                  newText.length - (text.length - selection.end);
              return TextEditingValue(
                text: newText,
                selection: TextSelection.collapsed(offset: newSelectionIndex),
              );
            }
          })
        ],
        onChanged: (value) {},
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
        ),
        decoration: InputDecoration(
          prefixText: widget.labelText,
          prefixStyle: TextStyle(
            color: widget.labelTextColor,
          ),
          hintText: widget.labelText,
          hintStyle: TextStyle(
            color: Color.fromARGB(255, 105, 105, 105),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: BorderSide(
              color: widget.bordercolor,
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: BorderSide(
              color: widget.bordercolor,
              width: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}

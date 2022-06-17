import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool enabled;
  final double width;
  final Function(String)? onChanged;
  const AppTextField({
    Key? key,
    required this.controller,
    this.enabled = true,
    this.onChanged,
    this.width = double.infinity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 1.0, horizontal: 10.0),
          enabled: enabled,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10), gapPadding: 2),
          prefixIcon: enabled
              ? null
              : const Icon(
                  Icons.block,
                  color: Colors.red,
                ),
        ),
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'^[0-9]{0,4}')),
        ],
        onChanged: onChanged,
      ),
    );
  }
}

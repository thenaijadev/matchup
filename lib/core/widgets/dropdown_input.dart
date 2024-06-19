import 'package:flutter/material.dart';
import 'package:select_field/select_field.dart';

class DropDownInputField extends StatefulWidget {
  const DropDownInputField({
    super.key,
    required this.genderList,
    required this.label,
    required this.controller,
    required this.onChanged,
  });

  final List<dynamic> genderList;
  final String label;
  final TextEditingController controller;
  final Function(String)? onChanged;

  @override
  State<DropDownInputField> createState() => _DropDownInputFieldState();
}

class _DropDownInputFieldState extends State<DropDownInputField> {
  final border = const OutlineInputBorder(
    borderSide: BorderSide(
        color: Color.fromRGBO(0, 3, 7, 1),
        width: 1.0,
        style: BorderStyle.solid,
        strokeAlign: BorderSide.strokeAlignInside),
    borderRadius: BorderRadius.all(
      Radius.circular(12.0),
    ),
  );

  final SelectFieldMenuController<dynamic>? menuController =
      SelectFieldMenuController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 5,
        ),
        SelectField(
          textController: widget.controller,
          onTextChanged: widget.onChanged,
          menuDecoration: MenuDecoration(
            textStyle: TextStyle(
                decorationColor: Theme.of(context).colorScheme.secondary,
                color: Theme.of(context).colorScheme.secondary),
            backgroundDecoration: const BoxDecoration(
              color: Colors.white,
            ),
          ),
          inputDecoration: InputDecoration(
            fillColor: const Color.fromRGBO(237, 244, 252, 1),
            hintText: '',
            enabled: true,
            hintStyle:
                TextStyle(color: Theme.of(context).colorScheme.secondary),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 12.0),
            focusedBorder: border,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(width: 0.4)),
            filled: false,
          ),
          options: List.generate(
            widget.genderList.length,
            (index) => Option(
              label: widget.genderList[index],
              value: widget.genderList[index],
            ),
          ),
        ),
      ],
    );
  }
}

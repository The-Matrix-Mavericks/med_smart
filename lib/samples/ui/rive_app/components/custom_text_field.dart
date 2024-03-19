import 'package:flutter/material.dart';

class CustomTextFieldWithFieldName extends StatelessWidget {
  CustomTextFieldWithFieldName(
      {super.key, required this.textField, required this.fieldName});
  final TextField textField;
  final String fieldName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 3.0, bottom: 5),
            child: Text(
              fieldName,
              style: TextStyle(
                  color: Colors.grey[800],
                  fontWeight: FontWeight.w600,
                  fontSize: 18),
            ),
          ),
          Container(
            height: 45,
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 1,
                color: Colors.grey[400]!,
              ),
            ),
            child: textField,
          ),
        ],
      ),
    );
  }
}

class CustomTextField extends StatefulWidget {
  final String hint;
  final Color textColor;
  final Color borderColor;
  final Color inputColor;
  final TextEditingController? textController;
  const CustomTextField({
    super.key,
    required this.hint,
    this.textController,
    this.textColor = Colors.black,
    this.borderColor = Colors.black,
    this.inputColor = Colors.black,
  });
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: widget.inputColor),
      controller: widget.textController,
      cursorColor: Colors.blue,
      decoration: InputDecoration(
          isDense: true,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: widget.borderColor)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: widget.borderColor)),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: widget.borderColor)),
          hintText: widget.hint,
          hintStyle: TextStyle(color: widget.textColor)),
    );
  }
}

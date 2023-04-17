import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  final bool obscureText;
  final String hintText;
  const TextFieldWidget({
    Key? key,
    required this.title,
    required this.controller,
    required this.obscureText,
    required this.hintText,
  }) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late FocusNode focusNode;
  bool isInFocus = false;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();

    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          isInFocus = true;
        });
      } else {
        setState(() {
          isInFocus = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15, left: 15),
          child: Text(
            widget.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(boxShadow: [
            isInFocus
                ? BoxShadow(
                    color:
                        const Color.fromARGB(255, 0, 26, 255).withOpacity(0.4),
                    blurRadius: 8,
                    spreadRadius: 2,
                  )
                : BoxShadow(
                    color:
                        const Color.fromARGB(255, 61, 61, 61).withOpacity(0.2),
                    blurRadius: 8,
                    spreadRadius: 2,
                  )
          ]),
          child: TextFormField(
            focusNode: focusNode,
            obscureText: widget.obscureText,
            controller: widget.controller,
            maxLines: 1,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: widget.hintText,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none),
              // focusedBorder: const OutlineInputBorder(
              //   borderSide: BorderSide(
              //     color: Color.fromARGB(255, 81, 0, 255),
              //     width: 1,
              //   ),
              // ),
            ),
          ),
        )
      ],
    );
  }
}

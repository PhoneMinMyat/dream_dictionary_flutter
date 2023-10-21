import 'package:flutter/material.dart';

import 'package:dream_dictionary/constants/dimens.dart';

class DreamItem extends StatelessWidget {
  final String text;
  final Function onTap;
  final double? width;
  final double? height;
  final TextAlign? textAlign;
  const DreamItem({
    Key? key,
    required this.text,
    required this.onTap,
    this.width,
    this.height,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
            color: const Color(0xaa261447)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM, vertical: MARGIN_MEDIUM),
          child: Text(
            text,
            textAlign: textAlign ?? TextAlign.center,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

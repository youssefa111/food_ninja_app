import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

h({
  required BuildContext context,
}) {
  return MediaQuery.of(context).size.height;
}

w({
  required BuildContext context,
}) {
  return MediaQuery.of(context).size.width;
}

const mainColor = Color.fromRGBO(30, 197, 121, 1);

const secondaryColor = Color.fromRGBO(255, 173, 82, 0.2);

var thirdColor = HexColor('FF7C32');

import 'package:flutter/material.dart';

const kWeatherTextStyle = TextStyle(
    fontSize: 64.0, fontWeight: FontWeight.bold, fontFamily: "SpartanMB");

const kCommentTextStyle = TextStyle(
    fontSize: 48.0, fontWeight: FontWeight.bold, fontFamily: "SpartanMB");

const kInputStyle = InputDecoration(
  label: Text("give me the city name please"),
  labelStyle: TextStyle(
    color: Colors.white,
  ),
  filled: true,
  fillColor: Colors.black12,
  border: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent),
    borderRadius: BorderRadius.all(
      Radius.circular(12),
    ),
  ),
);
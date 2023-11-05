import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

bool checkBirthday(DateTime dob) {
  DateTime currentDate = DateTime.now();
  Duration ageDifference = currentDate.difference(dob);
  int years = (ageDifference.inDays / 365).floor();

  return years >= 13;
}

dynamic convertToJSON(String prompt) {
  // take the prompt and return a JSON with form [{"role": "user", "content": prompt}]
  return json.decode('{"role": "user", "content": "$prompt"}');
}

dynamic saveChatHistory(
  dynamic chatHistory,
  dynamic newChat,
) {
  // If chatHistory isn't a list, make it a list and then add newChat
  if (chatHistory is List) {
    chatHistory.add(newChat);
    return chatHistory;
  } else {
    return [newChat];
  }
}

bool strToBoolean(String str) {
  String lowerStr = str.toLowerCase();

  // Check if the lowercase string is equal to "yes"
  if (lowerStr == "yes") {
    return true;
  } else {
    return false;
  }
}

String jSONtoStr(dynamic file) {
  return json.encode(file);
}

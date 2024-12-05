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

double subtotalItem(
  int qty,
  double precio,
) {
  // Add your function code here!
  return qty * precio;
}

double subtotalGeneral(List<double> listaSubtotales) {
  // devolver el total de la suma de listasubtotales
  double value = 0.0;

  for (double val in listaSubtotales) {
    value += val;
  }

  return value;
}

double taxes(double amount) {
  // Add your function code here!
  return amount * 0.1;
}

double totalValue(double amount) {
  // Add your function code here!
  return amount + (amount * 0.1) + 2;
}

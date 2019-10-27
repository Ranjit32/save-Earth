import 'package:flutter/foundation.dart';
//it is just a blueprint and alternative for the map

class Transaction {
  final String id;
  final String title;

  final String about;
  final DateTime date;

  Transaction(
      {@required this.id,
      @required this.title,
      @required this.about,
      @required this.date});
}

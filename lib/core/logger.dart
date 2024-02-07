import 'dart:developer' as developer;
import 'package:intl/intl.dart';

class Logger {
  static void log(dynamic message, {String name = "log"}) {
    final date = DateTime.now();
    final formattedDate = DateFormat('yyyy/MM/dd - HH:mm:ss').format(date);
    developer.log('[$formattedDate] $message', name: name);
  }
}

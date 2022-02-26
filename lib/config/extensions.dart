import 'package:logger/logger.dart';
import 'dart:io' as io;

Logger _logger = Logger(
  printer: PrettyPrinter(
    colors: io.stdout.supportsAnsiEscapes ? true : false,
    printEmojis: true,
    printTime: true,
  ),
);

void logV(dynamic message, [dynamic error, StackTrace? stackTrace]) {
  _logger.v(message, error, stackTrace);
}

void logD(dynamic message, [dynamic error, StackTrace? stackTrace]) {
  _logger.d(message, error, stackTrace);
}

void logI(dynamic message, [dynamic error, StackTrace? stackTrace]) {
  _logger.i(message, error, stackTrace);
}

void logW(dynamic message, [dynamic error, StackTrace? stackTrace]) {
  _logger.w(message, error, stackTrace);
}

void logE(dynamic message, [dynamic error, StackTrace? stackTrace]) {
  _logger.e(message, error, stackTrace);
}

void logWtf(dynamic message, [dynamic error, StackTrace? stackTrace]) {
  _logger.wtf(message, error, stackTrace);
}

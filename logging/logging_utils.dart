import 'package:logging/logging.dart';

class LoggingUtils {
  static final _log = Logger('LoggingUtils');

  static void initialize() {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) => print('${record.level.name}: ${record.time}:\n${record.message}\n'));
  }

  static void info(Object? message, [Object? error, StackTrace? stackTrace]) {
    _log.info(message, error, stackTrace);
  }

  static void finest(Object? message, [Object? error, StackTrace? stackTrace]) {
    _log.finest(message, error, stackTrace);
  }

  static void finer(Object? message, [Object? error, StackTrace? stackTrace]) {
    _log.finer(message, error, stackTrace);
  }

  static void fine(Object? message, [Object? error, StackTrace? stackTrace]) {
    _log.fine(message, error, stackTrace);
  }

  static void config(Object? message, [Object? error, StackTrace? stackTrace]) {
    _log.config(message, error, stackTrace);
  }

  static void warning(Object? message, [Object? error, StackTrace? stackTrace]) {
    _log.warning(message, error, stackTrace);
  }

  static void severe(Object? message, [Object? error, StackTrace? stackTrace]) {
    _log.severe(message, error, stackTrace);
  }

  static void shout(Object? message, [Object? error, StackTrace? stackTrace]) {
    _log.shout(message, error, stackTrace);
  }
}

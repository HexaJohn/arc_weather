class Logger {
  Logger(String context) : _context = context;

  String _context;

  void info(Object? object) {
    // ignore: avoid_print
    print('${_context}: $object');
  }
}

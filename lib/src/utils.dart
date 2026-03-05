// ignore_for_file: prefer-match-file-name

class InvalidOperationError implements Exception {
  final String message;

  const InvalidOperationError(this.message);

  @override
  String toString() => 'InvalidOperationError: $message';
}

class ArgumentNullError implements Exception {
  final String message;

  const ArgumentNullError(this.message);

  @override
  String toString() => 'ArgumentNullError: Argument not found: $message';
}

enum MessageType { text, binary }

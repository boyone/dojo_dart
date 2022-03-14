import 'package:test/test.dart';

void main() {
  test('assert double and integer', () {
    expect(1000.00, 1000);
  });

  test('assert double and String', () {
    expect(1000.00.toString(), isNot(equals('1000.00')));
    expect(1000.00.toString(), equals('1000.0'));
  });

  test('assert double(with fraction digits) and String', () {
    expect(1000.00.toStringAsFixed(2), equals('1000.00'));
  });
}

// Ref: https://api.dart.dev/stable/2.16.1/dart-core/double-class.html
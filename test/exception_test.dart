import 'package:test/test.dart';

void main() {
  group('exception test with predefined matcher', () {
    test('exception', () {
      expect(() => exceptionFunc(), throwsException);
      expect(() => formatExceptionFunc(), throwsException);
    });

    test('unimplement error', () {
      expect(() => unimplementedFunc(), throwsUnimplementedError);
    });
  });

  group('exception test with no predefined matcher', () {
    test('format exception', () {
      expect(() => formatExceptionFunc(), throwsA(TypeMatcher<FormatException>()));
    });
  });
}

formatExceptionFunc() {
  throw FormatException();
}

unimplementedFunc() {
  throw UnimplementedError();
}

exceptionFunc() {
  throw Exception();
}

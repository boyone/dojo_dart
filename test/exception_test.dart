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
      expect(
          () => formatExceptionFunc(), throwsA(TypeMatcher<FormatException>()));
    });
  });

  group('try / on / catch', () {
    test('specific exception', () async {
      try {
        await formatExceptionFunc();
      } on FormatException catch (e) {
        expect(e, isA<FormatException>());
      }
    });

    test('unknown exception', () {
      try {
        exceptionFunc();
      } on Exception catch (e) {
        expect(e, isA<Exception>());
      }
    });

    test('really unknown exception', () {
      try {
        reallyUnknownException();
      } catch (e) {
        expect(e, 'unknown error');
      }
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

reallyUnknownException() {
  throw 'unknown error';
}
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
    test('expect format exception', () {
      expect(
          () => formatExceptionFunc(), throwsA(TypeMatcher<FormatException>()));

      expect(() => formatExceptionFunc(), throwsA(isA<FormatException>()));
    });

    test('expect format exception with predicate Matcher', () {
      expect(
          () => formatExceptionFunc(),
          throwsA(predicate(
            (FormatException e) {
              return e.message == 'unknown format';
            },
            'FormatException with message',
          )));
    });

    test('expect format exception with allOf Matcher', () {
      expect(
        () => formatExceptionFunc(),
        throwsA(
          allOf(
            isFormatException,
            predicate(
              (FormatException e) {
                return e.message == 'unknown format';
              },
              'assert message',
            ),
          ),
        ),
      );
    });

    test('expect format exception with having', () {
      expect(
        () => formatExceptionFunc(),
        throwsA(
          isA<FormatException>().having(
            (e) => e.message,
            'assert message',
            'unknown format',
          ),
        ),
      );
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
  throw FormatException('unknown format');
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

// https://api.flutter.dev/flutter/package-test_api_expect/throwsA.html
// https://api.flutter.dev/flutter/package-matcher_matcher/TypeMatcher-class.html
// https://api.flutter.dev/flutter/package-matcher_matcher/TypeMatcher/having.html
// https://api.flutter.dev/flutter/package-matcher_matcher/predicate.html

// https://stackoverflow.com/questions/13298969/how-do-you-unittest-exceptions-in-dart
// https://www.technicalfeeder.com/2021/09/flutter-how-to-write-unit-test-for-thrown-exception/
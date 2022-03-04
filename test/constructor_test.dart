import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('class-name constructors', () {
    MyNumber firstInstance = MyNumber(0);
    MyNumber secondInstance = MyNumber(0);

    expect(firstInstance, isNot(equals(secondInstance)));

    expect(firstInstance.x, secondInstance.x);
  });

  test('constant constructors', () {
    MyNumber firstInstance = const MyNumber(0);
    MyNumber secondInstance = const MyNumber(0);

    expect(firstInstance, secondInstance);
    // print('The type of a is ${firstInstance.runtimeType}');
  });

  test('constant constructors and class-name constructors', () {
    MyNumber firstInstance = const MyNumber(0);
    MyNumber secondInstance = MyNumber(0);

    expect(firstInstance, isNot(equals(secondInstance)));
  });

  test('class-identifier constructors', () {
    MyNumber firstInstance = MyNumber.fromJson({'x': 1});
    MyNumber secondInstance = MyNumber.fromJson({'x': 1});

    expect(firstInstance, isNot(equals(secondInstance)));

    expect(firstInstance.x, secondInstance.x);
    expect(firstInstance.x, 1);
  });

  test('named constructors', () {
    MyNumber instance = MyNumber.defaultInstance();
    expect(instance.x, 0);
  });

  test('factory constructors', () {
    var logger = Logger('UI');

    var logMap = {'name': 'UI'};
    var loggerJson = Logger.fromJson(logMap);

    expect(logger, loggerJson);
    expect(logger.name, loggerJson.name);

    var secondLogger = Logger('API');
    expect(secondLogger.name, 'API');
    expect(logger, isNot(equals(secondLogger)));
  });
}

class MyNumber {
  final int x;

  // static const MyNumber origin = MyNumber(1);

  const MyNumber(this.x);

  const MyNumber.defaultInstance() : x = 0;

  MyNumber.fromJson(Map<String, int> json) : x = json['x']!;
}

class Logger {
  final String name;
  bool mute = false;

  // _cache is library-private, thanks to
  // the _ in front of its name.
  static final Map<String, Logger> _cache = <String, Logger>{};

  factory Logger(String name) {
    print('factory');
    return _cache.putIfAbsent(name, () => Logger._internal(name));
  }

  factory Logger.fromJson(Map<String, Object> json) {
    print('fromJson');
    return Logger(json['name'].toString());
  }

  Logger._internal(this.name) {
    print('internal');
  }

  void log(String msg) {
    if (!mute) print(msg);
  }
}

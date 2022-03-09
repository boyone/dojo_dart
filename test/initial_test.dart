import 'package:test/scaffolding.dart';
import 'package:test/test.dart';

void main() {
  test('initial test', (){
    expect(Hello('boyone').greeting, 'Hello, boyone');
    expect(Hola().greeting, 'Hola, boytwo');
    expect(Hola(name: 'boyone').greeting, 'Hola, boyone');
  });
}

class Hello {
  final String name;

  Hello(this.name);

  String get greeting => 'Hello, $name';
}

class Hola {
  String? name;

  Hola({String? name}) : name = name ?? 'boytwo';

  String get greeting => 'Hola, ${name ?? 'World'}';
}
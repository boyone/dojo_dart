A simple command-line application.

```dart
void main(List<String> arguments) {
  print('Hello world!');

  print(Hello('boyone').greeting);
  print(Hola().greeting);
  print(Hola(name: 'boyone').greeting);
}

class Hello {
  final String name;

  Hello(this.name);

  String get greeting => 'Hello, $name';
}

class Hola {
  String? name;

  Hola({String? name}) : name = name ?? 'boytwo';

  String get greeting => 'Hello, ${name ?? 'World'}';
}

```

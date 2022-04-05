import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'mockito_test.mocks.dart';

@GenerateMocks([Cat])
void main() {
  group('mockito', () {
    test('verify mock', () {
      var cat = MockCat();
      when(cat.sound()).thenReturn("Meow");

      cat.sound();

      verify(cat.sound());
    });

    test('expect stub', () {
      var cat = MockCat();
      when(cat.sound()).thenReturn("Bark");

      expect(cat.sound(), 'Bark');
    });

    test('verify Future<void>', () async {
      var cat = MockCat();

      await cat.chew();
      await cat.chew();

      verify(cat.chew()).called(2);
    });

    test('resetting stubs', () {
      var cat = MockCat();
      when(cat.eatFood("Fish")).thenReturn(true);
      cat.eatFood("Fish");

      reset(cat);

      when(cat.eatFood(any)).thenReturn(false);
      expect(cat.eatFood("Fish"), false);
    });
  });
}

// Real class
class Cat {
  String sound() => "Meow";
  bool eatFood(String food, {bool? hungry}) => true;
  Future<void> chew() async => print("Chewing...");
  int walk(List<String> places) => 7;
  void sleep() {}
  void hunt(String place, String prey) {}
  int lives = 9;
}

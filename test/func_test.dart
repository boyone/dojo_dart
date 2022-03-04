import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('pass function', () {
    var keeper = Keeper(10);
    var teller = Teller(keeper.subtract);

    teller.receive(5);

    expect(keeper.remainder, 5);
  });
}

class Teller {
  void Function(int) subtract;
  Teller(this.subtract);

  void receive(int amount) {
    subtract(amount);
  }
}

class Keeper {
  int initial;
  Keeper(this.initial);

  get remainder => initial;

  void subtract(int amount) {
    initial -= amount;
  }
}

import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('collection literals', () {
    var names = <String>['Seth', 'Kathy', 'Lars'];
    var uniqueNames = <String>{'Seth', 'Kathy', 'Lars'};
    var pages = <String, String>{
      'index.html': 'Homepage',
      'robots.txt': 'Hints for web robots',
      'humans.txt': 'We are people, not machines'
    };

    expect(names, isList);
    expect(uniqueNames, isA<Set>());
    expect(pages, isMap);
  });
}

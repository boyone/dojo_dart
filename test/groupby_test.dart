import 'package:test/scaffolding.dart';
import "package:collection/collection.dart";

main() {
  test('groupBy', () {
    var data = [
      {"title": 'Avengers', "release_date": '10/01/2019'},
      {"title": 'Creed', "release_date": '10/01/2019'},
      {"title": 'Jumanji', "release_date": '30/10/2019'},
    ];

    var newMap = groupBy(data, (Map obj) => obj['release_date']);

    print(newMap);
  });
}

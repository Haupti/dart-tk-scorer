import 'package:test/test.dart';


void main() {
  test('regex matches stuff with string', () {
    
    RegExp exp = RegExp(r'(?<=new-player-name=).*');
    RegExpMatch? match = exp.firstMatch("new-player-name=aaaaaa asdf");
    expect(match![0], "aaaaaa asdf");
  });
  test('regex matches empty string', () {
    
    RegExp exp = RegExp(r'(?<=new-player-name=).*');
    RegExpMatch? match = exp.firstMatch("");
    expect(match?[0], null);
  });

  test('regex matches empty string', () {
    
    RegExp exp = RegExp(r'(?<=new-player-name=)[a-zA-Z0-9_-]+(.*[a-zA-Z0-9_-]+)?');
    RegExpMatch? match = exp.firstMatch("new-player-name=a ");
    expect(match?[0], "a");
  });

  test('generic regex', () {
    RegExp exp = RegExp(r'(?<==)[a-zA-Z0-9_-]+$');
    RegExpMatch? match = exp.firstMatch("new-player-name=a13a ");
    expect(match?[0], null);
  });
}

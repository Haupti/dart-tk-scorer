import 'package:ftk/page/addmatch/add_match_dto.dart';
import 'package:test/test.dart';


void main() {
  test('parses empty form data without error', () {
    AddMatchFormDataDto result = AddMatchFormDataDto.fromFormData("");
    expect(result.t1p1Id, null);
    expect(result.t1p2Id, null);
    expect(result.t2p1Id, null);
    expect(result.t2p2Id, null);
    expect(result.winner, null);
  });
  test('parses form data with one val', () {
    AddMatchFormDataDto result = AddMatchFormDataDto.fromFormData("t1p1Select=aaaaa");
    expect(result.t1p1Id, "aaaaa");
    expect(result.t1p2Id, null);
    expect(result.t2p1Id, null);
    expect(result.t2p2Id, null);
    expect(result.winner, null);
  });
  test('parses full form data', () {
    AddMatchFormDataDto result = AddMatchFormDataDto.fromFormData("t1p1Select=aaaaa&t1p2Select=123&t2p1Select=9a&t2p2Select=yoo&winner=team2");
    expect(result.t1p1Id, "aaaaa");
    expect(result.t1p2Id, "123");
    expect(result.t2p1Id, "9a");
    expect(result.t2p2Id, "yoo");
    expect(result.winner, "team2");
  });
}

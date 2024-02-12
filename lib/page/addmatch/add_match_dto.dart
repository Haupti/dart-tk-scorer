
import 'package:ftk/page/form_util/form_util.dart';

class AddMatchFormDataDto{
  String? t1p1Id;
  String? t1p2Id;
  String? t2p1Id;
  String? t2p2Id;
  String? winner;
  AddMatchFormDataDto(this.t1p1Id, this.t1p2Id, this.t2p1Id, this.t2p2Id, this.winner);

  static AddMatchFormDataDto fromFormData(String formData){
    Map<String, String> fd = parseFormData(formData);
    return AddMatchFormDataDto(
      fd["t1p1Select"],
      fd["t1p2Select"],
      fd["t2p1Select"],
      fd["t2p2Select"],
      fd["winner"]
    );
  }
}

Map<String, String> parseFormData(String formData){
  List<String> vs = formData.split(r'&');

  Map<String, String> result = {};
  for(String v in vs){
      List<String> keyValPair = v.split(r'=');
      if(keyValPair.length == 2){
        result[keyValPair[0]] = keyValPair[1];
      }
  }
  return result;
}
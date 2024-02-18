import 'dart:io';

import 'package:ftk/dataprovider/datapath_provider.dart';

File? getResourceFile(String filepath) {
  File file = File("${appdataPath()}/resources/$filepath");
  if(file.existsSync()){
    return file;
  } else {
    return null;
  }
}
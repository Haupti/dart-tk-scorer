import 'dart:io';

String appdataPath(){
  String? path = Platform.environment["APPDATADIR_FTK"];
  if(path == null){
    throw Exception("environment variable 'APPDATADIR_FTK' not set!");
  } else {
    return path;
  }
}
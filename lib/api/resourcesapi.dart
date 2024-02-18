import 'dart:io';
import 'package:ssr/ssr.dart' as ssr;

ssr.RequestHandler resourcesApi() {
  return ssr.RequestHandler(
      path: "/api/resources",
      method: ssr.RequestMethod.mGet,
      handler: (ssr.SsrRequest request, ssr.SsrResponse response) {
        String? filename = request.queryParams['filename'];
        String? contentType = toContentType(filename);
        File file = File("lib/resources/$filename");
        if(contentType != null && filename != null && file.existsSync()){
          ssr.okFileResponse(response, file, ContentType.parse(contentType));
        } else if(contentType == null && filename != null && file.existsSync()){
          ssr.okFileResponse(response , file, null);
        } else {
          ssr.clientErrorResponse(response);
        }
      }).setMinimumRole(ssr.AuthRole.basic);
}

final Map<String, String> fileEndingContentTypeMap  = {
  "txt": "text/plain",
  "png": "img/png",
  "jpg": "img/jpg",
  "html": "text/html"
};

String? toContentType(String? fullfilename) {
  if(fullfilename == null){
    return null;
  }
  List<String> parts = fullfilename.split(".");
  if(parts.length == 2){
    return fileEndingContentTypeMap[parts[1]];
  }
  else { 
    return null;
  }
}
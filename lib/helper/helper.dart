import 'dart:convert';
import 'dart:io';

Map configApps = {
  'VERSION': 1,
  'BUILD_VERSION': "0.0.1",
  'OSNAME': Platform.isAndroid ? "a" : "i",
  'URL_SERVICE': 'https://reqres.in/api'
};

apiHttpConfig(Map<String, dynamic> postdata, functionName, tokenHeader,
    {method = "post"}) async {
  String reply;

  HttpClient client = new HttpClient();
  client.userAgent = "Flutter_";
  HttpClientRequest request;
  if (method == "post") {
    request = await client
        .postUrl(Uri.parse(configApps['URL_SERVICE'] + "/" + functionName));
    request.headers.set('content-type', 'application/json');
    if (tokenHeader != "")
      request.headers.set('Authorization', 'Bearer $tokenHeader');
    request.add(utf8.encode(json.encode(postdata)));
  } else if (method == "patch") {
    request = await client
        .patchUrl(Uri.parse(configApps['URL_SERVICE'] + "/" + functionName));
    request.headers.set('content-type', 'application/json');
    if (tokenHeader != "")
      request.headers.set('Authorization', 'Bearer $tokenHeader');
    request.add(utf8.encode(json.encode(postdata)));
  } else {
    request = await client
        .getUrl(Uri.parse(configApps['URL_SERVICE'] + "/" + functionName));
    request.headers.set('content-type', 'application/json');
    if (tokenHeader != "")
      request.headers.set('Authorization', 'Bearer $tokenHeader');
  }
  print("full url " + configApps['URL_SERVICE'] + "/" + functionName);
  print(request.headers);
  HttpClientResponse response = await request.close();
  reply = await response.transform(utf8.decoder).join();
  print(functionName + " " + json.encode(postdata));
  print(functionName + " " + reply.toString());
  return reply;
}

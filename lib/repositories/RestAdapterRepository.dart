import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class RestAdapterRepository {
  static const BASE_URL = "https://jsonplaceholder.typicode.com/";

  Future<Object> executeGET(
      String endPoint, Map<String, dynamic> paramsMaps) async {
    Uri uri = Uri.parse(BASE_URL + endPoint);
    var newURI;
    if (paramsMaps == null) {
      newURI = uri;
    } else {
      newURI = uri.replace(queryParameters: paramsMaps);
    }
    final response = await http.get(newURI);
    return response;
  }

  Future<Object> executePOST(
      String endPoint, Map<String, dynamic> paramsMaps) async {
    Uri uri = Uri.parse(BASE_URL + endPoint);
    Map<String, String> headers = {
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded"
    };
    //String jsonBody = json.encode(paramsMaps);
    /*
    * Uncomment above line to send post parameter through raw 
    * 
    * */

    var encoding = Encoding.getByName('utf-8');
    var response = await http.post(uri,
        headers: headers, body: paramsMaps, encoding: encoding);
    return response;
  }

  Future<File> downloadFile(String url, String fileName) async {
    http.Client client = new http.Client();
    var request = await client.get(Uri.parse(url));
    var bytes = request.bodyBytes;
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = new File('$dir/$fileName');
    await file.writeAsBytes(bytes);
    return file;
  }
}

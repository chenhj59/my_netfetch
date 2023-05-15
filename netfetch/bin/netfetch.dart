import 'package:netfetch/netfetch.dart' as netfetch;
import 'package:http/http.dart' as http;

void main(List<String> arguments) {
  Make_network_request();
}

void Make_network_request() async {
  final httpPackageUrl = Uri.http('raw.githubusercontent.com',
      '/chenhj59/my_netfetch/main/netfetch/bin/test.json');
  final httpPackageInfo = await http.read(httpPackageUrl);
  print(httpPackageInfo);

  /*The following snippet uses get to get the whole response in order to exit early if the request was not successful,
   which is indicated with a status code of 200
   */
  final httpPackageResponse = await http.get(httpPackageUrl,
  headers:{'User-Agent': '<product name>/<prodect-version>'});
  if (httpPackageResponse.statusCode != 200) {
    print('Failed to retrieve the http package!');
    return;
  }
  print(httpPackageResponse);
  print(httpPackageResponse.body);
}

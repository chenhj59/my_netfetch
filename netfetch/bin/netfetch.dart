import 'package:netfetch/netfetch.dart' as netfetch;
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

void main(List<String> arguments) {
  Make_network_request();
  Make_multiple_requests();
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
      headers: {'User-Agent': '<product name>/<prodect-version>'});
  if (httpPackageResponse.statusCode != 200) {
    print('Failed to retrieve the http package!');
    return;
  }
  print(httpPackageResponse);
  print(httpPackageResponse.body);
}

void Make_multiple_requests() async {
  /*If you’re making multiple requests to the same server, 
  you can instead keep a persistent connection through a Client, 
  which has similar methods to the top-level ones. 
  Just make sure to clean up with the close method when done
   */
  final httpPackageUrl = Uri.https('raw.githubusercontent.com',
      '/chenhj59/my_netfetch/main/netfetch/bin/test.json');
  final client = RetryClient(http.Client()); //保持长时间连接,RetryClient:当链接断开，重新连接
  try {
    final httpPackageInfo = await client.read(httpPackageUrl);
    print(httpPackageInfo);
  } finally {
    client.close();
  }

}

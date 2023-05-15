import 'package:netfetch/netfetch.dart' as netfetch;
import 'package:http/http.dart' as http;

void main(List<String> arguments) {
  Make_network_request();
}

void Make_network_request() async {
  final httpPackageUrl = Uri.http('dart.dev', '/f/packages/http.json');
  final httpPackageInfo = await http.read(httpPackageUrl);
  print(httpPackageInfo);
}

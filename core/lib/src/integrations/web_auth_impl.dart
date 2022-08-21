import 'package:core/src/abstractions/web_auth.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';

class WebAuthImpl implements WebAuth {
  final String _clientId;
  final String _redirectUri;
  final String _callbackScheme;
  WebAuthImpl({
    required String clientId,
    required String redirectUri,
    required String callbackScheme,
  })  : _clientId = clientId,
        _redirectUri = redirectUri,
        _callbackScheme = callbackScheme;

  @override
  Future<Uri> authenticate() async {
    String urlDireccion =
        'https://accounts.spotify.com/authorize?response_type=token&client_id=$_clientId&redirect_uri=$_redirectUri';
    final response = await FlutterWebAuth.authenticate(
        url: urlDireccion, callbackUrlScheme: _callbackScheme);

    final data = Uri.parse(response);

    return Future.value(data);
  }
}

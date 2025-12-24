import 'dart:io';
import 'package:astro_dart/route_handler.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_hotreload/shelf_hotreload.dart';

// Configure routes.

void main(List<String> args) async {
  const isDev = bool.fromEnvironment('dart.vm.product') == false;

  if (isDev) {
    // dev server with hot reload
    withHotreload(() => createServer());
  } else {
    // production server
    await createServer();
  }
}

Future<HttpServer> createServer() async {
  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;

  // Configure a pipeline that logs requests.
  final handler = Pipeline()
      .addMiddleware(logRequests())
      .addHandler(routers.call);

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(handler, ip, port);
  print('Server listening on port http://localhost:${server.port}');
  return server;
}

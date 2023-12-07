import 'dart:io';
import 'dart:convert';
import 'medal.dart';
import 'package:http/http.dart' as http;
import 'package:image/image.dart';

Future<dynamic> responseToMedalsRequest() async {
  final response = await http.get(
    Uri.parse(
        'https://grunt.api.dotapi.gg/games/halo-infinite/metadata/multiplayer/medals'),
    // Send authorization headers to the backend.
    headers: {
      HttpHeaders.authorizationHeader:
          Platform.environment['gruntapi'].toString(),
    },
  );

  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed to load medals with error: ${response.statusCode}');
  }
}

Future<String> createDirectory() async {
  var username =
      Platform.environment['USERNAME'] ?? Platform.environment['USER'];

  if (username == null) {
    throw Exception('Username not found in environment variables');
  }

  var directory =
      Directory('C:/Users/$username/Documents/HaloInfinite/medals/');

  if (await directory.exists()) {
    print('Directory already exists: 📁 $directory');
  } else {
    await directory.create(recursive: true);
    print('Directory created: 📁 $directory');
  }
  return directory.path;
}

Future<void> downloadImage(String url, String path, String filename) async {
  var response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final file = File(path + filename);

    if (await file.exists()) {
      print('Medal already downloaded: $filename ❌');
    } else {
      file.writeAsBytes(response.bodyBytes);
      print('Medal downloaded: $filename ✅');
    }
  } else {
    print('Medal Failed to download: ${response.statusCode}');
  }
}

List<Medal> parseMedals(String responseBody) {
  final parsed = jsonDecode(responseBody)['data'];

  return parsed.map<Medal>((json) => Medal.fromJson(json)).toList();
}

void startDownloadImages() async {
  final path = await createDirectory();
  final body = await responseToMedalsRequest();

  print('');

  var medals = parseMedals(body);
  for (var medal in medals) {
    await downloadImage(medal.large, path, medal.getFilename());
  }
}

void startConcatenateImages({int start = 0, int end = 0}) async {
  var username =
      Platform.environment['USERNAME'] ?? Platform.environment['USER'];

  var directory =
      Directory('C:/Users/$username/Documents/HaloInfinite/medals/');

  List<File> files =
      directory.listSync().map((file) => File(file.path)).toList();

  List<Image>? images = files
      .getRange(start, end)
      .map((e) => decodePng(e.readAsBytesSync()))
      .cast<Image>()
      .toList();

  if (images.isNotEmpty) {
    Image newImage = Image(
      width: images[0].width * images.length,
      height: images[0].height,
      numChannels: 4,
      backgroundColor: ColorRgba8(0, 0, 0, 0),
    );

    for (var img in images) {
      newImage = compositeImage(
        newImage,
        img,
        dstX: images.indexOf(img) * img.width,
        dstY: 0,
        blend: BlendMode.difference,
      );
    }

    File('C:/Users/$username/Documents/HaloInfinite/imageBonus.png')
        .writeAsBytes(encodePng(newImage));
  } else {
    print("Une ou plusieurs images n'ont pas pu être chargées.");
  }
}

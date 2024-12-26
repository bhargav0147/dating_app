
import 'dart:convert';
import 'dart:io';
import 'package:dating_app/app/config/app_variables.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = AppVariables.APIBASEURL;


  // POST API Without Token Provide

  Future<dynamic> postWithoutToken(
      String endpoint, Map<String, dynamic> body) async {
    final uri = Uri.parse(baseUrl + endpoint);
    try {
      final response = await http.post(uri,
          headers: {"Content-Type": "application/x-www-form-urlencoded"},
          body: body);
      return {
        'statusCode': response.statusCode,
        'data': json.decode(response.body),
      };
    } catch (e) {
      return {
        'statusCode': 500,
        'data': {'error': 'An error occurred: $e'},
      };
    }
  }

  // POST API With Token Provide

  Future<dynamic> postWithToken(
      String endpoint, Map<String, dynamic> body, String token) async {
    final uri = Uri.parse(baseUrl + endpoint);
    try {
      final response = await http.post(
        uri,
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
          "Authorization": "Bearer $token",
        },
        body: body,
      );

      return {
        'statusCode': response.statusCode,
        'data': json.decode(response.body),
      };
    } catch (e) {
      return {
        'statusCode': 500,
        'data': {'error': 'An error occurred: $e'},
      };
    }
  }

  // POST API With Token Provide

  Future<dynamic> getWithToken(
      String endpoint,String token) async {
    final uri = Uri.parse(baseUrl + endpoint);
    try {
      final response = await http.get(
        uri,
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
          "Authorization": "Bearer $token",
        },
      );

      return {
        'statusCode': response.statusCode,
        'data': json.decode(response.body),
      };
    } catch (e) {
      return {
        'statusCode': 500,
        'data': {'error': 'An error occurred: $e'},
      };
    }
  }

//   Future<dynamic> postWithoutTokenStatus(
//       String endpoint, Map<String, dynamic> body) async {
//     final uri = Uri.parse(baseUrl + endpoint);
//     final headers = {
//       'Content-Type': 'application/json',
//     };
//     final response =
//     await http.post(uri, headers: headers, body: jsonEncode(body));
//
//     final data = jsonDecode(response.body);
//
//     if (response.statusCode == 200 || response.statusCode == 201) {
//       return {"statusCode": response.statusCode, "data": data};
//     } else {
//       return {"statusCode": response.statusCode, "data": data};
//     }
//   }
//
//   // Get API With Token Provide
//
//   Future<dynamic> getWithToken(String endpoint, String token) async {
//     final uri = Uri.parse(baseUrl + endpoint);
//     final headers = {
//       'Content-Type': 'application/json',
//       'Authorization': 'Bearer $token'
//     };
//
//     final response = await http.get(uri, headers: headers);
//
//     if (response.statusCode == 200 || response.statusCode == 201) {
//       return jsonDecode(response.body);
//     } else {
//       throw jsonDecode(response.body);
//     }
//   }
//
//   // PATCH API With Token Provide
//
//   Future<dynamic> patchWithToken(
//       String endpoint, Map<String, dynamic> body, String token) async {
//     final uri = Uri.parse(baseUrl + endpoint);
//     final headers = {
//       'Content-Type': 'application/json',
//       'Authorization': 'Bearer $token'
//     };
//     final response =
//     await http.patch(uri, headers: headers, body: jsonEncode(body));
//
//     if (response.statusCode == 200 || response.statusCode == 201) {
//       return jsonDecode(response.body);
//     } else {
//       throw jsonDecode(response.body);
//     }
//   }
//

//   // POST Method With MultiPart

  Future<dynamic> postMultiPartWithToken({
    required String endpoint,
    required Map<String, dynamic> data,
    required dynamic mainImage,
    required List<dynamic> profilePictures,
    required String token,
  }) async {
    final uri = Uri.parse('$baseUrl/upload-profile');
    var request = http.MultipartRequest('POST', uri);

    request.headers['Content-Type'] = 'multipart/form-data';
    request.headers['Authorization'] = 'Bearer $token';

    // Add form data
    data.forEach((key, value) {
      request.fields[key] = value.toString();
    });

    // Add main image
    if (mainImage != null) {
      request.files.add(await fileToMultipartFile(mainImage, 'mainImage'));
    }

    // Add profile pictures
    for (var i = 0; i < profilePictures.length; i++) {
      request.files.add(
        await fileToMultipartFile(profilePictures[i], 'profilePictures[$i]'),
      );
    }

    try {
      final response = await request.send();
      final responseBody = await response.stream.bytesToString();

      return {
        'statusCode': response.statusCode,
        'data': json.decode(responseBody),
      };
    } catch (e) {
      return {
        'statusCode': 500,
        'data': {'error': 'An error occurred: $e'},
      };
    }
  }

  Future<http.MultipartFile> fileToMultipartFile(
      dynamic file, String fieldName) async {
    if (file is File) {
      return await http.MultipartFile.fromPath(fieldName, file.path);
    } else if (file is Uint8List) {
      return http.MultipartFile.fromBytes(fieldName, file,
          filename: '$fieldName.jpg');
    } else {
      throw Exception('Unsupported file type');
    }
  }

}


import 'dart:convert';
import 'package:dating_app/app/config/app_variables.dart';
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

  Future<dynamic> postMultiPartWithToken(
      String endpoint,
      Map<String, dynamic> data,
      List<http.MultipartFile> imageList,
      String token) async {
    final uri = Uri.parse(baseUrl + endpoint);

    var request = http.MultipartRequest('POST', uri);
    request.headers['Content-Type'] = 'multipart/form-data';
    request.headers['Authorization'] = 'Bearer $token';

    data.forEach((key, value) {
      if (value is String) {
        request.fields[key] = value;
      } else if (value is double || value is int) {
        request.fields[key] = value.toString();
      } else if (value is bool) {
        request.fields[key] = value ? 'true' : 'false';
      } else if (value is List || value is Map) {
        request.fields[key] = jsonEncode(value);
      } else {
        request.fields[key] = value.toString();
      }
    });

    request.files.addAll(imageList);

    try {
      final response = await request.send();

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseBody = await response.stream.bytesToString();
        return jsonDecode(responseBody);
      } else {
        final errorBody = await response.stream.bytesToString();

        throw Exception('Failed to upload images: $errorBody');
      }
    } catch (e) {
      throw Exception('Failed to upload images: $e');
    }
  }
//
//   // DELETE API With Token Provide
//
//   Future<dynamic> deleteWithToken(String endpoint, String token) async {
//     final uri = Uri.parse(baseUrl + endpoint);
//     final headers = {
//       'Content-Type': 'application/json',
//       'Authorization': 'Bearer $token'
//     };
//
//     final response = await http.delete(uri, headers: headers);
//
//     if (response.statusCode == 200 || response.statusCode == 201) {
//       return jsonDecode(response.body);
//     } else {
//       throw jsonDecode(response.body);
//     }
//   }
//
//   Future<dynamic> postWithToken(
//       String endpoint, Map<String, dynamic> body, String token) async {
//     final uri = Uri.parse(baseUrl + endpoint);
//     final headers = {
//       'Content-Type': 'application/json',
//       'Authorization': 'Bearer $token'
//     };
//     final response =
//     await http.post(uri, headers: headers, body: jsonEncode(body));
//
//     if (response.statusCode == 200 || response.statusCode == 201) {
//       return jsonDecode(response.body);
//     } else {
//       throw jsonDecode(response.body);
//     }
//   }
//
//   // Update Profile With Image
//
//   Future<dynamic> updateProfileWithImageCall(
//       {required String endpoint,
//         required String firstName,
//         required String lastName,
//         required String token,
//         File? image}) async {
//     final uri = Uri.parse(baseUrl + endpoint);
//
//     final headers = {
//       'Content-Type': 'multipart/form-data',
//       'Authorization': 'Bearer $token'
//     };
//
//     var request = http.MultipartRequest('PATCH', uri);
//     request.headers.addAll(headers);
//     request.fields['firstName'] = firstName;
//     request.fields['lastName'] = lastName;
//
//     if (image != null) {
//       List<int> imageBytes = await image.readAsBytes();
//       var multipartFile = http.MultipartFile.fromBytes(
//         'profileImage',
//         imageBytes,
//         filename: path.basename(image.path),
//         contentType: MediaType('image', 'jpeg'),
//       );
//       request.files.add(multipartFile);
//     }
//
//     try {
//       final response = await request.send();
//       final responseBody =
//       await response.stream.transform(utf8.decoder).join('');
//       return jsonDecode(responseBody);
//     } on Exception catch (err) {
//       return {"error": err.toString()};
//     }
//   }
//
//   // PATCH with image upload for edit box
//
//   Future<dynamic> putMultiPartWithToken(
//       String endpoint,
//       Map<String, dynamic> data,
//       List<http.MultipartFile> imageList,
//       String token) async {
//     final uri = Uri.parse(baseUrl + endpoint);
//
//     var request = http.MultipartRequest('PUT', uri);
//     request.headers['Content-Type'] = 'multipart/form-data';
//     request.headers['Authorization'] = 'Bearer $token';
//
//     data.forEach((key, value) {
//       if (value is String) {
//         request.fields[key] = value;
//       } else if (value is double || value is int) {
//         request.fields[key] = value.toString();
//       } else if (value is bool) {
//         request.fields[key] = value ? 'true' : 'false';
//       } else if (value is List || value is Map) {
//         request.fields[key] = jsonEncode(value);
//       } else {
//         request.fields[key] = value.toString();
//       }
//     });
//
//     if (imageList.isNotEmpty) {
//       request.files.addAll(imageList);
//     }
//
//     try {
//       final response = await request.send();
//
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         final responseBody = await response.stream.bytesToString();
//         return jsonDecode(responseBody);
//       } else {
//         final errorBody = await response.stream.bytesToString();
//         throw Exception('Failed to upload images: $errorBody');
//       }
//     } catch (e) {
//       throw Exception('Failed to upload images: $e');
//     }
//   }
//
// // Get API With Token Provide
//
//   Future<dynamic> getWithTokenStatus(String endpoint, String token) async {
//     final uri = Uri.parse(baseUrl + endpoint);
//     final headers = {
//       'Content-Type': 'application/json',
//       'Authorization': 'Bearer $token'
//     };
//
//     final response = await http.get(uri, headers: headers);
//
//     if (response.statusCode == 200 || response.statusCode == 201) {
//       final responseBody = jsonDecode(response.body);
//
//       return {"statusCode": response.statusCode, "data": responseBody};
//     } else {
//       final responseBody = jsonDecode(response.body);
//       throw {"statusCode": response.statusCode, "data": responseBody};
//     }
//   }
//
//   // POST API WITH STATUS
//
//   Future<dynamic> postWithTokenStatus(
//       {required String endpoint,
//         required String token,
//         required Map<String, dynamic> body}) async {
//     final uri = Uri.parse(baseUrl + endpoint);
//     final headers = {
//       'Content-Type': 'application/json',
//       'Authorization': 'Bearer $token'
//     };
//
//     final response =
//     await http.post(uri, headers: headers, body: jsonEncode(body));
//
//     if (response.statusCode == 200 || response.statusCode == 201) {
//       final responseBody = jsonDecode(response.body);
//
//       return {"statusCode": response.statusCode, "data": responseBody};
//     } else {
//       final responseBody = jsonDecode(response.body);
//       throw {"statusCode": response.statusCode, "data": responseBody};
//     }
//   }
}

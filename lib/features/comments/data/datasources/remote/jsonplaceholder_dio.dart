// import 'package:dio/dio.dart';

// class CafeApi {
//   static Dio _dio = Dio();

//   static void configureDio() {
//     //Base url
//     _dio.options.baseUrl = "https://jsonplaceholder.typicode.com";

//     _dio.options.headers = {};
//     _dio.interceptors.add(InterceptorsWrapper(
//       onError: (e, handler) {
//         switch (e.type) {
//           case DioErrorType.response:
//             print(e.message);
//             throw ("Error en el POST");
//             break;
//           case DioErrorType.connectTimeout:
//             print(e.message);
//             throw ("Error en el POST");
//             break;
//           case DioErrorType.other:
//             print(e.message);
//             throw ("Error en el POST");
//             break;
//           default:
//         }
//       },
//     ));
//   }

//   // ejemplo del path : /usuarios, /categorias
//   static Future httpGet(String path) async {
//     try {
//       final response = await _dio.get(path);

//       return response.data;
//     } on DioError catch (e) {
//       print(e.response);
//       throw ("Error en el GET");
//     }
//   }

//   static Future post(String path, Map<String, dynamic> data) async {
//     // final formData = FormData.fromMap(data);
//     try {
//       final response = await _dio.post(path, data: data);
//       return response.data;
//     } on DioError catch (e) {
//       print(e.response);
//       throw ("Error en el POST");
//     }
//   }

//   static Future put(String path, Map<String, dynamic> data) async {
//     final formData = FormData.fromMap(data);

//     try {
//       final resp = await _dio.put(path, data: formData);
//       return resp.data;
//     } on DioError catch (e) {
//       print(e.response);
//       throw ('Error en el PUT $e');
//     }
//   }

//   static Future delete(String path, Map<String, dynamic> data) async {
//     final formData = FormData.fromMap(data);

//     try {
//       final resp = await _dio.delete(path, data: formData);
//       return resp.data;
//     } on DioError catch (e) {
//       print(e.response);
//       throw ('Error en el delete');
//     }
//   }
// }

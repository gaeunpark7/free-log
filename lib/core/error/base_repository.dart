import 'dart:io';
import 'package:flutter/material.dart';
import 'package:free_log/core/error/app_exception.dart';
import 'package:free_log/core/error/error_code.dart';
import 'package:http/http.dart' show ClientException;
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BaseRepository {
  Future<T> execute<T>(Future<T> Function() action, {String? errorCode}) async {
    try {
      return await action();
    } on SocketException catch (_) {
      debugPrint('네트워크 연결 실패');
      throw AppException('networkError', code: ErrorCode.networkError);
    } on ClientException catch (_) {
      debugPrint('네트워크 연결 실패');
      throw AppException('networkError', code: ErrorCode.networkError);
    } on PostgrestException catch (e) {
      debugPrint('DB 에러: ${e.message}');
      throw AppException(
        errorCode ?? ErrorCode.saveFailed,
        code: errorCode ?? ErrorCode.saveFailed,
      );
    } catch (e) {
      debugPrint('알 수 없는 에러: $e');
      throw AppException('unknownError', code: ErrorCode.unknownError);
    }
  }
}

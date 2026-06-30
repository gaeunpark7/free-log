import 'dart:io';
import 'package:flutter/material.dart';
import 'package:free_log/core/error/app_exception.dart';
import 'package:http/http.dart' show ClientException;
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BaseRepository {
  Future<T> execute<T>(Future<T> Function() action, {String? errorMessage}) async {
    try {
      return await action();
    } on SocketException catch (_) {
      debugPrint('네트워크 연결 실패');
      throw AppException('인터넷 연결을 확인해주세요.');
    } on ClientException catch (_) {
      debugPrint('네트워크 연결 실패');
      throw AppException('인터넷 연결을 확인해주세요.');
    } on PostgrestException catch (e) {
      debugPrint('DB 에러: ${e.message}');
      throw AppException(errorMessage ?? '요청에 실패하였습니다.');
    } catch (e) {
      debugPrint('알 수 없는 에러: $e');
      throw AppException('알 수 없는 오류가 발생했습니다.');
    }
  }
}

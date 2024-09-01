// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:matchup/core/errors/message_error.dart';
import 'package:matchup/core/utils/typedef.dart';
import 'package:matchup/features/chat/data/provider/chat_provider.dart';

class ChatRepository {
  final ChatProvider provider;
  ChatRepository({
    required this.provider,
  });

  Future<EitherMessageErrorrOrMap> getchat({required String id}) async {
    try {
      final res = await provider.getChat(id: id);
      return right(res);
    } on DioException catch (e) {
      return left(MessageError(
          message: e.response?.statusMessage ?? "There has been an error"));
    } catch (e) {
      return left(MessageError(message: e.toString()));
    }
  }

  Future<EitherMessageErrorrOrMap> sendChat(
      {required String recieverId, required String message}) async {
    try {
      final res =
          await provider.sendChat(recieverId: recieverId, message: message);
      return right(res);
    } on DioException catch (e) {
      return left(MessageError(
          message: e.response?.statusMessage ?? "There has been an error"));
    } catch (e) {
      return left(MessageError(message: e.toString()));
    }
  }
}

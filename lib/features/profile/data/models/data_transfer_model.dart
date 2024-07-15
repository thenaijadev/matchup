// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:matchup/features/auth/data/models/user_data.dart';
import 'package:matchup/features/profile/data/models/all_sports_model.dart';

class DataTransferModel {
  final List<Sport> sports;
  final UserData user;
  DataTransferModel({
    required this.sports,
    required this.user,
  });
}

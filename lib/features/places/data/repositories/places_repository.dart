// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:matchup/core/utils/typedef.dart';
import 'package:matchup/features/places/data/models/places_error.dart';
import 'package:matchup/features/places/data/models/places_success.dart';
import 'package:matchup/features/places/data/provider/places_provider.dart';

class PlacesRepository {
  final PlacesProvider provider;
  PlacesRepository({
    required this.provider,
  });
  Future<EitherPlacesErrorOrPlacesModel> getPlaces(
      {required String query}) async {
    try {
      final res = await provider.findPlaces(query: query);
      return right(PlacesSuccess(predictionsMap: res));
    } catch (e) {
      return left(PlacesError(errorMessage: e.toString()));
    }
  }
}

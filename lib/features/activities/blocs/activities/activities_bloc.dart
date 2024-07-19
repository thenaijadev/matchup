import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:matchup/features/activities/data/models/activities_error.dart';
import 'package:matchup/features/activities/data/models/all_activities_model.dart';
import 'package:matchup/features/activities/data/models/single_activity_model.dart';
import 'package:matchup/features/activities/data/repositories/activities_repository.dart';

part 'activities_event.dart';
part 'activities_state.dart';

class ActivitiesBloc extends Bloc<ActivitiesEvent, ActivitiesState> {
  final ActivitiesRepository repo;
  ActivitiesBloc({required this.repo}) : super(ActivitiesInitial()) {
    on<ActivitiesEventGetAllActivities>((event, emit) async {
      emit(ActivitiesStateIsLoading());
      final response = await repo.getActivities();
      response.fold(
        (l) => emit(ActivitiesStateError(error: l)),
        (r) => emit(
          ActivitiesStateAllActivitiesRetreived(activitiesModel: r),
        ),
      );
    });

    on<ActivitiesEventGetAllActivitiesByStatus>((event, emit) async {
      emit(ActivitiesStateIsLoading());
      final response = await repo.getActivitiesByStatus(status: event.status);
      response.fold(
        (l) => emit(ActivitiesStateError(error: l)),
        (r) => emit(
          ActivitiesStateAllActivitiesRetreivedByStatus(activities: r),
        ),
      );
    });

    on<ActivitiesEventGetAllActivitiesById>((event, emit) async {
      emit(ActivitiesStateIsLoading());
      final response = await repo.getActivitiesById(id: event.id);
      response.fold(
        (l) => emit(ActivitiesStateError(error: l)),
        (r) => emit(
          ActivitiesStateAllActivitiesRetreivedById(activity: r),
        ),
      );
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'activity_details_event.dart';
part 'activity_details_state.dart';

class ActivityDetailsBloc
    extends Bloc<ActivityDetailsEvent, ActivityDetailsState> {
  ActivityDetailsBloc()
      : super(const ActivitiesInfoGathering(formDetails: {})) {
    on<ActivityEventGatherInfoEvent>((event, emit) {
      final state = this.state;
      if (state is ActivitiesInfoGathering) {
        final updatedValues = {...state.formDetails, ...event.keyValue};
        emit(ActivitiesInfoGathering(formDetails: updatedValues));
      }
    });
  }
}

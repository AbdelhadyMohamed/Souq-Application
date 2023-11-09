part of 'home_bloc.dart';

enum ScreenStatus { init, loading, success, failed }

class HomeState {
  final ScreenStatus? screenStatus;
  final CategoryEntity? categoryEntity;
  final Failures? failures;
  final int? index;

  HomeState(
      {this.screenStatus, this.categoryEntity, this.failures, this.index});
  HomeState copyWith(
      {ScreenStatus? screenStatus,
      CategoryEntity? categoryEntity,
      Failures? failures}) {
    return HomeState(
        screenStatus: screenStatus ?? this.screenStatus,
        categoryEntity: categoryEntity ?? this.categoryEntity,
        failures: failures ?? this.failures);
  }
}

class HomeInitial extends HomeState {
  HomeInitial({required super.index})
      : super(
          screenStatus: ScreenStatus.init,
        );
}

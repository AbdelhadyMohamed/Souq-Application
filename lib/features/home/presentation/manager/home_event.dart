part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class GetCategoriesEvent extends HomeEvent {}

class GetBrandsEvent extends HomeEvent {}

class TabChange extends HomeEvent {
  final int index;
  TabChange({required this.index});
}

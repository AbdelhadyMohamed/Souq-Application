part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class GetCategoriesEvent extends HomeEvent {}

class TabChange extends HomeEvent {
  final int tabIndex;
  TabChange({required this.tabIndex});
}

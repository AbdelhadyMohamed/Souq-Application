import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/api/api_manager.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/home/data/data_sources/remote/remote_ds_impl.dart';
import 'package:ecommerce/features/home/data/repositories/home_repo_impl.dart';
import 'package:ecommerce/features/home/domain/entities/CategoryEntity.dart';
import 'package:ecommerce/features/home/domain/use_cases/home_use_cases.dart';
import 'package:ecommerce/features/home/presentation/pages/tabs/favourite_tab.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../data/data_sources/remote/remote_ds.dart';
import '../../domain/repositories/home_repositories.dart';
import '../pages/tabs/category_tab.dart';
import '../pages/tabs/home_tab.dart';
import '../pages/tabs/profile_tab.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  static HomeBloc get(context) => BlocProvider.of(context);
  HomeBloc() : super(HomeInitial(index: 0)) {
    on<HomeEvent>((event, emit) async {
      state.copyWith(screenStatus: ScreenStatus.loading);
      if (event is GetCategoriesEvent) {
        ApiManager apiManager = ApiManager();
        HomeTabRemoteDS homeTabRemoteDS = HomeTabRemoteDSImpl(apiManager);
        HomeTabRepo homeTabRepo = HomeTabRepoImpl(homeTabRemoteDS);
        HomeTabUseCase homeTabUseCase = HomeTabUseCase(homeTabRepo);
        var result = await homeTabUseCase.getCategories();
        result.fold((l) {
          emit(state.copyWith(screenStatus: ScreenStatus.failed, failures: l));
        }, (r) {
          emit(state.copyWith(
              screenStatus: ScreenStatus.success, categoryEntity: r));
        });
      } else if (event is TabChange) {
        emit(HomeInitial(index: event.tabIndex));
      }
    });
  }
}

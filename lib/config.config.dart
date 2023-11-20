// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'core/api/api_manager.dart' as _i3;
import 'features/home/data/data_sources/remote/remote_ds.dart' as _i4;
import 'features/home/data/data_sources/remote/remote_ds_impl.dart' as _i5;
import 'features/home/data/repositories/home_repo_impl.dart' as _i7;
import 'features/home/domain/repositories/home_repositories.dart' as _i6;
import 'features/home/domain/use_cases/add_to_cart_use_case.dart' as _i18;
import 'features/home/domain/use_cases/get_all_wish_list_items_use_case.dart'
    as _i29;
import 'features/home/domain/use_cases/get_brands_use_case.dart' as _i26;
import 'features/home/domain/use_cases/get_categories_use_case.dart' as _i28;
import 'features/home/presentation/manager/home_bloc.dart' as _i30;
import 'features/login/data/data_source/local/local_ds.dart' as _i8;
import 'features/login/data/data_source/local/local_ds_impl.dart' as _i9;
import 'features/login/data/data_source/remote/remote_ds.dart' as _i10;
import 'features/login/data/data_source/remote/remote_ds_impl.dart' as _i11;
import 'features/login/data/repo/login_repo_impl.dart' as _i13;
import 'features/login/domain/domain_repo/login_repo.dart' as _i12;
import 'features/login/domain/use_case/login_use_case.dart' as _i14;
import 'features/login/presentation/bloc/login_bloc.dart' as _i15;
import 'features/product_list/data/data_sources/remote_ds/product_list_ds.dart'
    as _i16;
import 'features/product_list/data/data_sources/remote_ds/product_list_ds_impl.dart'
    as _i17;
import 'features/product_list/data/repositories/cart_repo_impl.dart' as _i23;
import 'features/product_list/data/repositories/del_from_repo_impl.dart'
    as _i25;
import 'features/product_list/data/repositories/product_list_repo_impl.dart'
    as _i32;
import 'features/product_list/data/repositories/wish_list_repo_impl.dart'
    as _i20;
import 'features/product_list/domain/repositories/add_to_wish_repo.dart'
    as _i19;
import 'features/product_list/domain/repositories/cart_repo.dart' as _i22;
import 'features/product_list/domain/repositories/del_from_repo.dart' as _i24;
import 'features/product_list/domain/repositories/product_list_repo.dart'
    as _i31;
import 'features/product_list/domain/use_cases/add_to_wish_list_use_case.dart'
    as _i21;
import 'features/product_list/domain/use_cases/del_from_use_case.dart' as _i34;
import 'features/product_list/domain/use_cases/get_carts_use_case.dart' as _i27;
import 'features/product_list/domain/use_cases/product_list_use_case.dart'
    as _i33;
import 'features/product_list/presentation/bloc/product_list_bloc.dart' as _i35;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ApiManager>(_i3.ApiManager());
    gh.factory<_i4.HomeTabRemoteDS>(
        () => _i5.HomeTabRemoteDSImpl(gh<_i3.ApiManager>()));
    gh.factory<_i6.HomeTabRepo>(
        () => _i7.HomeTabRepoImpl(gh<_i4.HomeTabRemoteDS>()));
    gh.factory<_i8.LogInLocalDS>(() => _i9.LogInLocalDSImpl());
    gh.factory<_i10.LogInRemoteDataSource>(
        () => _i11.LogInRemoteDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i12.LogInRepo>(() => _i13.LogInRepoImpl(
          gh<_i10.LogInRemoteDataSource>(),
          gh<_i8.LogInLocalDS>(),
        ));
    gh.factory<_i14.LogInUseCase>(
        () => _i14.LogInUseCase(gh<_i12.LogInRepo>()));
    gh.factory<_i15.LoginBloc>(() => _i15.LoginBloc(gh<_i14.LogInUseCase>()));
    gh.factory<_i16.ProductRemoteDS>(
        () => _i17.ProductRemoteDSImpl(gh<_i3.ApiManager>()));
    gh.factory<_i18.AddToCartUseCase>(
        () => _i18.AddToCartUseCase(gh<_i6.HomeTabRepo>()));
    gh.factory<_i19.AddToWishListRepo>(
        () => _i20.AddToWishListRepoImpl(gh<_i16.ProductRemoteDS>()));
    gh.factory<_i21.AddToWishListUseCase>(
        () => _i21.AddToWishListUseCase(gh<_i19.AddToWishListRepo>()));
    gh.factory<_i22.CartRepo>(
        () => _i23.CartRepoImpl(gh<_i16.ProductRemoteDS>()));
    gh.factory<_i24.DelFromRepo>(
        () => _i25.DelFromRepoImpl(gh<_i16.ProductRemoteDS>()));
    gh.factory<_i26.GetBrandsUseCase>(
        () => _i26.GetBrandsUseCase(gh<_i6.HomeTabRepo>()));
    gh.factory<_i27.GetCartsUseCase>(
        () => _i27.GetCartsUseCase(gh<_i22.CartRepo>()));
    gh.factory<_i28.GetCategoriesUseCase>(
        () => _i28.GetCategoriesUseCase(gh<_i6.HomeTabRepo>()));
    gh.factory<_i29.GetWishListItemsUseCase>(
        () => _i29.GetWishListItemsUseCase(gh<_i6.HomeTabRepo>()));
    gh.factory<_i30.HomeBloc>(() => _i30.HomeBloc(
          gh<_i28.GetCategoriesUseCase>(),
          gh<_i26.GetBrandsUseCase>(),
          gh<_i18.AddToCartUseCase>(),
          gh<_i29.GetWishListItemsUseCase>(),
        ));
    gh.factory<_i31.ProductListRepo>(
        () => _i32.ProductListRepoImpl(gh<_i16.ProductRemoteDS>()));
    gh.factory<_i33.ProductListUseCase>(
        () => _i33.ProductListUseCase(gh<_i31.ProductListRepo>()));
    gh.factory<_i34.DelFormWishListUseCase>(
        () => _i34.DelFormWishListUseCase(gh<_i24.DelFromRepo>()));
    gh.factory<_i35.ProductListBloc>(() => _i35.ProductListBloc(
          gh<_i33.ProductListUseCase>(),
          gh<_i27.GetCartsUseCase>(),
          gh<_i21.AddToWishListUseCase>(),
          gh<_i34.DelFormWishListUseCase>(),
        ));
    return this;
  }
}

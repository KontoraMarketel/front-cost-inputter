import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../config/di/di.dart';
import '../../../data/api/rest_client.dart';
import '../../../data/dto/product.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());

  Future<void> fetchProducts({int? lastNmID}) async {
    final products = await getIt<RestClient>().getProducts(
      ReadProductRq(
        settings: ProductSettings(
          cursor: ProductSettingsCursor(nmID: lastNmID, limit: 20),
          filter: ProductSettingsFilter(withPhoto: -1),
        ),
      ),
    );
    if (state is Data) {
      emit(
        HomeState.data((state as Data).products..cards.addAll(products.cards)),
      );
      return;
    }

    emit(HomeState.data(products));
  }
}

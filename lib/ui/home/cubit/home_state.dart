part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = Initial;

  const factory HomeState.data(ReadProductRs products) = Data;
}

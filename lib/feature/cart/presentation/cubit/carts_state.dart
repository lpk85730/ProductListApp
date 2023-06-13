part of 'carts_cubit.dart';

abstract class CartsState extends Equatable {
  const CartsState();
}

class CartsInitial extends CartsState {
  @override
  List<Object?> get props => [];
}

class CartsDataLoading extends CartsState {
  @override
  List<Object?> get props => [];
}

class CartsDataLoaded extends CartsState {
  const CartsDataLoaded({required this.cartsList});

  final List<CartModel> cartsList;

  @override
  List<Object?> get props => [cartsList];
}

class CartsDataFailed extends CartsState {
  const CartsDataFailed({required this.error});

  final String error;

  @override
  List<Object?> get props => [error];
}

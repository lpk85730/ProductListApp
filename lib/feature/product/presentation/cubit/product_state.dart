part of 'product_cubit.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();
}

class ProductInitial extends ProductsState {
  @override
  List<Object?> get props => [];
}

class ProductDataLoading extends ProductsState {
  @override
  List<Object?> get props => [];
}

class ProductDataLoaded extends ProductsState {
  const ProductDataLoaded({required this.productList});

  final List<Product> productList;

  @override
  List<Object?> get props => [productList];
}

class ProductDataFailed extends ProductsState {
  const ProductDataFailed({required this.error});

  final String error;

  @override
  List<Object?> get props => [error];
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list_app/core/constants/theme_constants.dart';
import 'package:product_list_app/feature/cart/data/model/carts_model.dart';
import 'package:product_list_app/feature/cart/presentation/cubit/carts_cubit.dart';
import 'package:product_list_app/feature/cart/presentation/widgets/carts_item.dart';

class CartsPage extends StatefulWidget {
  const CartsPage({super.key});

  @override
  State<CartsPage> createState() => _CartsPageState();
}

class _CartsPageState extends State<CartsPage>
    with AutomaticKeepAliveClientMixin<CartsPage> {
  final ScrollController _scrollController = ScrollController();

  int offset = 0;

  bool hasLoadMore = true;

  bool isLoadMoreRunning = false;

  List<CartModel> cartsList = [];

  @override
  void initState() {
    super.initState();
    initRefresh();
    _scrollController.addListener(loadMore);
  }

  Future<void> initRefresh() async {
    hasLoadMore = true;
    offset = 0;
    Future.delayed(
      const Duration(milliseconds: 400),
      () => BlocProvider.of<CartsCubit>(context).getCarts(),
    );
  }

  Future<void> loadMore() async {
    if (hasLoadMore == true &&
        isLoadMoreRunning == false &&
        _scrollController.position.extentAfter < 300) {
      setState(() {
        // Display a progress indicator at the bottom
        isLoadMoreRunning = true;
      });
      offset += 10;
      try {
        final fetchedProductList = await BlocProvider.of<CartsCubit>(context)
            .getMoreProducts(offset: offset);
        if (fetchedProductList.isNotEmpty && fetchedProductList.isNotEmpty) {
          setState(() {
            cartsList.addAll(fetchedProductList);
          });
        } else {
          /// This means there is no more data and therefore,
          /// we will not send another request
          setState(() {
            hasLoadMore = false;
          });
        }
      } catch (err) {
        debugPrint('Something went wrong!');
      }

      setState(() {
        isLoadMoreRunning = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<CartsCubit, CartsState>(
      builder: (context, state) {
        if (state is CartsInitial || state is CartsDataLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CartsDataLoaded) {
          cartsList = state.cartsList;
          return _buildCarts(cartsList);
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _buildCarts(List<CartModel> cartsList) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: cartsList.length,
            controller: _scrollController,
            itemBuilder: (context, index) {
              final cart = cartsList[index];
              return CartsItem(cart: cart);
            },
          ),
        ),
        if (isLoadMoreRunning == true)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 25),
            child: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(ThemeColors.clrBlack),
              ),
            ),
          ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}

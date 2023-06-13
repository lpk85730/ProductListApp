import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list_app/core/constants/theme_constants.dart';
import 'package:product_list_app/feature/product/domain/entity/product.dart';
import 'package:product_list_app/feature/product/presentation/cubit/product_cubit.dart';
import 'package:product_list_app/feature/product/presentation/widgets/product_item.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage>
    with AutomaticKeepAliveClientMixin<ProductsPage> {
  final ScrollController _scrollController = ScrollController();

  int offset = 0;

  bool hasLoadMore = true;

  bool isLoadMoreRunning = false;

  List<Product> productList = [];

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
      () => BlocProvider.of<ProductsCubit>(context).getProducts(),
    );
  }

  Future<void> loadMore() async {
    if (hasLoadMore == true &&
        isLoadMoreRunning == false &&
        _scrollController.position.extentAfter < 300) {
      setState(() {
        /// Display a progress indicator at the bottom
        isLoadMoreRunning = true;
      });
      offset += 10;
      try {
        final fetchedProductList = await BlocProvider.of<ProductsCubit>(context)
            .getMoreProducts(offset: offset);

        if (fetchedProductList.isNotEmpty && fetchedProductList.isNotEmpty) {
          setState(() {
            productList.addAll(fetchedProductList);
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
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductInitial || state is ProductDataLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProductDataLoaded) {
          productList = state.productList;
          return _buildProducts(productList);
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _buildProducts(List<Product> productList) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: productList.length,
            controller: _scrollController,
            itemBuilder: (context, index) {
              final product = productList[index];
              return ProductItem(product: product);
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

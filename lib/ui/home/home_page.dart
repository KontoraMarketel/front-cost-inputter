import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/dto/dto.dart';
import '../../utils/extensions/extensions.dart';
import 'cubit/home_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = false;
  late int _lastNmID;
  bool _hasMore = true;
  final _scrollController = ScrollController();

  late HomeCubit _cubit;

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _loadItems();
    }
  }

  Future<void> _loadItems() async {
    if (_isLoading || !_hasMore) return;

    setState(() => _isLoading = true);

    _cubit.fetchProducts(lastNmID: _lastNmID);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit = HomeCubit()..fetchProducts(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is Data) {
            _lastNmID = state.products.cards.last.nmID;
            _isLoading = false;
            _hasMore = state.products.cards.length == 20;

            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        controller: _scrollController,
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 20),
                        itemBuilder: (context, index) =>
                            ProductCard(product: state.products.cards[index]),
                        itemCount: state.products.cards.length,
                      ),
                    ),
                    if (_isLoading) Center(child: CircularProgressIndicator()),
                  ],
                ),
              ),
            );
          } // 324877302

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: context.palette.card,
      ),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 40,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 20,
                  children: [
                    Text(
                      product.title,
                      style: context.theme.textTheme.headlineMedium,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      product.nmID.toString(),
                      style: context.theme.textTheme.headlineSmall,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              if (product.photos != null)
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: 200,
                  child: CarouselView.weighted(
                    flexWeights: [4, 2],
                    itemSnapping: true,
                    consumeMaxWeight: false,
                    children: product.photos!
                        .map((e) => Image.network(e.big, fit: BoxFit.cover))
                        .toList(),
                  ),
                ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: FilledButton.tonalIcon(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Изменить себестоимость'),
                    content: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    actionsAlignment: MainAxisAlignment.spaceBetween,
                    actions: [
                      FilledButton(
                        onPressed: () => Navigator.pop(context),
                        style: FilledButton.styleFrom(
                          backgroundColor: context.palette.error,
                        ),
                        child: Text('Отмена'),
                      ),
                      FilledButton(onPressed: () {}, child: Text('Сохранить')),
                    ],
                  ),
                );
              },
              label: Text(
                '${product.nmID} \$',
                style: context.theme.textTheme.labelLarge?.copyWith(
                  color: context.palette.accent,
                ),
              ),
              icon: Icon(Icons.edit, color: context.palette.accent),
            ),
          ),
        ],
      ),
    );
  }
}

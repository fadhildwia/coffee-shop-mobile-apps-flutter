import 'package:coffee_shop_mobile_apps/utils/assets.dart';
import 'package:coffee_shop_mobile_apps/view_models/home_view_model.dart';
import 'package:coffee_shop_mobile_apps/widgets/custom_dropdown.dart';
import 'package:coffee_shop_mobile_apps/widgets/custom_tab_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(),
      child: Consumer<HomeViewModel>(
        builder: (context, viewModel, child) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 280,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(49, 49, 49, 1),
                              Color.fromRGBO(17, 17, 17, 1),
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Location',
                                style: TextStyle(
                                  color: Color.fromRGBO(162, 162, 162, 1),
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(height: 8),
                              CustomDropdown(
                                selectedValue: viewModel.selectedLocation,
                                items: ['Item 1', 'Item 2', 'Item 3', 'Item 4'],
                                onChanged: (value) {
                                  viewModel.selectedLocation = value;
                                },
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                      decoration: InputDecoration(
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.all(16),
                                          child: SvgPicture.asset(
                                            '${AssetPath.iconPath}/search.svg',
                                            colorFilter: const ColorFilter.mode(
                                              Colors.white,
                                              BlendMode.srcIn,
                                            ),
                                            width: 20,
                                            height: 20,
                                          ),
                                        ),
                                        hintText: 'Search Coffee',
                                        hintStyle: const TextStyle(
                                          color:
                                              Color.fromRGBO(162, 162, 162, 1),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          borderSide: BorderSide.none,
                                        ),
                                        filled: true,
                                        fillColor:
                                            const Color.fromRGBO(42, 42, 42, 1),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Container(
                                    height: 52,
                                    width: 52,
                                    decoration: BoxDecoration(
                                      color:
                                          const Color.fromRGBO(198, 124, 78, 1),
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: IconButton(
                                      icon: const Icon(
                                        Icons.filter_alt_rounded,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 74),
                        child: Container(
                          color: const Color.fromRGBO(249, 249, 249, 1),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 16,
                            ),
                            child: SizedBox(
                              height: 30,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: viewModel.coffeeTypes.length,
                                itemBuilder: (context, index) {
                                  return CustomTabButton(
                                    title: viewModel.coffeeTypes[index].name,
                                    isSelected: viewModel.selectedCoffee ==
                                        viewModel.coffeeTypes[index].name,
                                    onPressed: () {
                                      viewModel.selectCoffee(
                                        viewModel.coffeeTypes[index],
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16.0,
                            mainAxisSpacing: 16.0,
                            mainAxisExtent: 270,
                          ),
                          itemCount: viewModel.coffeeProducts.length,
                          itemBuilder: (context, index) {
                            final product = viewModel.coffeeProducts[index];
                            return InkWell(
                              onTap: () {},
                              child: Card(
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8, left: 8, right: 8, bottom: 12),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            child: Image.asset(
                                              product.imageUrl,
                                              fit: BoxFit.cover,
                                              width: double.infinity,
                                            ),
                                          ),
                                          Positioned(
                                            top: 0,
                                            right: 0,
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                vertical: 8.0,
                                                horizontal: 14.0,
                                              ),
                                              decoration: const BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Color.fromRGBO(
                                                        17, 17, 17, 0.3),
                                                    Color.fromRGBO(
                                                        49, 49, 49, 0.3),
                                                  ],
                                                  begin: Alignment.bottomLeft,
                                                  end: Alignment.topRight,
                                                ),
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(0),
                                                  topRight: Radius.circular(12),
                                                  bottomLeft:
                                                      Radius.circular(24),
                                                  bottomRight:
                                                      Radius.circular(0),
                                                ),
                                              ),
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset(
                                                    '${AssetPath.iconPath}/star.svg',
                                                    colorFilter:
                                                        const ColorFilter.mode(
                                                            Color.fromRGBO(251,
                                                                190, 33, 1),
                                                            BlendMode.srcIn),
                                                    width: 12,
                                                    height: 12,
                                                  ),
                                                  const SizedBox(width: 4),
                                                  Text(
                                                    '${product.score}',
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 10,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        product.productName,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        product.detail,
                                        maxLines: 1,
                                        style: const TextStyle(
                                          color:
                                              Color.fromRGBO(162, 162, 162, 1),
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '\$${product.price.toStringAsFixed(2)}',
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Container(
                                            height: 32,
                                            width: 32,
                                            decoration: BoxDecoration(
                                              color: const Color.fromRGBO(
                                                  198, 124, 78, 1),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: IconButton(
                                              icon: const Icon(
                                                Icons.plus_one,
                                                color: Colors.white,
                                              ),
                                              padding: EdgeInsets.zero,
                                              onPressed: () {},
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                  Positioned(
                    top: 200,
                    left: 24,
                    right: 24,
                    child: Image.asset(
                      '${AssetPath.imagePath}/banner.png',
                      width: double.infinity,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:coffee_shop_mobile_apps/screens/detail_product_screen.dart';
import 'package:coffee_shop_mobile_apps/utils/assets.dart';
import 'package:coffee_shop_mobile_apps/view_models/home_view_model.dart';
import 'package:coffee_shop_mobile_apps/widgets/custom_dropdown.dart';
import 'package:coffee_shop_mobile_apps/widgets/custom_tab_button.dart';
import 'package:coffee_shop_mobile_apps/widgets/product_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                                items: const [
                                  'Item 1',
                                  'Item 2',
                                  'Item 3',
                                  'Item 4'
                                ],
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
                      ProductGrid(
                        viewModel: viewModel,
                        onPressedCard: (product) {
                          print(product);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailProductScreen(data: product),
                            ),
                          );
                        },
                        onPressedPlus: (context) => {},
                      ),
                    ],
                  ),
                  Positioned(
                    top: 180,
                    left: 24,
                    right: 24,
                    child: Image.asset(
                      '${AssetPath.imagePath}/banner.png',
                      height: 180,
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

import 'package:coffee_shop_mobile_apps/models/coffee_model.dart';
import 'package:coffee_shop_mobile_apps/utils/assets.dart';
import 'package:coffee_shop_mobile_apps/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DetailProductScreen extends StatefulWidget {
  final CoffeeProduct data;
  const DetailProductScreen({super.key, required this.data});

  @override
  State<DetailProductScreen> createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  String selectedSize = 'S';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double imageHeight = size.width * (2 / 3);

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 24,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: const Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                'Detail',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: IconButton(
              icon: SvgPicture.asset(
                '${AssetPath.iconPath}/heart_outline.svg',
                colorFilter:
                    const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                width: 24,
                height: 24,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 110,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 6,
              offset: const Offset(0, -1),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Price',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(162, 162, 162, 1),
                    ),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    '\$${widget.data.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 34,
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    backgroundColor: const Color.fromRGBO(198, 124, 78, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Buy Now',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(16),
                ),
                child: Image.asset(
                  widget.data.imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: imageHeight,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                widget.data.productName,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Ice/Hot',
                    style: TextStyle(
                      color: Color.fromRGBO(162, 162, 162, 1),
                    ),
                  ),
                  Row(
                    children: [
                      Image.asset(
                        '${AssetPath.iconPath}/bike.png',
                        width: 32,
                        height: 32,
                      ),
                      const SizedBox(
                        width: 22,
                      ),
                      Image.asset(
                        '${AssetPath.iconPath}/bean.png',
                        width: 32,
                        height: 32,
                      ),
                      const SizedBox(
                        width: 22,
                      ),
                      Image.asset(
                        '${AssetPath.iconPath}/milk.png',
                        width: 32,
                        height: 32,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    '${AssetPath.iconPath}/star.svg',
                    colorFilter: const ColorFilter.mode(
                      Color.fromRGBO(251, 190, 33, 1),
                      BlendMode.srcIn,
                    ),
                    width: 20,
                    height: 20,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${widget.data.score}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  const Text(
                    '(290)',
                    style: TextStyle(
                      color: Color.fromRGBO(162, 162, 162, 1),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const Divider(
                color: CustomColors.whiteOne,
                thickness: 1,
                height: 1,
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Description',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                '${widget.data.detail} Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popula',
                style: const TextStyle(
                  fontSize: 14,
                  color: Color.fromRGBO(162, 162, 162, 1),
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 24,
              ),
              const Text(
                'Size',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSizeButton('S'),
                  const SizedBox(width: 16), // Gap between buttons
                  _buildSizeButton('M'),
                  const SizedBox(width: 16),
                  _buildSizeButton('L'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSizeButton(String size) {
    bool isSelected = selectedSize == size;

    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selectedSize = size;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor:
              isSelected ? const Color.fromRGBO(198, 124, 78, 1) : Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          size,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

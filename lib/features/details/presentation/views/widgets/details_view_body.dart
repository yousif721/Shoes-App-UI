import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../core/utils/functions/app_methods.dart';
import '../../../../../constant.dart';
import '../../../../../core/widgets/custom_app_theme.dart';
import '../../../../../core/widgets/fade_animation.dart';

import '../../../../data/dummy_data.dart';
import '../../../../data/models/shoes_model.dart';
import 'app_bar.dart';


class DetailsViewBody extends StatefulWidget {
  ShoeModel model;
  bool isComeFromMoreSection;
  DetailsViewBody({super.key, required this.model, required this.isComeFromMoreSection});

  @override
  State<DetailsViewBody> createState() => _DetailsViewBodyState();
}

class _DetailsViewBodyState extends State<DetailsViewBody> {
  bool _isSelectedCountry = false;
  int? _isSelectedSize;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: AppConstantsColor.backgroundColor,
          appBar: const CustomDetailsViewAppBar(),
          body: SizedBox(
              width: size.width,
              height: size.height * 1.1,
              child: Column(children: [
                _topProductImageAndBg(size),
                _morPicOfProduct(size),
                SizedBox(
                  height: 20,
                  width: size.width / 1.1,
                  child: const Divider(
                    thickness: 1.5,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                nameAndPrice(),
                const SizedBox(
                  height: 10,
                ),
                shoeInfo(size),
                sizeTextAndCountry(size),
                endSizesAndButton(size),
                const SizedBox(
                  height: 5,
                ),
                materialButton(size),
              ]))),
    );
  }

  materialButton(Size size) {
    return FadeAnimation(
      delay: 3.5,
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        minWidth: size.width / 1.2,
        height: size.height / 15,
        color: widget.model.modelColor,
        onPressed: () {
          //AppMethods.addToCart(widget.model, context);
          AppMethods.addToCart(widget.model, context);
        },
        child: const Text(
          "ADD TO BAG",
          style: TextStyle(color: AppConstantsColor.lightTextColor),
        ),
      ),
    );
  }

  endSizesAndButton(Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        width: size.width,
        height: size.height / 20,
        child: FadeAnimation(
          delay: 3,
          child: Row(
            children: [
              Container(
                width: size.width / 4.5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey, width: 1)),
                child: const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Try it",
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      RotatedBox(
                          quarterTurns: -1,
                          child: FaIcon(FontAwesomeIcons.shoePrints))
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              SizedBox(
                width: size.width / 1.5,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _isSelectedSize = index;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 5),
                          width: size.width / 4.4,
                          height: size.height / 13,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: _isSelectedSize == index
                                    ? Colors.black
                                    : Colors.grey,
                                width: 1.5),
                            color: _isSelectedSize == index
                                ? Colors.black
                                : AppConstantsColor.backgroundColor,
                          ),
                          child: Center(
                            child: Text(
                              sizes[index].toString(),
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: _isSelectedSize == index
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  sizeTextAndCountry(Size size) {
    return FadeAnimation(
      delay: 2.5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          children: [
            const Text(
              "Size",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppConstantsColor.darkTextColor,
                fontSize: 22,
              ),
            ),
            const Spacer(),
            SizedBox(
              width: size.width / 8,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    _isSelectedCountry = false;
                  });
                },
                child: SizedBox(
                  width: size.width / 5,
                  child :Text(
                    "UK",
                    style: TextStyle(
                      fontWeight:
                      _isSelectedCountry ? FontWeight.w400 : FontWeight.bold,
                      color: _isSelectedCountry
                          ? Colors.grey
                          : AppConstantsColor.darkTextColor,
                      fontSize: 19,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: size.width / 5,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    _isSelectedCountry = true;
                  });
                },
                child: Text(
                  "USA",
                  style: TextStyle(
                    fontWeight:
                    _isSelectedCountry ? FontWeight.bold : FontWeight.w400,
                    color: _isSelectedCountry
                        ? AppConstantsColor.darkTextColor
                        : Colors.grey,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  shoeInfo(Size size) {
    return FadeAnimation(
      delay: 1.5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          width: size.width,
          height:size.height / 9,
          child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin tincidunt laoreet enim, eget sodales ligula semper at. Sed id aliquet eros, nec vestibulum felis. Nunc maximus aliquet aliquam. Quisque eget sapien at velit cursus tincidunt. Duis tempor lacinia erat eget fermentum.",
              style: AppThemes.detailsProductDescriptions),
        ),
      ),
    );
  }

  Widget nameAndPrice() {
    return FadeAnimation(
      delay: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            Text(
              widget.model.model,
              style: const TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: AppConstantsColor.darkTextColor,
              ),
            ),
            Expanded(child: Container()),
            Text('\$${widget.model.price.toStringAsFixed(2)}',
                style: AppThemes.detailsProductPrice),
          ],
        ),
      ),
    );
  }

  Widget _topProductImageAndBg(Size size) {
    return SizedBox(
      width: size.width,
      height: size.height / 2.3,
      child: Stack(
        children: [
          Positioned(
            left: 50,
            bottom: 10,
            child: FadeAnimation(
              delay: 0.6,
              child: Container(
                width: size.width,
                height: size.height / 2.3,
                decoration: BoxDecoration(
                    color: widget.model.modelColor,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(1500),
                      bottomRight: Radius.circular(50),
                    )),
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: 20,
            child: Hero(
              tag: widget.isComeFromMoreSection ? widget.model.model : widget.model.imgAddress,
              child: RotationTransition(
                turns: const AlwaysStoppedAnimation(-25 / 360),
                child: _topProductImageAndBd(size),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _morPicOfProduct(Size size) {
    return FadeAnimation(
      delay: 0.7,
      child: SizedBox(
        width: size.width,
        height: size.height * 0.1,
        //photos of selection item
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
              4,
                  (index) => index == 3
                  ? Container(
                padding: const EdgeInsets.all(2),
                height: size.height / 14,
                width: size.width / 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[300],
                  image: DecorationImage(
                    image: AssetImage(widget.model.imgAddress),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.grey.withOpacity(0.5), BlendMode.dstATop),
                  ),
                ),
                child: const Center(
                    child: Icon(
                      Icons.play_circle_fill,
                      size: 30,
                    )),
              )
                  : Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 5, vertical: 5),
                child: roundedImage(size.width, size.height),
              )),
        ),
      ),
    );
  }

  SizedBox _topProductImageAndBd(Size size) {
    return SizedBox(
      width: size.width / 1.4,
      height: size.height / 4.3,
      child: FadeAnimation(
        delay: 0.5,
        child: Image.asset(
          widget.model.imgAddress,
          //fit: BoxFit.cover,
        ),
      ),
    );
  }

  roundedImage(width, height) {
    return Container(
      padding: const EdgeInsets.all(2),
      width: width / 5,
      height: height / 14,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[300],
      ),
      child: Image(
        image: AssetImage(widget.model.imgAddress),
      ),
    );
  }
}

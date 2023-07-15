import 'package:flutter/material.dart';
import 'package:shop_app_ui/core/widgets/fade_animation.dart';
import '../../../../../constant.dart';

import '../../../../../core/widgets/custom_app_theme.dart';
import '../../../../data/dummy_data.dart';
import '../../../../data/models/shoes_model.dart';
import 'empty_state.dart';

class BagViewBody extends StatefulWidget {
  const BagViewBody({super.key});

  @override
  State<BagViewBody> createState() => _BagViewBodyState();
}

class _BagViewBodyState extends State<BagViewBody> {

  int lengthOfItemsOnBag = itemsOnBag.length;
  int txt =1;

  double calculateTotalPrice(){
    double totalPrice = 0.0;
    if(itemsOnBag.isEmpty){
      totalPrice = 0.0;
    }else{
      for(ShoeModel item in itemsOnBag){
        totalPrice = totalPrice + item.price*item.value;
      }
    }
    return totalPrice < 0 ? 0 : totalPrice;

  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    ShoeModel model;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConstantsColor.backgroundColor,
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal:9),
          width: width,
          height: height,
          child: Column(
            children: [
              _bagAppBar(width,height),
              itemsOnBag.isEmpty?
              const EmptyList()
                  : Column(
                children: [
                  _mainProductList(width,height),
                  _bottomInfo(width, height),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bottomInfo(double width,double height){
    return SizedBox(
      width: width,
      height: height / 7,
      child: Column(
        children: [
          FadeAnimation(
            delay: 2,
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("TOTAL", style: AppThemes.bagTotalPrice),
                Text(calculateTotalPrice().toString(),
                    style: AppThemes.bagSumOfItemOnBag),
              ],
            ),
          ),
          const SizedBox(height: 10,),
          materialButton(width, height)
        ],
      ),
    );
  }

  Widget materialButton(width, height) {
    return FadeAnimation(
      delay: 3,
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        minWidth: width / 1.2,
        height: height / 15,
        color: AppConstantsColor.materialButtonColor,
        onPressed: () {},
        child: const Text(
          "NEXT",
          style: TextStyle(color: AppConstantsColor.lightTextColor),
        ),
      ),
    );
  }

  SizedBox _mainProductList(double width, double height){
    return SizedBox(
      width: width,
      height: height*0.65,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: itemsOnBag.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index){
            ShoeModel currentBagItem = itemsOnBag[index];
            return Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                width: width,
                height: height*0.2,
                child: Row(
                  children: [
                    //item photo
                    SizedBox(
                      width: width*0.4,
                      child: Stack(
                        children: [
                          Container(
                            margin:const EdgeInsets.all(5),
                            width: width*0.4,
                            decoration:  BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: currentBagItem.modelColor.withOpacity(0.3),
                            ),
                          ),
                          Positioned(
                            right: 2,
                            bottom: 15,
                            child: FadeAnimation(
                              delay: 0.5,
                              child: RotationTransition(
                                turns: const AlwaysStoppedAnimation(-35/360),
                                child: SizedBox(
                                  width: 120,
                                  height:120,
                                  child: Image(
                                    image: AssetImage(currentBagItem.imgAddress),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 15),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(currentBagItem.model,
                          style: AppThemes.bagProductModel,
                        ),
                        const SizedBox(height: 5),
                        //calculateTotalPrice().toString()
                        Text("\$${currentBagItem.price}",
                          style: AppThemes.bagProductPrice,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  if (currentBagItem.value > 1) {
                                    currentBagItem.value--;
                                  } else {
                                    itemsOnBag.remove(currentBagItem);
                                    lengthOfItemsOnBag = itemsOnBag.length;
                                  }
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(left: 0),
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color:Colors.grey[350],
                                ),
                                child:const Center(
                                    child: Icon(
                                      Icons.remove,
                                      size: 15,
                                    )
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(currentBagItem.value.toString()
                                  ,style: AppThemes.bagProductNumOfShoe),
                            ),
                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  currentBagItem.value >= 0
                                      ? currentBagItem.value++
                                      : null;
                                });
                              },
                              child : Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color:Colors.grey[350],
                                ),
                                child: const Center(
                                    child: Icon(
                                      Icons.add,
                                      size: 25,
                                    )
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                  ],
                )
            );
          }
      ),

    );

  }

  SizedBox _bagAppBar(double width, double height){
    return SizedBox(
        width: width,
        height: height / 14,
        child: FadeAnimation(
          delay: 0.5,
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "My Bag",
                style:AppThemes.bagTitle,
              ),
              Text(
                "Total $lengthOfItemsOnBag Items",
                style:AppThemes.bagTotalPrice,
              ),
            ],
          ),
        )
    );
  }
}

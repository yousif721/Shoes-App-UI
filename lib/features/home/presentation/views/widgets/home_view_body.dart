import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../constant.dart';

import '../../../../../core/widgets/custom_app_theme.dart';
import '../../../../../core/widgets/fade_animation.dart';
import '../../../../data/dummy_data.dart';
import '../../../../data/models/shoes_model.dart';
import '../../../../details/details_view.dart';
import 'home_app_bar.dart';


class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  int selectedIndexOfCategory = 0;
  int selectedIndexOfFeatured = 1;

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: const HomeAppBar(),
        body: Column(
          children: [
            _categoryView(size),
            SizedBox(height: size.height * 0.02),
            _mainShoesListView(size),
            _moreTextAndIcon(),
            _bottomSideCategory(size),
          ],
        ),
      ),
    );
  }

  Widget _bottomSideCategory(Size size){
    return SizedBox(
      height:size.height*0.22,
      width:size.width,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: availableShoes.length,
          itemBuilder: (context, index){
            ShoeModel model = availableShoes[index];
            return GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context)=> DetailsView(
                      model: model,
                      isComeFromMoreSection: true,
                    )
                )
                );
              },
              child: Container(
                  width:size.width *0.3,
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          left: 0,
                          top:0,
                          child: Container(
                            width:size.width/12,
                            height:size.height/12,
                            color: Colors.redAccent,
                            child :  RotatedBox(
                              quarterTurns: -1,
                              child: Center(
                                child: FadeAnimation(
                                  delay: 1.2,
                                  child: const Text(
                                      'New',
                                      style: AppThemes.homeGridNewText
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: 70,
                          child: IconButton(
                            onPressed: (){},
                            icon: const Icon(
                              CupertinoIcons.heart,
                              color: AppConstantsColor.darkTextColor,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 35,
                          child: FadeAnimation(
                            delay: 1.3,
                            child: RotationTransition(
                              turns: const AlwaysStoppedAnimation(-20/360),
                              child: Hero(
                                tag:  model.imgAddress,
                                child: Image(
                                  image: AssetImage(model.imgAddress),
                                  // height: size.height * 0.1,
                                  width: size.width * 0.25,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 25,
                          child: Center(
                            child: Text(
                              ' ${model.model}',
                              style: AppThemes.homeGridNameAndModel.copyWith(fontSize: 10),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          child: FadeAnimation(
                            delay: 1.4,
                            child: Text(
                              ' \$${model.price.toStringAsFixed(2)}',
                              style: AppThemes.homeGridNameAndModel.copyWith(fontSize: 10),
                            ),
                          ),

                        )
                      ]
                  )
              ),
            );
          }
      ),
    );
  }

  Widget _moreTextAndIcon(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const  Text('More',style: AppThemes.homeMoreText),
          IconButton(onPressed: (){},
            icon: const Icon(CupertinoIcons.arrow_right,size: 30),
          ),
        ],
      ),
    );
  }

  Widget _categoryView(Size size){
    return Row(
      children: [
        SizedBox(
          height: size.height * 0.04,
          width: size.width,
          //color: Colors.redAccent,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: categories.length,
              itemBuilder: (context, index){
                return GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedIndexOfCategory = index;
                    });
                  },
                  child: Padding(
                    padding:  EdgeInsets.symmetric(
                        horizontal: size.width *0.04),
                    child: Text(
                      categories[index],
                      style: TextStyle(
                        fontSize: selectedIndexOfCategory == index ? 21 : 18,
                        fontWeight: selectedIndexOfCategory == index
                            ? FontWeight.bold : FontWeight.w200,
                        color: selectedIndexOfCategory == index
                            ? AppConstantsColor.darkTextColor
                            : AppConstantsColor.unSelectedTextColor,

                      ),
                    ),
                  ),
                );
              }
          ),
        ),
      ],
    );
  }

  Widget _mainShoesListView(Size size){
    return  Row(
      children: [
        //side bar
        Container(
          margin: EdgeInsets.symmetric(horizontal: size.width * 0.01),
          width: size.width/15,
          height: size.height /2.5,
          child: RotatedBox(
            quarterTurns: -1,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: featured.length,
                itemBuilder: (context, index){
                  return GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedIndexOfFeatured = index;
                      });
                    },
                    child: Padding(
                      padding:  EdgeInsets.symmetric(
                          horizontal: size.width *0.04),
                      child: Text(
                        featured[index],
                        style: TextStyle(
                          fontSize: selectedIndexOfFeatured == index ? 21 : 18,
                          fontWeight: selectedIndexOfFeatured == index
                              ? FontWeight.bold : FontWeight.w200,
                          color: selectedIndexOfFeatured == index
                              ? AppConstantsColor.darkTextColor
                              : AppConstantsColor.unSelectedTextColor,

                        ),
                      ),
                    ),
                  );
                }
            ),
          ),
        ),
        SizedBox(
          width: size.width*0.9,
          height: size.height *0.4,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: availableShoes.length,
            itemBuilder: (context, index){
              ShoeModel model = availableShoes[index];
              return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => DetailsView(
                        model: model,
                        isComeFromMoreSection: false,
                      )
                  )
                  );
                },
                child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: size.width * 0.01,
                      vertical: size.height * 0.02
                  ),
                  width: size.width /1.5,
                  child: Stack(
                    children: [
                      Container(
                        width: size.width/1.7,
                        decoration: BoxDecoration(
                          color: model.modelColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      Positioned(
                        left: 10,
                        child: FadeAnimation(
                          delay: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(model.name,
                                style: AppThemes.homeProductName,
                              ),
                              const SizedBox(width: 110),
                              Positioned(
                                child: IconButton(
                                  onPressed: (){},
                                  icon: const Icon(
                                    Icons.favorite_border,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top:40,
                        left: 10,
                        child: FadeAnimation(
                          delay: 1.4,
                          child: Text(model.model,
                            style: AppThemes.homeProductModel,
                          ),
                        ),
                      ),
                      Positioned(
                        top:75,
                        left: 10,
                        child: FadeAnimation(
                          delay: 1.8,
                          child: Text("\$${model.price.toStringAsFixed(1)}",
                            style: AppThemes.homeProductModel,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 45,
                        left: 10,
                        child: Hero(
                          tag: model.imgAddress,
                          child: RotationTransition(
                            turns: const AlwaysStoppedAnimation(-30/360),
                            child: SizedBox(
                              width:200 ,
                              height:200,
                              child: Image(
                                image: AssetImage(model.imgAddress),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          left: 160,
                          bottom: 20,
                          top: 180,
                          child: IconButton(
                            onPressed: (){},
                            icon: const FaIcon(
                              FontAwesomeIcons.arrowCircleRight,
                              color: Colors.white,
                              size: 25,
                            ),
                          )

                      ),
                    ],
                  ),
                ),
              );
            },

          ),
        )

      ],
    );
  }
}

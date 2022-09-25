import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:untitled2/home/home_screen.dart';
import 'package:untitled2/screens/select_Governorates/selectGovernorates.dart';



class BoardingModel {
  final String image;
  final String title;
  final String body;
  BoardingModel({
    required this.image,
    required this.title,
    required this.body,
  });
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();
  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'images/food.png',
      title: 'الوصول الي ما تريد بكل سهولة',
      body: 'اعرف اقرب مطعم - كافيه ليك بكل سهوله ',
    ),
    BoardingModel(
      image: 'images/food.png',
      title: 'الكل في مكان واحد',
      body: "كل المطاعم والكفيهات وكمان الحلويات في جيبك"
    ),
    BoardingModel(
      image: 'images/food.png',
      title: 'سهولة الاستخدام ',
      body: 'نقوم بايصالك الي ما تريد بكل سهولة',
    ),
  ];
  bool isLast = false;
  @override
  Widget build(BuildContext context) {



    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: boardController,
                onPageChanged: (int index) {
                  if (index == boarding.length-1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                itemBuilder: (context, index) =>
                    bulidBorderingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                const Spacer(),
                SmoothPageIndicator(

                  controller: boardController,
                  count: boarding.length,
                  effect: const ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      activeDotColor: Colors.red,
                      dotHeight: 7,
                      expansionFactor: 4,
                      dotWidth: 5,
                      spacing: 5),
                ),
                const Spacer(),
              ],
            ),
            SizedBox(height: 30,),
            GestureDetector(
              onTap: (){
                if (isLast) {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> SelectGovernorateScreen('')),
                          (route)=>false
                  );

                } else {
                  boardController.nextPage(
                      duration: const Duration(milliseconds: 750),
                      curve: Curves.fastLinearToSlowEaseIn);
                }
              },
              child: Container(
                width:  double.infinity,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.red[900],
                    borderRadius: BorderRadius.circular(20)
                ),
                child: const Center(child: Text('التالي',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.white

                ),))
              ),
            ),

            GestureDetector(
              onTap: (){
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>SelectGovernorateScreen('')),
                        (route)=>false
                );

              },
              child: Container(
                width: double.infinity,
                height: 40,
                child: const Center(child: Text('تخطي',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey
                ),)),
              ),
            ),


          ],
        ),
      ),
    );
  }

  Widget bulidBorderingItem(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: SizedBox(
                height: 100,
                child: Image(
            image: AssetImage(model.image),
            // fit: BoxFit.fill,
          ),
              )),
          Text(
            model.title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold,

            color: Colors.red
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Text(
            model.body,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: Colors.grey),
          ),
        ],
      );
}

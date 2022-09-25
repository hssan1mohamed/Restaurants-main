import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled2/home/home_screen.dart';


class SelectGovernorateScreen extends StatefulWidget {
  String city;
   SelectGovernorateScreen(this.city,{Key? key}) : super(key: key);

  @override
  State<SelectGovernorateScreen> createState() => _SelectGovernorateScreenState();
}

class _SelectGovernorateScreenState extends State<SelectGovernorateScreen> {
  String x='';
  List cities=['الإسكندرية','أسوان','أسيوط','البحيرة','	بني سويف',
    'القاهرة','الدقهلية','دمياط'
    ,'الفيوم','الجيزة','الإسماعيلية','	الأقصر','المنيا','	المنوفية','بور سعيد','قنا','الغردقة','سوهاج','السويس',];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title:  Text('Engez',style: TextStyle(
          color: Colors.red.shade900,
          fontWeight: FontWeight.bold,
        ),),
      ),
      body: ListView(

        children: [
          SizedBox(height: 20,),
          Center(
            child: Text('برجاء تحديد المحافظة',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.red[900],
              fontSize: 22
            ),
            ),
          ),
Center(child: Text(widget.city,style: TextStyle(fontSize: 18)),),
          ListView.builder(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,  itemCount: cities.length,
              itemBuilder:(context,i){
                return  InkWell(
                  onTap: (){
                    setState(() {
                      x=cities[i];
                    });
                  },
                  child: Card(
                    color:widget.city==''?x==cities[i]?Colors.white: Colors.red.shade50:widget.city==cities[i]?Colors.white: Colors.red.shade50,
                    child: ListTile(
                      title: Center(child: Text(cities[i],style: TextStyle(fontSize:x==cities[i]?30:18,color: x==cities[i]?Colors.red:null ),)),
                    ),
                  ),
                );
              },
        ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap:()async{
                if(widget.city==''){
    if(x==''){
    Fluttertoast.showToast(msg: 'يجب اختيار محافظة');
    }else{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('city', x);
    Navigator.of(context).pushReplacement(MaterialPageRoute(
    builder: (context)=>  Home_screen(x)));
    }
    }else{
                  if(x==''){
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.setString('city', widget.city);
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context)=>  Home_screen(widget.city)));
                  }else{
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.setString('city', x);
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context)=>  Home_screen(x)));
                  }
                }
                }
                 ,
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
          ),
        ],
      ),
    );
  }
}
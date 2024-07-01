// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:news_app/model/categoryModel.dart';
// import 'package:news_app/shared/components/Component.dart';
// import 'package:news_app/view/each_category_screen.dart';
// import 'package:news_app/view/home_screen.dart';
//
// import '../model/news_model.dart';
// import '../shared/network/remote/dio_helper.dart';
// import '../view/details_screen.dart';
// import '../layout/layoutcontroller.dart';
//
// class CategoryController extends GetxController{
//   PageController controller = PageController();
//   int _curr = 0;
//   Widget buildCategoryItem(CategoryModel obj){
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
//       child: InkWell(
//         onTap: () {
//
//         },
//         child: Container(
//             width: double.infinity,
//             clipBehavior: Clip.antiAliasWithSaveLayer,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(30)
//             ),
//             child: Stack(
//               alignment: AlignmentDirectional.center,
//               children: [
//                 Image(image:NetworkImage( '${obj.image}'),
//                   fit: BoxFit.cover,
//                   height: 180,
//                   width: double.infinity,),
//                 Text("${obj.name}",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),)
//               ],)
//         ),
//       ),
//     );
//   }
//   final List<Widget> _list = <Widget>[
//     Center(
//       child:  Scaffold(
//             backgroundColor: Colors.white,
//             body: Column(
//               children: [
//                 ReasibleCompomemt.head_line(name: "Categories"),
//                 SizedBox(
//                   height: 20,
//                 ) ,
//                 Expanded(
//                   child: GridView.builder(
//                     itemBuilder: (context, index) =>buildCategoryItem(categories[index]),
//                     shrinkWrap: true,
//                     scrollDirection: Axis.vertical,
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//                     itemCount: 7,
//                   ),
//                 ),
//               ],
//             )
//         ),
//
//     ),
//     Center(
//         child: Pages(
//           text: "Page Two",
//           color: Colors.red.shade100,
//         )),
//   ];
//
//
//
// }
// class Pages extends StatelessWidget {
//   final text;
//   final color;
//   Pages({this.text, this.color});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: color,
//       child: Center(
//         child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text(
//                 text,
//                 textAlign: TextAlign.center,
//                 style: const TextStyle(
//                     fontSize: 30,
//                     fontWeight: FontWeight.w400),
//               ),
//             ]),
//       ),
//     );
//   }
// }
//
// List<CategoryModel> categories=[
//   CategoryModel("business","https://img.freepik.com/free-photo/group-diverse-people-having-business-meeting_53876-25060.jpg"),
//   CategoryModel("entertainment","https://images.unsplash.com/photo-1533481405265-e9ce0c044abb?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bWFsbHxlbnwwfHwwfHx8MA%3D%3D"),
//   CategoryModel("general","https://cdn.i24news.tv/uploads/a4/db/4a/45/e6/aa/6a/a3/b2/bf/5a/95/7b/4b/d1/92/a4db4a45e6aa6aa3b2bf5a957b4bd192.jpg?width=1000"),
//   CategoryModel("health","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcToVm6gGJuHHjqdYKX3jVV8No5C61yN_oObLA&usqp=CAU"),
//   CategoryModel("science","https://images.ctfassets.net/hrltx12pl8hq/2yLJmfUi2QujkWc4SK5DN0/b1fb61f162c480a73d19de05afed3794/shutterstock_510957727-min.jpg?fit=fill&w=600&h=400"),
//   CategoryModel("sports","https://th.bing.com/th/id/R.1ddebd2c242ab22c53d69b5984c5be44?rik=NWWF34pMDSXJ%2fQ&riu=http%3a%2f%2fwww.highlandradio.com%2fwp-content%2fuploads%2f2013%2f08%2fsport.jpg&ehk=B%2fMzKgWN%2bzcwau3WD7d05sO1eqhGQ%2f13gjwmt8rJkV4%3d&risl=&pid=ImgRaw&r=0"),
//   CategoryModel("technology","https://t4.ftcdn.net/jpg/03/08/69/75/360_F_308697506_9dsBYHXm9FwuW0qcEqimAEXUvzTwfzwe.jpg"),
// ];
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:news_app/database/database.dart';

import '../model/categoryModel.dart';
import '../model/news_model.dart';
import '../shared/components/Component.dart';
import '../shared/network/remote/dio_helper.dart';
import '../shared/styles/icon_broken.dart';
import '../view/details_screen.dart';
import 'home_controller.dart';

class CategoryController extends GetxController{
  NewsModel ? newsModel;
  List<Map<String,dynamic>>saved_news_list=[];
  PageController controller = PageController();
  HomeController homeController=Get.put(HomeController());
  database_create db=Get.put(database_create());
  int _curr = 0;
  String ?category_name="health";
  List<CategoryModel> categories=[
    CategoryModel("business","https://img.freepik.com/free-photo/group-diverse-people-having-business-meeting_53876-25060.jpg"),
    CategoryModel("entertainment","https://images.unsplash.com/photo-1533481405265-e9ce0c044abb?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bWFsbHxlbnwwfHwwfHx8MA%3D%3D"),
    CategoryModel("general","https://cdn.i24news.tv/uploads/a4/db/4a/45/e6/aa/6a/a3/b2/bf/5a/95/7b/4b/d1/92/a4db4a45e6aa6aa3b2bf5a957b4bd192.jpg?width=1000"),
    CategoryModel("health","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcToVm6gGJuHHjqdYKX3jVV8No5C61yN_oObLA&usqp=CAU"),
    CategoryModel("science","https://images.ctfassets.net/hrltx12pl8hq/2yLJmfUi2QujkWc4SK5DN0/b1fb61f162c480a73d19de05afed3794/shutterstock_510957727-min.jpg?fit=fill&w=600&h=400"),
    CategoryModel("sports","https://th.bing.com/th/id/R.1ddebd2c242ab22c53d69b5984c5be44?rik=NWWF34pMDSXJ%2fQ&riu=http%3a%2f%2fwww.highlandradio.com%2fwp-content%2fuploads%2f2013%2f08%2fsport.jpg&ehk=B%2fMzKgWN%2bzcwau3WD7d05sO1eqhGQ%2f13gjwmt8rJkV4%3d&risl=&pid=ImgRaw&r=0"),
    CategoryModel("technology","https://t4.ftcdn.net/jpg/03/08/69/75/360_F_308697506_9dsBYHXm9FwuW0qcEqimAEXUvzTwfzwe.jpg"),
  ];
  @override
  // void onInit() {
  //   // TODO: implement onInit
  //   super.onInit();
  //   // DioHelper.getData(
  //   //     url: "v2/top-headlines",
  //   //     query: {
  //   //       'country': 'us',
  //   //       'apiKey': 'eb4af4a3cafb459da264dc85411ea749',
  //   //       'category':category_name
  //   //     }
  //   //
  //   // );
  //     update();
  // }
  void change_Index(int x){
    _curr=x;
    update();
  }
  Widget build_second_screen(List<News_details> news){
    return Column(
      children: [
        Container(
          height: 60,
          width: double.infinity,
          alignment: AlignmentDirectional.topStart,
          child: Row(
              children: [
                IconButton(onPressed: () =>controller.jumpToPage(0) , icon: Icon(IconBroken.Arrow___Left_Circle,size: 25,)),
                Text(
                    "${category_name}",
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)
                ),
              ]
          ),
          decoration: BoxDecoration(color: Colors.white,boxShadow: [ BoxShadow(
            color: Colors.white,
            blurRadius: 200,
            blurStyle: BlurStyle.outer,
          ),
          ],
          ),
        ),
        Container(
          height: 620,
          width: double.infinity,
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.separated(separatorBuilder: (context, index) => SizedBox(height: 20),
                itemBuilder: (context, index) {
                  return Container(
                    height: 620,
                    width: double.infinity,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: ListView.separated(separatorBuilder: (context, index) => SizedBox(height: 20),
                          itemBuilder: (context, index) {
                            return build_news(news[index]);
                          },
                          itemCount: news.length,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,)
                    ),
                  );
                },
                itemCount: news.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,)
          ),
        ),
      ],
    );
  }
  Widget buildCategoryItem(CategoryModel obj){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
      child: InkWell(
        onTap: () async {
          category_name=obj.name;
          await DioHelper.getData(
              url: "v2/top-headlines",
              query: {
                'country': 'us',
                'apiKey': 'dbba2e1d2871400ebceb43654784466c',
                'category':obj.name
              }
          ).then((value)  {
            newsModel = NewsModel.fromJson(value?.data);
            db.get_from_database(db.database).then((value) =>
            saved_news_list = value
            ).then((value) {
              newsModel?.List_of_articles?.forEach((element) {
                saved_news_list?.forEach((element_saved) {
                  if (element_saved['url'] == element.url) {
                    element.saved = true;
                  }
                });
              });
            }
            ).then((value) => update());
          });
          controller.jumpToPage(1);
        },
        child: Container(
            width: double.infinity,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30)
            ),
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Image(image:NetworkImage( '${obj.image}'),
                  fit: BoxFit.cover,
                  height: 180,
                  width: double.infinity,
                  loadingBuilder:(context, child, loadingProgress)  {
                    if(loadingProgress==null){
                      return child;
                    }
                    else{
                      return Center(
                        child: CircularProgressIndicator(color: Colors.black),
                      );
                    }
                  },
                  errorBuilder: (context, error, stackTrace)  {
                    return Image(
                      image: NetworkImage('https://media.istockphoto.com/id/827247322/vector/danger-sign-vector-icon-attention-caution-illustration-business-concept-simple-flat-pictogram.jpg?s=612x612&w=0&k=20&c=BvyScQEVAM94DrdKVybDKc_s0FBxgYbu-Iv6u7yddbs='),
                      loadingBuilder:(context, child, loadingProgress)  {
                        if(loadingProgress==null){
                          return child;
                        }
                        else{
                          return Center(
                            child: CircularProgressIndicator(color: Colors.black),
                          );
                        }
                      },
                    ) ;
                  },),
                Text("${obj.name}",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),)
              ],)
        ),
      ),
    );
  }
  Widget build_news(News_details model) {
    return InkWell(
      onTap: () async {

        await Get.to(()=>Details_screen(),arguments: [model,model.title,model.urlToImage,model.description,model.publishedAt,model.author,model.content],transition:Transition.leftToRightWithFade );
        update();
      },
      child: Row(
        children: [
          Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20)
            ),
            child: Image(image: NetworkImage(model.urlToImage??"https://picsum.photos/250?image=9"),
                fit: BoxFit.cover,
              loadingBuilder:(context, child, loadingProgress)  {
                if(loadingProgress==null){
                  return child;
                }
                else{
                  return Center(
                    child: CircularProgressIndicator(color: Colors.black, ),
                  );
                }
              },
              errorBuilder: (context, error, stackTrace)  {
                return Image(
                  image: NetworkImage('https://media.istockphoto.com/id/827247322/vector/danger-sign-vector-icon-attention-caution-illustration-business-concept-simple-flat-pictogram.jpg?s=612x612&w=0&k=20&c=BvyScQEVAM94DrdKVybDKc_s0FBxgYbu-Iv6u7yddbs='),
                  loadingBuilder:(context, child, loadingProgress)  {
                    if(loadingProgress==null){
                      return child;
                    }
                    else{
                      return Center(
                        child: CircularProgressIndicator(color: Colors.black),
                      );
                    }
                  },
                ) ;
              },
            ),

          ),
          SizedBox(width: 25),
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      model.title??"title",
                      style: TextStyle(color: Colors.grey, fontSize: 15),maxLines: 1),
                  Text(model.description??"description", style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                      maxLines: 3),
                ],

              ),
            ),
          ),
          SizedBox(width: 30),
          IconButton(onPressed: () async{
            model.saved=!model.saved;
            if(model.saved){
              await db.insert_to_database(model);


            }
            else{
              db.delete_from_databse(model.title??"null");
            }
            db.get_from_database(db.database).then((value) {
              homeController.onInit();
            });

            update();
          }, icon: model.saved?Icon(Iconsax.save_add1):Icon(IconBroken.Bookmark),
            // Icon(IconBroken.Bookmark)
          ),
        ],

      ),
    );
  }
}
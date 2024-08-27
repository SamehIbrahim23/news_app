import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/constants.dart';
import 'package:news_app_ui_setup/models/article.dart';
import 'package:news_app_ui_setup/services/news_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Article> articlList = [];

  getNerws() async {
    articlList = await NewsServices().getData(
        path: ApiConstant.baseUrl + ApiConstant.newsEndpoints,
        query: {"q": "bit", "apiKey": ApiConstant.apiKey});
    setState(() {});
  }

  @override
  void initState() {
    getNerws();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "News",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Cloud",
                  style: TextStyle(
                      color: Colors.orangeAccent, fontWeight: FontWeight.bold),
                ),
              ],
            )),
        body: articlList.isEmpty
            ? const Center(
                child: CircularProgressIndicator(
                color: Colors.yellow,
              ))
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: articlList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.network(
                              articlList[index].urlToImage,
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            )),
                        const SizedBox(
                          height: 9,
                        ),
                        Text(
                          articlList[index].title,
                          maxLines: 2,
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          articlList[index].description,
                          maxLines: 2,
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 14),
                        )
                      ],
                    ),
                  );
                }));
  }
}

// import 'package:flutter/material.dart';
// import 'package:news_app_ui_setup/widgets/categories_list_view.dart';

// import '../widgets/news_list_view_builder.dart';

// class HomeView extends StatelessWidget {
//   const HomeView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//         title: const Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(
//               'News',
//               style: TextStyle(color: Colors.black),
//             ),
//             Text(
//               'Cloud',
//               style: TextStyle(color: Colors.orange),
//             ),
//           ],
//         ),
//       ),
//       body: const Padding(
//         padding: EdgeInsets.symmetric(horizontal: 16),

//         child: CustomScrollView(
//           physics: BouncingScrollPhysics(),
//           slivers: [
            // SliverToBoxAdapter(child: CategoriesListView()),
//             SliverToBoxAdapter(
//               child: SizedBox(
//                 height: 32,
//               ),
//             ),
//             NewsListViewBuilder(
//               category: 'general',
//             ),
//           ],
//         ),
//         // child: Column(
//         //   children: [
//         //     CategoriesListView(),
//         //     SizedBox(
//         //       height: 32,
//         //     ),
//         //     Expanded(child: NewsListView()),
//         //   ],
//         // ),
//       ),
//     );
//   }
// }

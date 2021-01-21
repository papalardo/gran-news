import 'package:app/models/news.dart';
import 'package:app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splashscreen/splashscreen.dart';

import 'news_controller.dart';

class NewsScreen extends StatelessWidget {
  final NewsController controller = Get.find<NewsController>();

  NewsScreen() {
    controller.getPaginated(page: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => RefreshIndicator(
          onRefresh: controller.getPaginated,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Notícias", style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.collection.length,
                  itemBuilder: (ctx, index) {
                    NewsModel _item = controller.collection[index];

                    return Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AspectRatio(
                            aspectRatio: 21 / 9,
                            child: Image(image: NetworkImage(_item.imageUrl + "?t=${DateTime.now().millisecondsSinceEpoch}")),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(_item.title),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ))),
    );
  }
}

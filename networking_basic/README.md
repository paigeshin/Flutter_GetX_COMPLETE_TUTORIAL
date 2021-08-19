```dart
// https://makeup-api.herokuapp.com/api/v1/products.json?brand=marienatie
import '../Model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static var client = http.Client();

  static Future<List<ProductModel>?> fetchProducts() async {
    var response = await client.get(
      Uri.parse(
          'https://makeup-api.herokuapp.com/api/v1/products.json?brand=marienatie'),
    );
    if (response.statusCode == 200) {
      var jsonString = response.body;
      print(jsonString);
      return productFromJson(jsonString);
    }
  }
}
```

```dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:networking_basic/Model.dart';
import 'package:networking_basic/modules/ApiService.dart';
import 'package:networking_basic/modules/AppColor.dart';
import 'package:networking_basic/modules/AppString.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppString.fetchApiData,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductListView(),
    );
  }
}

class ProductController extends GetxController {
  var isLoading = true.obs;
  List<ProductModel?> productList = <ProductModel?>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await ApiService.fetchProducts();
      if (products != null) {
        productList.assignAll(products);
      }
    } finally {
      isLoading(false);
    }
  }
}

class ProductListView extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppString.productList),
      ),
      body: Obx(
        () {
          if (productController.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: productController.productList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 150,
                          height: 100,
                          margin: EdgeInsets.fromLTRB(16, 8, 8, 8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              productController.productList[index]?.imageLink ??
                                  "",
                              width: 150,
                              height: 100,
                              fit: BoxFit.fill,
                              color: AppColor.purpleColor,
                              colorBlendMode: BlendMode.color,
                            ),
                          ),
                        ),
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                productController.productList[index]?.name ??
                                    "",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                productController.productList[index]?.brand ??
                                    "",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColor.grey,
                                ),
                              ),
                              Text(
                                productController
                                        .productList[index]?.category ??
                                    "",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColor.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      color: AppColor.grey200,
                      height: 2,
                    )
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
```

```dart
// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<ProductModel> productFromJson(String str) => List<ProductModel>.from(
    json.decode(str).map((x) => ProductModel.fromJson(x)));

String welcomeToJson(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  ProductModel({
    this.id,
    this.brand,
    this.name,
    this.price,
    this.priceSign,
    this.currency,
    this.imageLink,
    this.productLink,
    this.websiteLink,
    this.description,
    this.rating,
    this.category,
    this.productType,
    this.tagList,
    this.createdAt,
    this.updatedAt,
    this.productApiUrl,
    this.apiFeaturedImage,
    this.productColors,
  });

  int? id;
  String? brand;
  String? name;
  String? price;
  String? priceSign;
  String? currency;
  String? imageLink;
  String? productLink;
  String? websiteLink;
  String? description;
  dynamic rating;
  String? category;
  String? productType;
  List<TagList>? tagList;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? productApiUrl;
  String? apiFeaturedImage;
  List<ProductColor>? productColors;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        brand: json["brand"],
        name: json["name"],
        price: json["price"],
        priceSign: json["price_sign"],
        currency: json["currency"],
        imageLink: json["image_link"],
        productLink: json["product_link"],
        websiteLink: json["website_link"],
        description: json["description"],
        rating: json["rating"],
        category: json["category"],
        productType: json["product_type"],
        tagList: List<TagList>.from(
            json["tag_list"].map((x) => tagListValues.map?[x])),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        productApiUrl: json["product_api_url"],
        apiFeaturedImage: json["api_featured_image"],
        productColors: List<ProductColor>.from(
            json["product_colors"].map((x) => ProductColor.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "brand": brand,
        "name": name,
        "price": price,
        "price_sign": priceSign,
        "currency": currency,
        "image_link": imageLink,
        "product_link": productLink,
        "website_link": websiteLink,
        "description": description,
        "rating": rating,
        "category": category,
        "product_type": productType,
        "tag_list": List<dynamic>.from(
            (tagList ?? []).map((x) => tagListValues.reverse?[x])),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "product_api_url": productApiUrl,
        "api_featured_image": apiFeaturedImage,
        "product_colors":
            List<dynamic>.from((productColors ?? []).map((x) => x.toJson())),
      };
}

class ProductColor {
  ProductColor({
    this.hexValue,
    this.colourName,
  });

  String? hexValue;
  String? colourName;

  factory ProductColor.fromJson(Map<String, dynamic> json) => ProductColor(
        hexValue: json["hex_value"],
        colourName: json["colour_name"],
      );

  Map<String, dynamic> toJson() => {
        "hex_value": hexValue,
        "colour_name": colourName,
      };
}

enum TagList { PURPICKS, CERT_CLEAN, VEGAN, GLUTEN_FREE }

final tagListValues = EnumValues({
  "CertClean": TagList.CERT_CLEAN,
  "Gluten Free": TagList.GLUTEN_FREE,
  "purpicks": TagList.PURPICKS,
  "Vegan": TagList.VEGAN
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      if (map != null) {
        reverseMap = map!.map((k, v) => new MapEntry(v, k));
      }
    }
    return reverseMap;
  }
}
```
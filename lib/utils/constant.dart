import 'package:flutter/material.dart';
import 'package:food_donation/screen/components/simple_product.dart';
import 'package:food_donation/screen1/account_screen.dart';
import 'package:food_donation/screen1/cart_screen.dart';
import 'package:food_donation/screen1/home_screen.dart';
import 'package:food_donation/screen1/more_screen.dart';
import 'package:food_donation/user_Details/product.dart';

// const double kAppBarHeight = 80;
const List<Widget> screens = [
  HomeScreen(),
  AccountScreen(),
  CartScreen(),
  MoreScreen(),
];

const String amazonLogoUrl =
    "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4a/Amazon_icon.svg/2500px-Amazon_icon.svg.png";

const List<String> categoriesList = [
  "Prime",
  "Mobiles",
  "Fashion",
  "Electronics",
  "Home",
  "Fresh",
  "Appliances",
  "Books, Toys",
  "Essential"
];

const List<String> categoryLogos = [
  "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png",
  "https://m.media-amazon.com/images/I/116KbsvwCRL._SX90_SY90_.png",
  "https://m.media-amazon.com/images/I/115yueUc1aL._SX90_SY90_.png",
  "https://m.media-amazon.com/images/I/11qyfRJvEbL._SX90_SY90_.png",
  "https://m.media-amazon.com/images/I/11BIyKooluL._SX90_SY90_.png",
  "https://m.media-amazon.com/images/I/11CR97WoieL._SX90_SY90_.png",
  "https://m.media-amazon.com/images/I/01cPTp7SLWL._SX90_SY90_.png",
  "https://m.media-amazon.com/images/I/11yLyO9f9ZL._SX90_SY90_.png",
  "https://m.media-amazon.com/images/I/11M0jYc-tRL._SX90_SY90_.png",
];

// const List<String> largeAds = [
//   "https://m.media-amazon.com/images/I/51QISbJp5-L._SX3000_.jpg",
//   "https://m.media-amazon.com/images/I/61jmYNrfVoL._SX3000_.jpg",
//   "https://m.media-amazon.com/images/I/612a5cTzBiL._SX3000_.jpg",
//   "https://m.media-amazon.com/images/I/61fiSvze0eL._SX3000_.jpg",
//   "https://m.media-amazon.com/images/I/61PzxXMH-0L._SX3000_.jpg",
// ];

List<String> smallAds = [
  "https://r1imghtlak.mmtcdn.com/082f1ae6330211eb9c050242ac110004.jpg?&output-quality=75&downsize=583:388&output-format=jpg",
  "https://b.zmtcdn.com/data/pictures/4/2004/ab413ceb3dc0587c18cb1ba6893b7917_featured_v2.jpg",
  "https://i.pinimg.com/originals/f3/39/ac/f339ac13e4b5565b075f11f3681071ee.jpg",
  "https://cdn0.weddingwire.in/vendor/4395/3_2/960/jpg/marriage-garden-madhuvan-marriage-garden-event-space-3_15_364395-161536520227548.jpeg",
];

const List<String> adItemNames = [
  "Hotels",
  "Resturants",
  "Public Events",
  "Merriages",
];

//Dont even attemp to scroll to the end of this manually lmao
const String amazonLogo =
    "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Amazon_logo.svg/2560px-Amazon_logo.svg.png";

List<Widget> testChildren = [
  SimpleProductWidget(
    productModel: ProductModel(
        url:
            "https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8NHx8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=60",
        productName: "Food",
        cost: 999,
        discount: 0,
        uid: "eioejfbkn",
        sellerName: "Mayank",
        sellerUid: "123456",
        rating: 1,
        noOfRating: 1),
  ),
  SimpleProductWidget(
    productModel: ProductModel(
        url:
            "https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8NHx8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=60",
        productName: "Food",
        cost: 999,
        discount: 0,
        uid: "eioejfbkn",
        sellerName: "Mayank",
        sellerUid: "123456",
        rating: 1,
        noOfRating: 1),
  ),
  SimpleProductWidget(
    productModel: ProductModel(
        url:
            "https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8NHx8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=60",
        productName: "Food",
        cost: 999,
        discount: 0,
        uid: "eioejfbkn",
        sellerName: "Mayank",
        sellerUid: "123456",
        rating: 1,
        noOfRating: 1),
  ),
  SimpleProductWidget(
    productModel: ProductModel(
        url:
            "https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8NHx8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=60",
        productName: "Food",
        cost: 999,
        discount: 0,
        uid: "eioejfbkn",
        sellerName: "Mayank",
        sellerUid: "123456",
        rating: 1,
        noOfRating: 1),
  ),
  SimpleProductWidget(
    productModel: ProductModel(
        url:
            "https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8NHx8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=60",
        productName: "Food",
        cost: 999,
        discount: 0,
        uid: "eioejfbkn",
        sellerName: "Mayank",
        sellerUid: "123456",
        rating: 1,
        noOfRating: 1),
  )
];
// List<Widget> textChildern = [
//   const SimpleProductWidget(
//       url: "https://m.media-amazon.com/images/I/51QISbJp5-L._SX3000_.jpg"),
//   const SimpleProductWidget(
//       url: "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png"),
//   const SimpleProductWidget(
//       url: "https://m.media-amazon.com/images/I/51QISbJp5-L._SX3000_.jpg"),
//   const SimpleProductWidget(
//       url: "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png"),
//   const SimpleProductWidget(
//       url: "https://m.media-amazon.com/images/I/51QISbJp5-L._SX3000_.jpg"),
//   const SimpleProductWidget(
//       url: "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png"),
// ];

List<String> keysOfRating = [
  "Very bad",
  "Poor",
  "Average",
  "Good",
  "Excellent"
];

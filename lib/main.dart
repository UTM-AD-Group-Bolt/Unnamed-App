import 'package:flutter/material.dart';
import 'package:myapp/pages//HomePage.dart';
import 'package:myapp/pages/favoritePage.dart';
import 'package:myapp/pages/LoadingScreen.dart';
import 'package:myapp/pages/MenuDetailsPage.dart';
import 'package:myapp/pages/registerPage.dart';
import 'package:myapp/pages/signInPage.dart';

import 'package:myapp/models/authenticate.dart';

import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
//
// import 'ReviewPage.dart';
// import 'FaqPage.dart';
// import 'CustomerSupportPage.dart';
// import 'OrderHistoryPage.dart';
// import 'CheckoutPage.dart';
// import 'PaymentMethodPage.dart';
// import 'PaymentSuccessPage.dart';
// import 'ProfilePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    StreamProvider(
      create: (BuildContext context) {  },
      initialData: null,
      child: MaterialApp(
        initialRoute: '/home',
        routes: {
          '/': (context) => LoadingScreen(),
          '/home': (context) => HomePage(),
          '/favorites': (context) => FavoritePage(),
          '/loading': (context) => LoadingScreen(),
          '/menudetails': (context) => MenuDetailsPage(
              1, 'images/Ayam-Goreng.png', 'Ayam Goreng', '5 min', 'Available'),


          // '/review':  (context) => ReviewPage(),
          // '/faq':  (context) => FaqPage(),
          // '/customersupport':  (context) => CustomerSupportPage(),
          // '/orderhistory':  (context) => OrderHistoryPage(),
          '/signin':  (context) => SignInPage(),
          '/register': (context) => RegisterPage(),
          // '/checkout':  (context) => CheckoutPage(),
          // '/paymentmethod':  (context) => PaymentMethodPage(),
          // '/paymentsuccess':  (context) => PaymentSuccessPage(),
          // '/profile':  (context) => ProfilePage(),
        },
      ),
    ),
  );
}

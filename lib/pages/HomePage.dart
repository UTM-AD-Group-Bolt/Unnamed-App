import 'package:flutter/material.dart';
import 'package:myapp/pages/SideNavBarPage.dart';
import 'package:myapp/services/auth.dart';
import 'package:myapp/models/palette.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthService _auth = AuthService();

  Widget _textformField() {
    return Padding(
      padding: EdgeInsets.only(top:10.0, bottom:10.0, right: 20.0),
      child: TextFormField(
        style: TextStyle(
            fontFamily: "DMSans",
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Palette.white
        ),
        decoration: InputDecoration(
            fillColor: Palette.black,
            filled: true,
            hintText: "Search...",
            hintStyle: TextStyle(
                fontFamily: "DMSans",
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Palette.white
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Icon(
                Icons.search,
                size: 32,
                color: Palette.white,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            )),
      ),
    );
  }

  Widget _allCategories({required String image, required String foodName, required String description, required double price, required int indexNo, required BuildContext context}) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/menudetails',arguments: {
          'quantity': 0,
          'image': image,
          'foodName': foodName,
          'description': description,
          'price': price,
          'indexNo': indexNo,
          'deliveryFee': 'Free',
          'time': '5 min',
          'availability': 'Available',
        });
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.only(right: 10.0),
        height: 120,
        width: 150,
        decoration: BoxDecoration(
          color: Palette.black,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(image),
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Text(
                foodName,
                softWrap: false,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: "DMSans",
                  fontSize: 15,
                  color: Palette.white[300],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomCategories({required String image, required String foodName, required String description, required double price, required int indexNo, required BuildContext context}) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/menudetails',arguments: {
          'quantity': 0,
          'image': image,
          'foodName': foodName,
          'description': description,
          'price': price,
          'indexNo': indexNo,
          'deliveryFee': 'Free',
          'time': '5 min',
          'availability': 'Available',
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: Palette.black,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(image),
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  height: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              foodName,
                              softWrap: false,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: "DMSans",
                                fontSize: 15,
                                color: Palette.white[300],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Flexible(

                            child: Text(
                              'RM ${price.toStringAsFixed(2)}',
                              softWrap: false,
                              maxLines: 1,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "DMSans",
                                fontSize: 15,
                                color: Palette.white[300],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Palette.black[700],
      drawer: SideNavBar(),
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(
            fontFamily: "DMSans",
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Palette.black[700],
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(
                Icons.sort,
                color: Palette.yellow,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          },
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(9.0),
            child: Center(
              child: Row(
                children: [
                  Container(
                    width: 50,
                    child: IconButton(
                      constraints: BoxConstraints(),
                      padding: EdgeInsets.zero,
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        elevation: 0.0,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/favorites');
                      },
                      icon: Icon(
                        Icons.favorite,
                        size: 30,
                        color: Colors.pink,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Container(
                    child: IconButton(
                      constraints: BoxConstraints(),
                      padding: EdgeInsets.only(right: 10),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        elevation: 0.0,
                      ),
                      onPressed: () async {
                        Navigator.pushNamed(context, '/fetchingdatapage');
                      },
                      icon: Icon(
                        Icons.shopping_cart,
                        size: 30,
                        color: Palette.yellow,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.only( left: 20.0 ),
        child: ListView(
          children: [
            Container(
              height: 800,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _textformField(),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome to",
                          style: TextStyle(
                            fontFamily: "DMSans",
                            fontSize: 22,
                            color: Palette.white[300],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Pak Atong Kafe",
                          style: TextStyle(
                            fontFamily: "DMSans",
                            fontSize: 32,
                            color: Palette.orange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Your Favorites",
                    style: TextStyle(
                      fontFamily: "DMSans",
                      fontSize: 24,
                      color: Palette.white[300],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _allCategories(
                            image: 'images/food/Ayam-Goreng.png',
                            foodName: 'Ayam Goreng',
                            description: 'Diperbuat daripada ayam goreng',
                            price: 2.3,
                            indexNo: 1,
                            context: context
                        ),
                        _allCategories(
                            image: 'images/food/Ayam-Kari.png',
                            foodName: 'Ayam Kari',
                            description: 'Diperbuat daripada ayam kari',
                            price: 2.4,
                            indexNo: 2,
                            context: context
                        ),
                        _allCategories(
                            image: 'images/food/Ayam-Kunyit.png',
                            foodName: 'Ayam Kunyit',
                            description: 'Diperbuat daripada ayam kunyit',
                            price: 2.5,
                            indexNo: 3,
                            context: context
                        ),
                        _allCategories(
                            image: 'images/food/Cendawan-Goreng.png',
                            foodName: 'Cendawan Goreng',
                            description: 'Diperbuat daripada cendawan goreng',
                            price: 2.6,
                            indexNo: 4,
                            context: context
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Menu",
                    style: TextStyle(
                      fontFamily: "DMSans",
                      fontSize: 23,
                      color: Palette.white[300],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Container(
                      height: 300,
                      child: GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: 1,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        scrollDirection: Axis.vertical,
                        children: [
                          _bottomCategories(
                            image: 'images/food/Ayam-Goreng.png',
                            foodName: 'Ayam Goreng',
                            price: 2.3,
                            description: 'Diperbuat daripada ayam goreng',
                            indexNo: 1,
                            context: context,
                          ),
                          _bottomCategories(
                            image: 'images/food/Ayam-Kari.png',
                            foodName: 'Ayam Kari',
                            price: 2.4,
                            description: 'Diperbuat daripada ayam kari',
                            indexNo: 2,
                            context: context,
                          ),
                          _bottomCategories(
                            image: 'images/food/Ayam-Kunyit.png',
                            foodName: 'Ayam Kunyit',
                            price: 2.5,
                            description: 'Diperbuat daripada ayam kunyit',
                            indexNo: 3,
                            context: context,
                          ),
                          _bottomCategories(
                            image: 'images/food/Cendawan-Goreng.png',
                            foodName: 'Cendawan Goreng',
                            price: 2.6,
                            description: 'Diperbuat daripada cendawan goreng',
                            indexNo: 4,
                            context: context,
                          ),
                          _bottomCategories(
                            image: 'images/food/Daging-Kicap.png',
                            foodName: 'Daging Kicap',
                            price: 2.7,
                            description: 'Diperbuat daripada daging kicap',
                            indexNo: 5,
                            context: context,
                          ),
                          _bottomCategories(
                            image: 'images/food/Kuey-Teow.png',
                            foodName: 'Kuey Teow',
                            price: 2.8,
                            description: 'Diperbuat daripada kuey teow',
                            indexNo: 6,
                            context: context,
                          ),
                          _bottomCategories(
                            image: 'images/food/Mee-Goreng.png',
                            foodName: 'Mee Goreng',
                            price: 2.9,
                            description: 'Diperbuat daripada mee goreng',
                            indexNo: 7,
                            context: context,
                          ),
                          _bottomCategories(
                            image: 'images/food/Nasi-Goreng.png',
                            foodName: 'Nasi Goreng',
                            price: 3.0,
                            description: 'Diperbuat daripada nasi goreng',
                            indexNo: 8,
                            context: context,
                          ),
                          _bottomCategories(
                            image: 'images/food/Sambal-Goreng-Tempe.png',
                            foodName: 'Sambal Goreng Tempe',
                            price: 3.1,
                            description: 'Diperbuat daripada sambal goreng tempe',
                            indexNo: 9,
                            context: context,
                          ),
                          _bottomCategories(
                            image: 'images/food/Sayur-Taugeh.png',
                            foodName: 'Sayur Taugeh',
                            price: 3.2,
                            description: 'Diperbuat daripada sayur taugeh',
                            indexNo: 10,
                            context: context,
                          ),
                          _bottomCategories(
                            image: 'images/food/Tom-Yam.png',
                            foodName: 'Tom Yam',
                            price: 3.3,
                            description: 'Diperbuat daripada tom yam',
                            indexNo: 11,
                            context: context,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
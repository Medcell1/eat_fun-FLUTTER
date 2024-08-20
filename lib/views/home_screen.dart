import 'view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController pageController;
  ValueNotifier<double> pageNotifier = ValueNotifier(0.0);

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.5);
    pageController.addListener(() {
      if (pageController.hasClients && pageController.position.hasPixels) {
        pageNotifier.value = pageController.page ?? 0.0;
      }
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    pageNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    var screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    var screenWidth = MediaQuery
        .of(context)
        .size
        .width;

    PageController categoryPageController = PageController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: screenHeight * 0.3,
              child: CustomPaint(
                painter: CustomCircles(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 40,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.menu,
                    color: Colors.black,
                    size: 26,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(profile),
                  ),
                ],
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: CustomText(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                  text: "Choose the\nFOOD you LOVE",
                  fontFamily: 'Rowdies',
                ),
              ),
              5.spaceHeight(),
              SizedBox(
                height: 35,
                width: screenWidth * .75,
                child: TextField(
                  cursorColor: primaryColor,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 5, horizontal: 8),
                    filled: true,
                    hintText: "Search For a Food Item",
                    hintStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: const Color(
                      0xffF8E0A0,
                    ),
                  ),
                ),
              ),
              (screenHeight * 0.14).spaceHeight(),
              const Align(
                alignment: Alignment.topLeft,
                child: CustomText(
                  textStyle: TextStyle(
                    fontSize: 18,
                  ),
                  text: "Categories",
                  fontFamily: "Rowdies",
                ),
              ),
              20.spaceHeight(),
              Stack(
                children: [
                  SizedBox(
                    height: screenHeight * 0.1,
                    width: screenWidth,
                    child: PageView.builder(
                      controller: categoryPageController,
                      itemCount: 2,
                      itemBuilder: (BuildContext context, int pageIndex) {
                        return ListView.builder(
                          itemCount: categoryNames.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              elevation: 5,
                              color: categoryCardColor,
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10),
                                width: screenWidth * 0.23,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      categoryImages[index],
                                      scale: 2,
                                    ),
                                    const SizedBox(height: 5),
                                    CustomText(
                                      textStyle: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                      text: categoryNames[index],
                                      fontFamily: 'Rowdies',
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 0,
                    bottom: 0,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        if (categoryPageController.page != 0) {
                          categoryPageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_forward_ios),
                      onPressed: () {
                        if (categoryPageController.page != 1) {
                          categoryPageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.topLeft,
                child: CustomText(
                  textStyle: TextStyle(
                    fontSize: 18,
                  ),
                  text: "Burgers",
                  fontFamily: "Rowdies",
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: screenHeight * 0.35,
                child: ValueListenableBuilder<double>(
                  valueListenable: pageNotifier,
                  builder: (context, page, child) {
                    return PageView.builder(
                      controller: pageController,
                      itemCount: burgerData.length,
                      itemBuilder: (context, index) {
                        double scale = (1 - (page - index).abs() * 0.3).clamp(
                            0.9, 1.0);
                        bool isActive = (page - index).abs() < 0.5;
        
                        return Transform.scale(
                          scale: scale,
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 1, vertical: 30),
                            decoration: BoxDecoration(
                              color: isActive ? primaryColor : Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 10,
                                  spreadRadius: 5,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Center(
                                      child: Image.asset(
                                        burgerData[index]['image'],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  CustomText(
                                    textStyle: TextStyle(
                                        color: isActive ? Colors.white : Colors
                                            .black),
                                    text: burgerData[index]['name'],
                                    fontFamily: "Rowdies",
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    burgerData[index]['rating'],
                                    style: const TextStyle(
                                      fontFamily: 'Rowdies',
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  CustomText(
                                    textStyle: TextStyle(
                                        color: isActive ? Colors.white : Colors
                                            .black),
                                    text: burgerData[index]['price'],
                                    fontFamily: "Rowdies",
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
        
          ],
        ),
            ),]
            ,
            ),
      )
    ,
    );
  }
}

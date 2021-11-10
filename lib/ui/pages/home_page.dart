part of "pages.dart";

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFFEF9F9),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 27, 10, 27),
          child: SingleChildScrollView(
            child: Column(
              children: [
                searchFilter(context),
                const SizedBox(
                  height: 20,
                ),
                slider(context),
                const SizedBox(
                  height: 20,
                ),
                listItem(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget searchFilter(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width / 1.75,
          child: TextFormField(
            decoration: InputDecoration(
              hintText: "Cari dengan mengetik barang",
              prefixIcon: const Visibility(
                visible: true,
                child: Icon(Icons.search),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width / 9,
          decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                image: AssetImage("assets/Frame 39.png"),
              )),
        ),
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width / 9,
          decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                image: AssetImage("assets/Frame 41.png"),
              )),
        ),
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width / 9,
          decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                image: AssetImage("assets/Frame 40.png"),
              )),
        ),
      ],
    );
  }

  Widget slider(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 1,
              height: 200,
              enlargeCenterPage: false,
              scrollDirection: Axis.horizontal,
              autoPlay: true,
              pageSnapping: false,
            ),
            items: dummySlider.map((index) {
              return Container(
                width: MediaQuery.of(context).size.width - 40,
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: AssetImage(index), fit: BoxFit.fill)),
              );
            }).toList()),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < dummySlider.length; i++)
              Container(
                width: (i != 1) ? 50.0 : 35.0,
                height: 10.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: (i != 1) ? bottomSliderColor : bottomSliderColor2,
                ),
              )
          ],
        )
      ],
    );
  }

  Widget listItem(BuildContext context) {
    return Wrap(
      runSpacing: 5,
      spacing: 5,
      children: [
        for (int i = 0; i < dummyItems.length; i++)
          Container(
            width: MediaQuery.of(context).size.width / 2 - 20,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              margin: const EdgeInsets.all(10),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width / 2 - 40,
                            height: MediaQuery.of(context).size.width / 2 - 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    image: AssetImage(dummyItems[i].image),
                                    fit: BoxFit.fill))),
                        Container(
                          width: (MediaQuery.of(context).size.width / 2 - 40) /
                              1.75,
                          height:
                              (MediaQuery.of(context).size.width / 2 - 60) / 7,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                  bottomRight: Radius.circular(15)),
                              color: Color(0xFFDFAE1D)),
                          child: Row(
                            children: [
                              Icon(Icons.star,
                                  color: Colors.white,
                                  size:
                                      ((MediaQuery.of(context).size.width / 2 -
                                                  40) /
                                              2) /
                                          5),
                              Container(
                                child: Container(
                                  width:
                                      ((MediaQuery.of(context).size.width / 2 -
                                                  40) /
                                              2) -
                                          20,
                                  child: Text(
                                    "${dummyItems[i].rating} rating",
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 8,
                              child: Text(
                                NumberFormat.currency(
                                        locale: "id_ID",
                                        decimalDigits: 0,
                                        symbol: "Rp ")
                                    .format(dummyItems[i].price),
                                style: const TextStyle(
                                    fontSize: 16,
                                    decoration: TextDecoration.lineThrough,
                                    color: Color(0xFF64A1F4)),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 8,
                              child: Text(
                                NumberFormat.currency(
                                        locale: "id_ID",
                                        decimalDigits: 0,
                                        symbol: "Rp ")
                                    .format(discount(dummyItems[i].price)),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Color(0xFF3C7DD9)),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 7,
                          height: 30,
                          margin: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: const Color(0xFF3C7DD9),
                          ),
                          child: const Center(
                            child: Text("Diskon 10%",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(dummyItems[i].name,
                        textAlign: TextAlign.start,
                        style: const TextStyle(fontWeight: FontWeight.bold))
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }

  int discount(int firstPrice) {
    double courting = (firstPrice * 10) / 100;
    int lastPrice = (firstPrice - courting).toInt();
    return lastPrice;
  }
}

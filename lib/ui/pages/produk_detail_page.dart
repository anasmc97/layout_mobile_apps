part of "pages.dart";

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xFFFEF9F9),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
              child: header(context),
            ),
            const SizedBox(
              height: 15,
            ),
            slider(context),
            const SizedBox(
              height: 15,
            ),
            Container(
              child:
                  Stack(alignment: AlignmentDirectional.bottomStart, children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height + 20,
                  decoration: const BoxDecoration(
                      color: Color(0xFFFF485A),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                      )),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 5),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      topOfProductDetail(context),
                      Container(
                          padding: const EdgeInsets.only(right: 5, left: 20),
                          child: const Divider()),
                      descriptionProduct(context),
                      Container(
                          padding: const EdgeInsets.only(left: 20, top: 15),
                          child: const Text(
                            "Ulasan dan Penilaian",
                            style: TextStyle(
                                color: Color(0xFF47623F),
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          )),
                      review(context, "assets/user1.png", "Maude Hall",
                          "That's a fantastic new app feature. You and your team did an excellent job of incorporating user testing feedback"),
                      review(context, "assets/user2.png", "Ester Howard",
                          "That's a fantastic new app feature. You and your team did an excellent job of incorporating user testing feedback.")
                    ],
                  ),
                ),
              ]),
            )
          ],
        ),
      ),
    ));
  }

  Widget header(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Color(0xFF64A1F4)),
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            const Text(
              "Produk Detail",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF64A1F4)),
            ),
          ],
        ),
        Row(children: [
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width / 9,
            decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  image: AssetImage("assets/shopping_bag.png"),
                )),
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width / 9,
            decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  image: AssetImage("assets/notifications.png"),
                )),
          ),
        ])
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

  Widget topOfProductDetail(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 4,
              padding: const EdgeInsets.only(left: 20),
              child: const Text("SOUNDTECH GOLEM TWS",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                NumberFormat.currency(
                        locale: "id_ID", decimalDigits: 0, symbol: "Rp ")
                    .format(dummyItems[0].price),
                style: const TextStyle(
                    fontSize: 20,
                    decoration: TextDecoration.lineThrough,
                    color: Color(0xFF64A1F4)),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                NumberFormat.currency(
                        locale: "id_ID", decimalDigits: 0, symbol: "Rp ")
                    .format(discount(dummyItems[0].price)),
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color(0xFF3C7DD9)),
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Wrap(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color(0xFFDFAE1D),
                  ),
                  child: const Center(
                    child: Text("Barang Bekas",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                        )),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color(0xFF64A1F4),
                    ),
                    child: const Center(
                      child: Text("Stok 100",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                          )),
                    ))
              ],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
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
      ],
    );
  }

  Widget descriptionProduct(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
          padding: const EdgeInsets.only(left: 20),
          child: const Text(
            "Vendor",
            style: TextStyle(
                color: Color(0xFF47623F),
                fontSize: 16,
                fontWeight: FontWeight.bold),
          )),
      const SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Container(
                height: 50,
                width: 50,
                padding: const EdgeInsets.only(left: 20),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("assets/eiger.png"),
                    )),
              ),
              const SizedBox(
                width: 20,
              ),
              const Text(
                "Eiger Store",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Row(
            children: [
              const Icon(Icons.star, color: Color(0xFF64A1F4)),
              Container(
                padding: const EdgeInsets.only(right: 5),
                child: const Text(
                  "5.0 | 200 Terjual",
                  style: TextStyle(
                      color: Color(0xFF64A1F4), fontWeight: FontWeight.bold),
                ),
              )
            ],
          )
        ],
      ),
      Container(
          padding: const EdgeInsets.only(left: 20, top: 15),
          child: const Text(
            "Deskripsi",
            style: TextStyle(
                color: Color(0xFF47623F),
                fontSize: 16,
                fontWeight: FontWeight.bold),
          )),
      Container(
          padding: const EdgeInsets.only(left: 20, top: 15, right: 5),
          child: const Text(
            "Deskripsi In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.",
            style:
                TextStyle(color: Color(0xFF47623F), fontSize: 16, height: 1.5),
          )),
    ]);
  }

  Widget review(
      BuildContext context, String image, String name, String comment) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Container(
              //padding: const EdgeInsets.only(left: 20),
              width: MediaQuery.of(context).size.width - 40,
              //height: 120,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 35,
                              width: 35,
                              padding: const EdgeInsets.only(left: 20),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(image),
                                  )),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(name,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                const Text("14 min",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color: Color(0xFFB4BBC6)))
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: const [
                            Icon(Icons.star, color: Color(0xFFFA4A0C)),
                            Text("5.0",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(
                              width: 10,
                            )
                          ],
                        )
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Text(comment),
                    )
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }

  int discount(int firstPrice) {
    double courting = (firstPrice * 10) / 100;
    int lastPrice = (firstPrice - courting).toInt();
    return lastPrice;
  }
}

part of "pages.dart";

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({Key? key}) : super(key: key);

  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  int? itemAmount = 0;
  //List<Item> newDummySavedNoted = dummySavedNoted;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xFFFEF9F9),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 10, top: 30, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(context),
              const SizedBox(
                height: 10,
              ),
              item(context),
              note(context, "Catatan Item"),
              for (int i = 0; i < dummySavedNoted.length; i++)
                Slidable(
                  child: savedItem(context, dummySavedNoted[i]),
                  actionPane: const SlidableDrawerActionPane(),
                  secondaryActions: [
                    IconSlideAction(
                      caption: 'Delete',
                      color: const Color(0xFFFEF9F9),
                      iconWidget: Container(
                        height: 50,
                        width: 50,
                        padding: const EdgeInsets.only(left: 20),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage("assets/delete.png"),
                            )),
                      ),
                      onTap: () {
                        setState(() {
                          dummySavedNoted.removeAt(i);
                        });
                      },
                    ),
                  ],
                ),
              note(context, "Catatan Pemesanan"),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Detail Pembayaran",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  bill(context, "Tas Gucci", 75000, quantity: 1),
                  bill(context, "Tas Eiger", 75000, quantity: 1),
                  bill(context, "Ongkos Kirim", 10000),
                  Container(
                      padding: const EdgeInsets.only(right: 5),
                      child: const Divider()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Text(
                            "SubTotal",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const Text(
                        "Rp 450.000",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  buttonWidget(context, "Waktu Pengantaran"),
                  const SizedBox(
                    height: 10,
                  ),
                  buttonWidget(context, "Alamat Pengiriman"),
                  const SizedBox(
                    height: 10,
                  ),
                  paragraph(context,
                      "Tolong pastikan semua pesanan anda sudah benar dan tidak kurang."),
                  const SizedBox(height: 30),
                  buttonWidget(context, "Bayar Sekarang",
                      withArrow: false, size: 15)
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Widget header(BuildContext context) {
    return Row(
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
          "Checkout",
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF64A1F4)),
        ),
      ],
    );
  }

  Widget item(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 15),
      width: MediaQuery.of(context).size.width - 40,
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
                      height: 100,
                      width: MediaQuery.of(context).size.width / 5,
                      padding: const EdgeInsets.only(left: 20),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage("assets/item1.jpg"),
                              fit: BoxFit.cover)),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 3,
                              child: const Text("SOUNDTECH GOLEM TWS",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 3,
                              child: Text(
                                NumberFormat.currency(
                                        locale: "id_ID",
                                        decimalDigits: 0,
                                        symbol: "Rp ")
                                    .format(dummyItems[0].price),
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF64A1F4)),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(right: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: const Color(0xFF3C7DD9),
                        ),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                if (itemAmount != 0) {
                                  setState(() {
                                    itemAmount = itemAmount! - 1;
                                  });
                                }
                              },
                              child: const Icon(Icons.horizontal_rule,
                                  size: 12, color: Colors.white),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text("$itemAmount",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 16)),
                            const SizedBox(
                              width: 5,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  itemAmount = itemAmount! + 1;
                                });
                              },
                              child: const Icon(Icons.add,
                                  size: 15, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: const Color(0xFF64A1F4),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text("Catatan",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }

  Widget savedItem(BuildContext context, Item item) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 15),
          width: MediaQuery.of(context).size.width - 40,
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
                          height: 100,
                          width: MediaQuery.of(context).size.width / 5,
                          padding: const EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(item.image),
                                  fit: BoxFit.cover)),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width / 3,
                                  child: Text(item.name,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width / 3,
                                  child: Text(
                                    NumberFormat.currency(
                                            locale: "id_ID",
                                            decimalDigits: 0,
                                            symbol: "Rp ")
                                        .format(item.price),
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF64A1F4)),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            margin: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 2.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: const Color(0xFF64A1F4),
                            ),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: const Icon(Icons.horizontal_rule,
                                      size: 12, color: Colors.white),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text("1",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 16)),
                                const SizedBox(
                                  width: 5,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: const Icon(Icons.add,
                                      size: 15, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            margin: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 2.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: const Color(0xFF3C7DD9),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width / 7,
                                  child: const Text("Hapus Catatan",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
        savedNote(context, item),
      ],
    );
  }

  Widget note(BuildContext context, String title) {
    return Container(
      padding: const EdgeInsets.only(bottom: 15),
      width: MediaQuery.of(context).size.width - 40,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: const TextStyle(
                    color: Color(0xFF47623F),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextFormField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: "Ketik Disini ...",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget savedNote(BuildContext context, Item item) {
    return Container(
      padding: const EdgeInsets.only(bottom: 15),
      width: MediaQuery.of(context).size.width - 40,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Catatan Item",
                style: TextStyle(
                    color: Color(0xFF47623F),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                item.note ?? "",
                style: const TextStyle(
                  color: Color(0xFF8A7F7F),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bill(BuildContext context, String itemName, int price,
      {int? quantity}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              itemName,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            (quantity != null)
                ? Text(
                    "(Qty $quantity)",
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w400),
                  )
                : Container()
          ],
        ),
        Text(
          NumberFormat.currency(
                  locale: "id_ID", decimalDigits: 0, symbol: "Rp ")
              .format(price),
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        )
      ],
    );
  }

  Widget buttonWidget(BuildContext context, String name,
      {bool withArrow = true, double? size}) {
    return Container(
      padding: (size == null) ? const EdgeInsets.all(8) : EdgeInsets.all(size),
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: const Color(0xFF3C7DD9),
      ),
      child: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: (withArrow)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                        )),
                    const Icon(Icons.arrow_forward_ios, color: Colors.white)
                  ],
                )
              : Center(
                  child: Text(name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)))),
    );
  }

  Widget paragraph(BuildContext context, String text) {
    return Container(
      height: 150,
      padding: const EdgeInsets.only(bottom: 15),
      width: MediaQuery.of(context).size.width - 40,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              text,
              style: const TextStyle(
                color: Color(0xFF8A7F7F),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

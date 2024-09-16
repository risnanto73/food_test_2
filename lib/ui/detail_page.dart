part of 'pages.dart';

class DetailPage extends StatefulWidget {
  const DetailPage(
      {super.key, required this.onBackButtonPressed, required this.food});

  final Function onBackButtonPressed;
  final Food food;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: mainColor,
          ),
          SafeArea(
            child: Container(
              color: Colors.white,
            ),
          ),
          SafeArea(
            child: Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    widget.food?.picturePath ??
                        'https://ui-avatars.com/api/?name=${widget.food!.name}',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SafeArea(
            child: ListView(
              children: [
                //Back Button
                Container(
                  height: 100,
                  padding: const EdgeInsets.symmetric(
                    horizontal: defaultMargin,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        if (widget.onBackButtonPressed != null) {
                          widget.onBackButtonPressed!();
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(3),
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.black12,
                        ),
                        child: Image.asset(
                          'assets/back_arrow_white.png',
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 180),
                  padding: EdgeInsets.symmetric(
                    vertical: 26,
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //Food Name
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${widget.food.name}',
                                  style: blackFontStyle1,
                                  maxLines: 2,
                                ),
                                SizedBox(height: 6),
                                RatingStars(rate: widget.food.rate),
                              ],
                            ),
                          ),
                          // Food Quantity
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    quantity = max(1, quantity - 1);
                                  });
                                },
                                child: Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('assets/btn_min.png'),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 50,
                                child: Text(
                                  quantity.toString(),
                                  textAlign: TextAlign.center,
                                  style: blackFontStyle3.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    quantity = min(999, quantity + 1);
                                  });
                                },
                                child: Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('assets/btn_add.png'),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      //Food Description
                      Container(
                        margin: EdgeInsets.fromLTRB(
                          0,
                          14,
                          0,
                          16,
                        ),
                        child: Text(
                          widget.food!.description!,
                          style: blackFontStyle3,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      //Ingredients
                      Row(
                        children: [
                          Text(
                            'Ingredients ',
                            style: blackFontStyle3,
                          ),
                          Icon(
                            Icons.info,
                            color: mainColor,
                            size: 20,
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                          0,
                          4,
                          0,
                          16,
                        ),
                        child: Text(widget.food!.ingredients!),
                      ),
                      //Price
                      Container(
                        margin: EdgeInsets.only(bottom: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Total Price ',
                                  style: blackFontStyle3,
                                ),
                                Icon(
                                  Icons.monetization_on,
                                  color: mainColor,
                                  size: 20,
                                ),
                              ],
                            ),
                            Text(
                              NumberFormat.currency(
                                      symbol: 'IDR ',
                                      decimalDigits: 0,
                                      locale: 'id_ID')
                                  .format(
                                quantity * widget.food!.price!,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      //Button Order
                      SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: mainColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                15,
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Order Now',
                            style: blackFontStyle3.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

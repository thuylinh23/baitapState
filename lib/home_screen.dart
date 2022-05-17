import 'package:baitapstate/button_widget.dart';
import 'package:baitapstate/statistical_widget.dart';
import 'package:baitapstate/strings.dart';
import 'package:baitapstate/utils/colors.dart';
import 'package:flutter/material.dart';

import 'input_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController? userNameController;
  TextEditingController? quantityController;
  bool ischecked = false;
  String money = "0";
  String totalCustomer = "0";
  String totalCusAndVip = "0";
  String total = "0";
  int bookPrice = 20000;
  late FocusNode myFocusNode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userNameController = TextEditingController();
    quantityController = TextEditingController();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    myFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.all(10),
                width: size.width,
                color: CustomColor.mainColor,
                child: Column(
                  children: [
                    Text(
                      Strings.title,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Container(
                        padding: const EdgeInsets.only(top: 5),
                        alignment: Alignment.topLeft,
                        child: Text(
                          Strings.invoiceInformation,
                          style: const TextStyle(
                              color: CustomColor.textButtonColor,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                )),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                            Strings.customerName,
                            style:
                                TextStyle(color: CustomColor.textButtonColor),
                          ),
                          flex: 1),
                      Expanded(
                        child: InputWidget(
                          hintText: Strings.customerName,
                          controller: userNameController,
                          myFocusNode: myFocusNode,
                        ),
                        flex: 2,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                            Strings.numberOfBooks,
                            style:
                                TextStyle(color: CustomColor.textButtonColor),
                          ),
                          flex: 1),
                      Expanded(
                        child: InputWidget(
                          hintText: Strings.numberOfBooks,
                          controller: quantityController,
                          myFocusNode: FocusNode(),
                        ),
                        flex: 2,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 115),
                    child: Row(
                      children: [
                        Checkbox(
                            value: ischecked,
                            fillColor: MaterialStateProperty.resolveWith(
                                (states) => CustomColor.checkCustomerVIPColor),
                            onChanged: (bool? value) {
                              setState(() {
                                ischecked = value!;
                              });
                            }),
                        Text(Strings.customerVip),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(Strings.intoMoney),
                        flex: 1,
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            money,
                            textAlign: TextAlign.center,
                          ),
                          color: CustomColor.buttonColor,
                        ),
                        flex: 2,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ButtonWidget(
                          onpressed: () {
                            ischecked == true
                                ? money =
                                    ((int.parse(quantityController!.text) *
                                                bookPrice) *
                                            0.9)
                                        .toString()
                                : money = (int.parse(quantityController!.text) *
                                        bookPrice)
                                    .toString();
                            setState(() {});
                          },
                          textButton: Strings.countIntoMoney,
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        child: ButtonWidget(
                          onpressed: () {
                            ischecked == true
                                ? totalCusAndVip =
                                    (int.parse(totalCusAndVip) + 1).toString()
                                : totalCustomer =
                                    (int.parse(totalCustomer) + 1).toString();
                            total = (double.parse(total) + double.parse(money))
                                .toString();
                            userNameController!.text = "";
                            quantityController!.text = "";
                            ischecked = false;
                            money = "0";
                            myFocusNode.requestFocus();
                            setState(() {});
                          },
                          textButton: Strings.continute,
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        child: ButtonWidget(
                          onpressed: () {
                            _AlertDialog(context, total);
                          },
                          textButton: Strings.statistical,
                        ),
                        flex: 1,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Text(Strings.infoStatistical),
              color: CustomColor.mainColor,
              width: size.width,
              padding: const EdgeInsets.all(5),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  StatisticalWidget(
                    text: Strings.totalCustomers,
                    total: totalCustomer,
                  ),
                  StatisticalWidget(
                    text: Strings.totalCustomerandVIP,
                    total: totalCusAndVip,
                  ),
                  StatisticalWidget(
                    text: Strings.total,
                    total: total,
                  ),
                ],
              ),
            ),
            Container(
              color: CustomColor.mainColor,
              padding: EdgeInsets.all(13),
            ),
            Container(
              padding: EdgeInsets.all(5),
              alignment: Alignment.topRight,
              child: GestureDetector(
                child: Icon(Icons.exit_to_app),
                onTap: () {
                  _showDialog(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Bạn có chắc chắn muốn thoát không?",
            style: TextStyle(fontSize: 14),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text("Thoát"),
              style: ElevatedButton.styleFrom(primary: CustomColor.mainColor),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _AlertDialog(BuildContext context, String info) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            " Tổng doanh thu là : ${info = total}",
            style: TextStyle(fontSize: 14),
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text("Thoát"),
              style: ElevatedButton.styleFrom(primary: CustomColor.mainColor),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

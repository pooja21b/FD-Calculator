import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MaterialApp (
  home: HomeScreen(),
));

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  TextEditingController _controller3 = TextEditingController();
  double interest = 0.0;
  double total = 0.0;

  void calculation() {
    try {
      final calInterestRate = (double.parse(_controller2.text) / 100 / 12);
      final calInterest = calInterestRate * int.parse(_controller1.text);
      setState(() {
        interest = calInterest;
        total = int.parse(_controller1.text) + interest;
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.notes,
          size: 30,
          color: Colors.white,
        ),
        toolbarHeight: 30,
        backgroundColor: Colors.blue,
        elevation: 5,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Icon(Icons.info,
              size: 30,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: body(),
    );
  }

  Widget body() {
    return Container(
      color: Colors.grey[100],
      child: Column(
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(100),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Fixed Deposit",
                      style: GoogleFonts.robotoMono(
                          fontSize: 35,
                          color: Colors.white),
                    ),
                    Text("Calculator",
                      style: GoogleFonts.robotoMono(
                          fontSize: 35,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 20, 50, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                inputForm(
                    title: "Deposit Amount:",
                    controller: _controller1,
                    hinttext: "e.g 20000"),
                inputForm(
                    title: "Annual Interest Rate(%):",
                    controller: _controller2,
                    hinttext: "e.g 8"
                ),
                inputForm(
                    title: "Period (in month):",
                    controller: _controller3,
                    hinttext: "e.g 6"
                ),
                SizedBox(height: 10),

                GestureDetector(
                  onTap: () {
                    calculation();
                  },
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                      child: Text("CALCULATE",
                        style: GoogleFonts.robotoMono(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                interest != 0.0 ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Result:",
                      style: GoogleFonts.robotoMono(fontSize: 20),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Text("Interest: RM ${interest.toStringAsFixed(2)}",
                        style: GoogleFonts.robotoMono(fontSize: 20),
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Text("Total: RM ${total.toStringAsFixed(2)}",
                        style: GoogleFonts.robotoMono(fontSize: 20),
                      ),
                    ),
                  ],
                ) : SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget inputForm({
    required String title,
    required TextEditingController controller,
    required String hinttext
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.robotoMono(fontSize: 20),
        ),
        SizedBox(height: 5),
        Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide.none),
              hintText: hinttext,
            ),
          ),
        ),
      ],
    );
  }
}

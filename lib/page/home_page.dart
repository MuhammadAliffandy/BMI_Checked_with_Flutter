import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  dynamic result = '';
  dynamic status = '';
  TextEditingController tinggiValue = TextEditingController();
  TextEditingController beratValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String username = arguments['username'];
    final String email = arguments['email'];
    final String password = arguments['password'];

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 33, 32, 33),
      body: SingleChildScrollView(
          child: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // head line
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50.0),
                  bottomRight: Radius.circular(50.0),
                ),
                color: Color.fromARGB(255, 19, 19, 19),
              ),
              height: 350,
              width: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Halo ${username}',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Selamat melakukan pengecekan BMI',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: 330,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(61, 83, 83, 83),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Hasil BMI : ${result}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${status}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            // input field bmi
// ===============================================================================
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 45, horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: tinggiValue,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(117, 83, 81, 81),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.amber),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        labelText: 'Tinggi Badan',
                        labelStyle: TextStyle(color: Color.fromARGB(112, 255, 255, 255)),
                        floatingLabelStyle: TextStyle(color: Colors.amber),
                        hintText: 'Masukkan Tinggi Badan',
                        hintStyle: TextStyle(color: Color.fromARGB(112, 255, 255, 255)),
                      ),
                    ),
                  ),

// ===============================================================================

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: beratValue,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(117, 83, 81, 81),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.amber),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          labelText: 'Berat Badan',
                          labelStyle: TextStyle(color: Color.fromARGB(112, 255, 255, 255)),
                          floatingLabelStyle: TextStyle(color: Colors.amber),
                          hintText: 'Masukkan Berat Badan',
                          hintStyle: TextStyle(color: Color.fromARGB(112, 255, 255, 255))),
                    ),
                  ),

                  // button sign in
// ===============================================================================

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: ElevatedButton(
                      onPressed: () {
                        double berat = double.tryParse(beratValue.text) ?? 0;
                        double tinggiAwal = double.tryParse(tinggiValue.text) ?? 0;
                        double tinggiAkhir = tinggiAwal / 100;
                        dynamic hasil = (berat / (tinggiAkhir * tinggiAkhir));
                        dynamic hasilBmi = hasil.toStringAsFixed(1);

                        if (hasil < 18.5) {
                          setState(() {
                            result = hasilBmi;
                            status = 'Berat badan anda Kurang';
                          });
                        } else if (hasil > 18.5 && hasil < 22.9) {
                          setState(() {
                            result = hasilBmi;
                            status = 'Berat badan anda Normal';
                          });
                        } else if (hasil > 23 && hasil < 29.9) {
                          setState(() {
                            result = hasilBmi;
                            status = 'Berat badan anda Berlebih';
                          });
                        } else {
                          setState(() {
                            result = hasilBmi;
                            status = 'Anda Obesitas';
                          });
                        }
                      },
                      child: Text(
                        'Hitung',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.amber),
                        minimumSize: MaterialStateProperty.all(Size(370, 60)),
                        padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(horizontal: 16),
                        ),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        final Map<String, dynamic> arguments = {
                          'username': username,
                          'email': email,
                          'password': password
                        };
                        Navigator.pushNamed(
                          context,
                          '/login',
                          arguments: arguments,
                        );
                      },
                      child: Text(
                        'Log out',
                        style: TextStyle(color: Colors.amber),
                      ),
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(Size(0, 0)),
                      )),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}

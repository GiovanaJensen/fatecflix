import 'package:fatecflix/screens/home.dart';
import 'package:flutter/material.dart';

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("lib/assets/images/logo_fatec_flix.png"),
              SizedBox(height: 30,),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                      color: Colors.white), 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        4.0), 
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                child: Text(
                  "Iniciar".toUpperCase(),
                  style: const TextStyle(color: Colors.white ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

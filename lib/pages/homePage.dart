import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imc/components/ageSelector.dart';
import 'package:imc/components/heightSelector.dart';
import 'package:imc/components/primaryButton.dart';
import 'package:imc/components/ractButton.dart';
import 'package:imc/components/themeChangeBtn.dart';
import 'package:imc/components/weightSelector.dart';
import 'package:imc/controllers/bmiController.dart';
import 'package:imc/pages/resultPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    BmiController bmiController = Get.put(BmiController());

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const ThemeChangeBtn(),
              Row(
                children: [
                  Text(
                    "Bem-Vindo(a)! 😀",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Calculador De IMC",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  PrimaryButton(
                    icon: Icons.male,
                    btnName: "Masculino",
                    onPress: () {
                      bmiController.genderHandle('Masculino');
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  PrimaryButton(
                    icon: Icons.female,
                    btnName: "Feminino",
                    onPress: () {
                      bmiController.genderHandle('Feminino');
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HeightSelector(),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          WeightSelector(),
                          SizedBox(height: 30),
                          AgeSelector(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              MyRactButton(
                onPress: () {
                  bmiController.calculateBMI();
                  Get.to(const ResultPage());
                },
                btnName: "Vamos Lá!",
                icon: Icons.done,
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imc/components/ractButton.dart';
import 'package:imc/controllers/bmiController.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    BmiController bmiController = Get.put(BmiController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SafeArea(
          child: Column(
            children: [
              const Row(
                children: [
                  BackButton(),
                  Text('Voltar'),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Obx(
                    () => Text(
                      "Seu IMC é:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        color: bmiController.colorStattus.value,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                  child: Obx(
                () => CircularPercentIndicator(
                  animationDuration: 1000,
                  footer: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "${bmiController.BMIstatus.value}",
                      style: TextStyle(
                        color: bmiController.colorStattus.value,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  radius: 130,
                  lineWidth: 30,
                  animation: true,
                  circularStrokeCap: CircularStrokeCap.round,
                  percent: bmiController.tempBMI.value / 100,
                  center: Text(
                    "${bmiController.BMI.value}",
                    style: TextStyle(
                        color: bmiController.colorStattus.value,
                        fontSize: 80,
                        fontWeight: FontWeight.bold),
                  ),
                  progressColor: bmiController.colorStattus.value,
                  backgroundColor:
                      bmiController.colorStattus.value.withOpacity(0.2),
                ),
              )),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(10),
                child: Text(
                  "${bmiController.BMItext.value}",
                ),
              ),
              const SizedBox(height: 80),
              MyRactButton(
                onPress: () {
                  Get.back();
                },
                btnName: "Medir Novamente!",
                icon: Icons.arrow_back_ios_new_outlined,
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}

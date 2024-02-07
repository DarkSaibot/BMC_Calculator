import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BmiController extends GetxController {
  RxString Gender = "Masculino".obs;
  RxInt weight = 12.obs;
  RxInt age = 12.obs;
  RxDouble height = 100.0.obs;
  RxString BMI = "".obs;
  RxDouble tempBMI = 0.0.obs;
  RxString BMIstatus = "".obs;
  Rx<Color> colorStattus = Color(0xff246AFE).obs;
  RxString BMItext = "".obs;

  void genderHandle(String gender) {
    Gender.value = gender;
  }

  void calculateBMI() {
    var Hmeter = height / 100;
    tempBMI.value = weight / (Hmeter * Hmeter);
    BMI.value = tempBMI.toStringAsFixed(1);
    tempBMI.value = double.parse(BMI.value);
    findStatus();
    print(BMI);
  }

  void findStatus() {
    if (tempBMI.value < 18.5) {
      BMIstatus.value = "Abaixo Do Peso";
      colorStattus.value = Color(0xffFFB800);
      BMItext.value =
          'Seu IMC indica que você está abaixo do peso ideal. Converse com seu médico para entender os riscos e encontrar um plano para alcançar um peso saudável e se sentir bem!';
    }
    if (tempBMI.value > 18.5 && tempBMI.value < 24.9) {
      BMIstatus.value = "Normal";
      colorStattus.value = Color(0xff00CA39);
      BMItext.value =
          "Seu IMC é ${tempBMI.value}, indicando que seu peso está na categoria 'Normal'. Para a sua altura, uma faixa de peso normal seria de 53,5 a 72 kg. Manter um peso saudável pode reduzir o risco de doenças crônicas associadas ao sobrepeso e à obesidade.";
    }
    if (tempBMI.value > 25.0 && tempBMI.value < 29.9) {
      BMIstatus.value = "Acima Do Peso";
      colorStattus.value = Color(0xffFF5858);
      BMItext.value =
          "Seu IMC é ${tempBMI.value}, indicando que seu peso está na categoria 'Acima Do Peso'. Vamos juntos buscar um estilo de vida mais saudável para sua saúde e bem-estar! Converse com um profissional de saúde e encontre o caminho certo para você.";
    }
    if (tempBMI.value > 30.0 && tempBMI.value < 34.9) {
      BMIstatus.value = "Obeso";
      colorStattus.value = Color(0xffFF0000);
      BMItext.value =
          "Seu IMC é ${tempBMI.value}, indicando que seu peso está na categoria 'Obeso'. Sua saúde pede atenção! O IMC alto aumenta o risco de doenças graves, por isso agende uma consulta com seu médico ou nutricionista.";
    }
    if (tempBMI.value > 35.0) {
      BMIstatus.value = "Muito Obeso";
      colorStattus.value = Color(0xff000000);
      BMItext.value =
          "Seu IMC indica Obesidade Extrema, um risco grave à saúde. Procure ajuda médica para um plano personalizado de perda de peso e acompanhamento. Priorize sua saúde!";
    }
  }
}

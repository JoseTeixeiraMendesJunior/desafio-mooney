import 'package:desafio_mooney/controllers/registerController.dart';
import 'package:desafio_mooney/layouts/global_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: GlobalColor.backgraund,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            padding: const EdgeInsets.all(15),
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [GlobalColor.backgraund, GlobalColor.gradient],
              ),
            ),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  const BackToPage(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 24,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          'Criar Conta Como:',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  const CardsProfiles(),
                  const Expanded(child: SizedBox()),
                  NextPageButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CardsProfiles extends StatelessWidget {
  const CardsProfiles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Profile(
          image: 'assets/images/woman.png',
          name: 'Adulto',
          description: 'Que vai acompanhar a educação de um jovem',
          id: 1,
        ),
        Profile(
          image: 'assets/images/boy.png',
          name: 'Jovem',
          description: 'Que vai aprender a administrar seu dinheiro',
          id: 2,
        ),
      ],
    );
  }
}

class Profile extends StatelessWidget {
  Profile({
    Key? key,
    required this.image,
    required this.name,
    required this.description,
    required this.id,
  }) : super(key: key);

  final String image;
  final String name;
  final String description;
  final int id;
  final registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Obx(
        () => GestureDetector(
          onTap: () => registerController.updateProfile(id),
          child: Container(
            padding: const EdgeInsets.all(8),
            width: 150,
            // height: 150,
            decoration: BoxDecoration(
                color: GlobalColor.contrast,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                    color: registerController.profileSelected.value == id
                        ? GlobalColor.active
                        : Colors.transparent,
                    width: 3)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(image), fit: BoxFit.contain),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white60),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BackToPage extends StatelessWidget {
  const BackToPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextButton.icon(
          onPressed: () => print('back to'),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
            size: 14,
          ),
          label: const Text(
            'Voltar',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}

class NextPageButton extends StatelessWidget {
  NextPageButton({
    Key? key,
  }) : super(key: key);

  final registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      child: Row(
        children: [
          Expanded(
            child: Obx(
              () => Opacity(
                opacity:
                    registerController.profileSelected.value == 0 ? 0.3 : 1.0,
                child: ElevatedButton(
                  onPressed: () => registerController.GoToNextPage(),
                  child: const Text('Avançar'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

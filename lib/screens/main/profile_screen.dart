import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zero_waste_kitchen/utils/constants.dart';

import '../auth/auth_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Profile",
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder(
        future: context.read<AuthController>().getCurrentUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(
              color: Constants.kPrimaryColor,
              strokeWidth: 3,
            ));
          }
          if (snapshot.hasError) {
            return const Center(child: Text("Something went wrong"));
          }
          if (snapshot.data != null) {
            final user = snapshot.data!;

            return Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(user.imgUrl))),
                  ),
                  const SizedBox(height: 10),
                  Text(user.name,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          )),
                  const SizedBox(height: 10),
                  Text(user.email,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 20,
                          )),
                  const SizedBox(height: 10),
                  const Divider(color: Colors.grey),
                  const SizedBox(height: 10),
                  ProfileDataBox(
                    title: user.isDonor
                        ? "Certified Donor "
                        : "Certified Beneficiary",
                    number: null,
                    icon: Icons.check_circle,
                    color: Colors.green,
                  ),
                  const SizedBox(height: 10),
                  ProfileDataBox(
                    title: user.isDonor
                        ? "No. of Donations"
                        : "No. of Beneficiaries",
                    number: (user.noOfServices ?? 0).toString(),
                    icon: Icons.favorite,
                    color: Colors.red,
                  ),
                  const SizedBox(height: 20),
                  //logout button
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () async {
                        await context.read<AuthController>().logout(context);
                      },
                      child: const Text("Logout"),
                    ),
                  )
                ],
              ),
            );
          }
          return const Center(child: Text("Something went wrong"));
        },
      ),
    );
  }
}

class ProfileDataBox extends StatelessWidget {
  final String title;
  final String? number;
  final IconData icon;
  final Color color;

  const ProfileDataBox(
      {super.key,
      required this.title,
      required this.number,
      required this.color,
      required this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color.fromARGB(255, 240, 245, 245),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Column(
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.black,
                          fontSize: number == null ? 24 : 18,
                          // fontWeight: number == null ? FontWeight.bold : null,
                        ),
                  ),
                  if (number != null) ...[
                    const SizedBox(height: 5),
                    Text(
                      number!,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.black,
                          ),
                    ),
                  ]
                ],
              ),
              const Spacer(),
              Icon(
                icon,
                color: color,
                size: 45,
              )
            ],
          ),
        ],
      ),
    );
  }
}

import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:zero_waste_kitchen/screens/sucess_donation_request.dart';
import 'package:zero_waste_kitchen/utils/constants.dart';
import 'package:zero_waste_kitchen/widgets/widgets.dart';

import 'screens.dart';

enum DishCategory { veg, nonveg }

class CreateDonationPost extends StatefulWidget {
  const CreateDonationPost({super.key});

  @override
  State<CreateDonationPost> createState() => _CreateDonationPostState();
}

class _CreateDonationPostState extends State<CreateDonationPost> {
  File? _image;
  final _imagePicker = ImagePicker();
  selectImage() async {
    final choosedImage =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (choosedImage != null) {
      setState(() {
        _image = File(choosedImage.path);
      });
    }
  }

  DishCategory selectedCategory = DishCategory.veg;

  bool _isAccepted = false;

  final TextEditingController _foodNameController = TextEditingController();
  final TextEditingController _foodQuantity = TextEditingController();
  final TextEditingController cookingDate = TextEditingController(
    text: DateFormat('yyyy-MM-dd').format(
      DateTime.now(),
    ),
  );
  final TextEditingController cookingTime = TextEditingController(
    text: DateFormat('h:mm a').format(
      DateTime.now(),
    ),
  );
  final TextEditingController expirationDate = TextEditingController(
    text: DateFormat('yyyy-MM-dd').format(
      DateTime.now(),
    ),
  );
  final TextEditingController expirationTime = TextEditingController(
    text: DateFormat('h:mm a').format(
      DateTime.now(),
    ),
  );

  @override
  void dispose() {
    super.dispose();
    _foodNameController.dispose();
    _foodQuantity.dispose();
    cookingDate.dispose();
    cookingTime.dispose();
    expirationDate.dispose();
    expirationTime.dispose();
  }

  dateSelect(BuildContext context, TextEditingController controller) async {
    final DateTime todayDate = DateTime.now();
    final DateTime? choosedDate = await showDatePicker(
      context: context,
      initialDate: todayDate,
      firstDate: todayDate,
      lastDate: DateTime(2025),
    );
    if (choosedDate != null) {
      controller.text = DateFormat('yyyy-MM-dd').format(choosedDate);
    }
    setState(() {});
  }

  void showSnackBar(String title, BuildContext context) {
    final snackbar = SnackBar(
      content: Text(title),
      duration: const Duration(seconds: 1),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  timeSelect(BuildContext context, TextEditingController controller) async {
    final TimeOfDay presentTime = TimeOfDay.now();
    final TimeOfDay? choosedTime = await showTimePicker(
      context: context,
      initialTime: presentTime,
    );
    if (choosedTime != null) {
      final now = DateTime.now();
      final DateTime pickedDateTime = DateTime(
          now.year, now.month, now.day, choosedTime.hour, choosedTime.minute);
      controller.text = DateFormat('h:mm a').format(pickedDateTime);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: null,
        ),
        centerTitle: false,
        title: Text(
          "Create Donation Post",
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: const [
          IconButton(
            onPressed: null,
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: Constants.kHorizontalPadding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Food Details",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Constants.kPrimaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Divider(
                height: 5,
                color: Constants.kBlackColor,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Select Food Type",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Constants.kGrey, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  FoodType(
                      color: selectedCategory == DishCategory.veg
                          ? Constants.kPrimaryColor
                          : Constants.kGrey,
                      onPressed: () {
                        if (selectedCategory != DishCategory.veg) {
                          selectedCategory = DishCategory.veg;
                          setState(() {});
                        }
                      },
                      type: "Veg"),
                  const SizedBox(
                    width: 15,
                  ),
                  FoodType(
                      color: selectedCategory == DishCategory.nonveg
                          ? Constants.kPrimaryColor
                          : Constants.kGrey.shade500,
                      onPressed: () {
                        if (selectedCategory != DishCategory.nonveg) {
                          selectedCategory = DishCategory.nonveg;
                          setState(() {});
                        }
                      },
                      type: "Non-Veg")
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Food Name",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Constants.kGrey, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                keyboardType: TextInputType.name,
                controller: _foodNameController,
                decoration: InputDecoration(
                  hintText: "Enter the food name",
                  hintStyle: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: Constants.kGrey),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Food Quantity (in person)",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Constants.kGrey, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: _foodQuantity,
                decoration: InputDecoration(
                  hintText: "Enter the number of people",
                  hintStyle: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: Constants.kGrey),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  DateTimeBox(
                    dateTime: cookingDate.text,
                    onPressed: () {
                      dateSelect(context, cookingDate);
                    },
                    type: "Cooking Date",
                    icon: const Icon(
                      Icons.calendar_month,
                      color: Constants.kPrimaryColor,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  DateTimeBox(
                    dateTime: cookingTime.text,
                    onPressed: () {
                      timeSelect(context, cookingTime);
                    },
                    type: "Cooking Time",
                    icon: const Icon(
                      Icons.access_time,
                      color: Constants.kPrimaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  DateTimeBox(
                    dateTime: expirationDate.text,
                    onPressed: () {
                      dateSelect(context, expirationDate);
                    },
                    type: "Expiration Date",
                    icon: const Icon(
                      Icons.calendar_month,
                      color: Constants.kPrimaryColor,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  DateTimeBox(
                    dateTime: expirationTime.text,
                    onPressed: () {
                      timeSelect(context, expirationTime);
                    },
                    type: "Expiration Time",
                    icon: const Icon(
                      Icons.access_time,
                      color: Constants.kPrimaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Photo",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Constants.kGrey, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              DottedBorder(
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: _image == null
                      ? IconButton(
                          onPressed: selectImage,
                          icon: const Icon(Icons.add_a_photo),
                        )
                      : kIsWeb
                          ? Image.network(_image!.path)
                          : Image.file(
                              _image!,
                              fit: BoxFit.fill,
                            ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Checkbox(
                    activeColor: Constants.kPrimaryColor,
                    value: _isAccepted,
                    onChanged: (bool? value) {
                      setState(
                        () {
                          _isAccepted = value!;
                        },
                      );
                    },
                  ),
                  Expanded(
                    child: Text(
                      "I assure that food quantity and hygiene has maintained.",
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: Constants.kGrey, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_foodNameController.text.isEmpty) {
                      return showSnackBar(
                          "Please enter the food name", context);
                    } else if (_foodQuantity.text.isEmpty) {
                      return showSnackBar(
                          "Food quantity can't be empty", context);
                    } else if (_isAccepted == false) {
                      return showSnackBar(
                          "Please accept the terms and conditions", context);
                    }
                    // all fields are validated
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const SucessDonationRequest()));
                  },
                  child: const Text(
                    "Next",
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

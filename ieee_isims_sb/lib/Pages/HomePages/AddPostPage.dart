import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ieee_isims_sb/Colors/colors.dart';
import 'package:ieee_isims_sb/fonts/Typographie.dart';
import 'package:ieee_isims_sb/utils/ResponsiveSizeCalculator.dart';
import 'package:line_icons/line_icon.dart';

class Addpostpage extends StatefulWidget {
  const Addpostpage({super.key});

  @override
  State<Addpostpage> createState() => _AddpostpageState();
}

final _formPostkey = GlobalKey<FormState>();
TextEditingController _dateController = TextEditingController();

class _AddpostpageState extends State<Addpostpage> {
  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 200)));

    if (_picked != null) {
      setState(() {
        _dateController.text = _picked.toString().split(" ")[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg_col,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(s().p(context, 16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: LineIcon.arrowLeft()),
                Gap(s().p(context, 27)),
                Form(
                  key: _formPostkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Title",
                          style:
                              Typographie.H5(context).copyWith(color: black)),
                      Gap(s().p(context, 8)),
                      TextFormField(
                        validator: (value) {},
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 255, 255, 255),
                          hintStyle: Typographie.Placeholder(context),
                          hintText: "Enter Your Title",
                        ),
                      ),
                      Gap(s().p(context, 20)),
                      Text("Deadline",
                          style:
                              Typographie.H5(context).copyWith(color: black)),
                      Gap(s().p(context, 8)),
                      TextFormField(
                        readOnly: true,
                        controller: _dateController,
                        onTap: () {
                          _selectDate();
                        },
                        validator: (value) {},
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.calendar_today),
                          filled: true,
                          fillColor: Color.fromARGB(255, 255, 255, 255),
                          hintStyle: Typographie.Placeholder(context),
                          hintText: "Enter Deadline",
                        ),
                      ),
                      Gap(s().p(context, 20)),
                      Text("Body*",
                          style:
                              Typographie.H5(context).copyWith(color: black)),
                      Gap(s().p(context, 8)),
                      TextFormField(
                        maxLines: 6,
                        keyboardType: TextInputType.multiline,
                        validator: (value) {},
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 255, 255, 255),
                          hintStyle: Typographie.Placeholder(context),
                          hintText: "Enter Your Body",
                        ),
                      ),
                      Gap(s().p(context, 20)),
                      Text("Form Link",
                          style:
                              Typographie.H5(context).copyWith(color: black)),
                      Gap(s().p(context, 8)),
                      TextFormField(
                        validator: (value) {},
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 255, 255, 255),
                          hintStyle: Typographie.Placeholder(context),
                          hintText: "Form Link",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

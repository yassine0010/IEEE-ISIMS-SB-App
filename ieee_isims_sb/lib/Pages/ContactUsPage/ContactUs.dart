import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ieee_isims_sb/Colors/colors.dart';
import 'package:ieee_isims_sb/Services/ContactUsService.dart';
import 'package:ieee_isims_sb/fonts/Typographie.dart';
import 'package:ieee_isims_sb/models/ContactUsModel.dart';
import 'package:ieee_isims_sb/utils/ResponsiveSizeCalculator.dart';

class Contactus extends StatefulWidget {
  const Contactus({super.key});

  @override
  State<Contactus> createState() => _ContactusState();
}

final _formPostkey = GlobalKey<FormState>();

TextEditingController TitleController = TextEditingController();
TextEditingController BodyController = TextEditingController();

class _ContactusState extends State<Contactus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg_col,
      body: SingleChildScrollView(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(s().p(context, 16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Contact Us",
                          style: Typographie.H4(context)
                              .copyWith(color: primary_col),
                        ),
                      ),
                    ],
                  ),
                  Gap(s().p(context, 32)),
                  Text(
                    "Have something to share with us?",
                    style: Typographie.NormalText(context),
                  ),
                  Gap(s().p(context, 24)),
                  Text(
                    "Whether you have a question, face an issue, or want to share an idea, we’re all ears! Feel free to express yourself—your feedback and suggestions are always welcome.",
                    style: Typographie.Body(context)
                        .copyWith(fontSize: s().p(context, 14)),
                  ),
                  Gap(s().p(context, 24)),
                  Form(
                    autovalidateMode: AutovalidateMode.always,
                    key: _formPostkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Title",
                            style:
                                Typographie.H5(context).copyWith(color: black)),
                        Gap(s().p(context, 8)),
                        TextFormField(
                          controller: TitleController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please write The Title";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromARGB(255, 255, 255, 255),
                            hintStyle: Typographie.Placeholder(context),
                            hintText: "Enter Your Title",
                          ),
                        ),
                        Gap(s().p(context, 20)),
                        Text("Body",
                            style:
                                Typographie.H5(context).copyWith(color: black)),
                        Gap(s().p(context, 8)),
                        TextFormField(
                          controller: BodyController,
                          maxLines: 8,
                          keyboardType: TextInputType.multiline,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Body is Empty ";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromARGB(255, 255, 255, 255),
                            hintStyle: Typographie.Placeholder(context),
                            hintText: "Get in touch with us!",
                          ),
                        ),
                        Gap(s().p(context, 32)),
                        Row(
                          children: [
                            const Spacer(),
                            Expanded(
                                child: GestureDetector(
                                    onTap: () async {
                                      if (_formPostkey.currentState!
                                          .validate()) {
                                        ContactUs contactUsTicket = ContactUs(
                                            cTitle: TitleController.text,
                                            cContent: BodyController.text);
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return popup(
                                              ticket: contactUsTicket,
                                            );
                                          },
                                        );
                                      }
                                    },
                                    child: Container(
                                      height: s().p(context, 46),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              s().p(context, 12)),
                                          color: primary_col),
                                      child: Center(
                                        child: Text("Submit",
                                            style: Typographie.ActionBouttom(
                                                    context)
                                                .copyWith(color: white)),
                                      ),
                                    )))
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class popup extends StatelessWidget {
  final ContactUs ticket;
  const popup({
    super.key,
    required this.ticket,
  });

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      insetPadding: const EdgeInsets.all(0),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(s().p(context, 8))),
      children: [
        Padding(
          padding: EdgeInsets.all(s().p(context, 8)),
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.80,
            height: s().p(context, 90),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Are You Sure?",
                        style: Typographie.H5(context)
                            .copyWith(color: const Color(0xff54595E))),
                  ],
                ),
                Gap(s().p(context, 16)),
                Row(
                  children: [
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: s().p(context, 30),
                                vertical: s().p(context, 8)),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2, color: primary_col),
                                color: Colors.white,
                                borderRadius:
                                    BorderRadiusDirectional.circular(50)),
                            child: Center(
                                child: Text(
                              "No , Cancel",
                              style: Typographie.Placeholder(context)
                                  .copyWith(color: primary_col),
                            )),
                          ),
                        ],
                      ),
                    ),
                    Gap(s().p(context, 16)),
                    GestureDetector(
                      onTap: () async {
                        if (await Uploadticket(ticket)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                backgroundColor: Colors.green,
                                content: Text('ticket Succsesfully Updated')),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                backgroundColor:
                                    Color.fromARGB(255, 172, 36, 36),
                                content: Text('Error')),
                          );
                        }

                        Navigator.pop(context);
                      },
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: s().p(context, 30),
                                vertical: s().p(context, 8)),
                            decoration: BoxDecoration(
                                border: Border.all(width: 1),
                                color: primary_col,
                                borderRadius:
                                    BorderRadiusDirectional.circular(50)),
                            child: Center(
                                child: Text("Yes I'm Sure",
                                    style: Typographie.Placeholder(context)
                                        .copyWith(color: white))),
                          ),
                        ],
                      ),
                    ),
                    const Spacer()
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

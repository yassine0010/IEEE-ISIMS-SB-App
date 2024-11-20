import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:ieee_isims_sb/Colors/colors.dart';
import 'package:ieee_isims_sb/Pages/HomePages/Components/Dialog.dart';
import 'package:ieee_isims_sb/fonts/Typographie.dart';
import 'package:ieee_isims_sb/models/PostModel.dart';
import 'package:ieee_isims_sb/utils/ImagePicker.dart';
import 'package:ieee_isims_sb/utils/ResponsiveSizeCalculator.dart';
import 'package:line_icons/line_icon.dart';

class Addpostpage extends StatefulWidget {
  final int? id;
  final Post? post;
  final String? PopUpText;
  const Addpostpage({super.key, this.id, this.post, this.PopUpText});

  @override
  State<Addpostpage> createState() => _AddpostpageState();
}

Uint8List? file;

final _formPostkey = GlobalKey<FormState>();

TextEditingController _dateController = TextEditingController();
TextEditingController TitleController = TextEditingController();
TextEditingController BodyController = TextEditingController();
TextEditingController FormLinkController = TextEditingController();

class _AddpostpageState extends State<Addpostpage> {
  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 200)));

    if (picked != null) {
      setState(() {
        _dateController.text = picked.toString().split(" ")[0];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.post != null) {
      TitleController.text = widget.post!.title ?? '';
      FormLinkController.text = widget.post!.formLink ?? '';
      BodyController.text = widget.post!.postContent ?? '';
      if (widget.post!.image != null && widget.post!.image!.isNotEmpty) {
        file = widget.post!.image;
      } else {
        file = null;
      }
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
                    child: const LineIcon.arrowLeft()),
                Gap(s().p(context, 27)),
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
                        decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.calendar_today),
                          filled: true,
                          fillColor: const Color.fromARGB(255, 255, 255, 255),
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
                          hintText: "Enter Your Body",
                        ),
                      ),
                      Gap(s().p(context, 20)),
                      Text("Form Link",
                          style:
                              Typographie.H5(context).copyWith(color: black)),
                      Gap(s().p(context, 8)),
                      TextFormField(
                        controller: FormLinkController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromARGB(255, 255, 255, 255),
                          hintStyle: Typographie.Placeholder(context),
                          hintText: "Form Link",
                        ),
                      ),
                      Gap(s().p(context, 20)),
                      Text(
                        "Add A photo",
                        style: Typographie.H5(context).copyWith(color: black),
                      ),
                      Gap(s().p(context, 8)),
                      GestureDetector(
                        onTap: () async {
                          Uint8List? myfile = await getImages();
                          if (myfile != null) {
                            setState(() {
                              file = myfile;
                            });
                          }
                        },
                        child: file == null
                            ? Container(
                                height: 300,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1),
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Center(
                                  child: LineIcon.photoVideo(
                                    size: s().p(context, 40),
                                  ),
                                ),
                              )
                            : Container(
                                height: 300,
                                decoration: BoxDecoration(
                                    border: Border.all(width: 1),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: MemoryImage(file!))),
                              ),
                      ),
                      Gap(s().p(context, 54)),
                      Row(
                        children: [
                          const Spacer(),
                          Expanded(
                              child: GestureDetector(
                            onTap: () async {
                              if (_formPostkey.currentState!.validate()) {
                                Post newpost = Post(
                                    formLink: FormLinkController.text.isNotEmpty
                                        ? FormLinkController.text
                                        : null,
                                    image: file,
                                    postContent: BodyController.text,
                                    postDeadline: _dateController.text,
                                    title: TitleController.text);
                                if (widget.post != null) {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return popup(
                                        id: widget.post?.id,
                                        PopUpText: widget.PopUpText!,
                                        post: newpost,
                                      );
                                    },
                                  );
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return popup(
                                        PopUpText:
                                            "Sure You Want To Uplod This Post?",
                                        post: newpost,
                                      );
                                    },
                                  );
                                }
                              }
                            },
                            child: Container(
                              height: s().p(context, 46),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(s().p(context, 12)),
                                  color: primary_col),
                              child: Center(
                                child: Text(
                                    widget.PopUpText ==
                                            "Sure You Want To Update This Post?"
                                        ? "Update"
                                        : "Post",
                                    style: Typographie.ActionBouttom(context)
                                        .copyWith(color: white)),
                              ),
                            ),
                          ))
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
    );
  }
}

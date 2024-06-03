import 'package:application/models/profile.dart';
import 'package:application/utils/app_constatnts.dart';
import 'package:application/views/widgets/navigation_rail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  String name = "";
  String email = "";

  void _showEditProfileSheet() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return Padding(
          padding: EdgeInsets.all(20.sp),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: name.isNotEmpty ? 'New name: ' : 'Name',
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your name';
                    } else {
                      setState(() {
                        name = value;
                      });
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10.sp),
                TextFormField(
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: name.isNotEmpty ? 'New email: ' : 'Email',
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your email';
                    } else {
                      setState(() {
                        email = value;
                      });
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10.sp),
                InkWell(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      Profile profile = Profile(name: name, email: email);
                      Navigator.of(context).pop();
                    }

                    setState(() {});
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    padding: EdgeInsets.all(10.sp),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(8.sp),
                    ),
                    child: Text(
                      'Save',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 20.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _profileView() {
    return Column(
      children: [
        SizedBox(height: 50.sp),
        InkWell(
          onTap: _showEditProfileSheet,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(8.sp),
            ),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.blue,
              ),
              title: name.isNotEmpty
                  ? Text(name)
                  : const Text('Undefined name'),
              subtitle: email.isNotEmpty
                  ? Text(email)
                  : const Text('Undefined email'),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppConstatnt.screenW > 600
        ? Row(
            children: [
              navigationRailWidget(context),
              Expanded(child: _profileView()),
            ],
          )
        : Padding(
            padding: EdgeInsets.all(20.sp),
            child: Center(child: _profileView()),
          );
  }
}

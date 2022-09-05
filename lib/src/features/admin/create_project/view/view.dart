import 'package:flutter/material.dart';
import 'package:ks_smart/src/widgets/widgets.dart';
import 'package:ks_smart/src/widgets/widgets/appbar.dart';

import '../../../../config/light_theme.dart';

class CreateProjectView extends StatelessWidget {
  const CreateProjectView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: LightTheme.primary,
        appBar: const CustomAppBar(),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomHead(text: 'Create Project'),
                const SizedBox(height: 20),
                CustomTextField(
                  label: 'ProjectName',
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Please enter some text';
                    } else if (text.length < 4) {
                      return 'Please enter valid Project';
                    }
                    return null;
                  },
                ),
                CustomTextField(
                  label: 'ProjectDate : dd/mm/yyyy',
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Please enter some text';
                    } else if (text.length < 10) {
                      return 'Please enter valid ProjectDate';
                    }
                    return null;
                  },
                ),
                CustomTextField(
                  label: 'CompanyName(Name,Carch,Phrase)',
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Please enter some text';
                    } else if (text.length < 4) {
                      return 'Please enter valid CompanyName(Name,Carch,Phrase)';
                    }
                    return null;
                  },
                ),
                CustomTextField(
                  label: 'Website',
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Please enter some text';
                    } else if (RegExp(
                            r'^((?:.|\n)*?)((http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?)')
                        .hasMatch(text)) {
                      return 'Please enter valid Website';
                    }
                    return null;
                  },
                ),
                CustomTextField(
                  label: 'Location',
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Please enter some text';
                    } else if (text.length < 4) {
                      return 'Please enter valid Location';
                    }
                    return null;
                  },
                ),
                CustomTextField(
                  label: 'AssignUser',
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Please enter some text';
                    } else if (text.length < 4) {
                      return 'Please enter valid Project';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                CustomButton(
                  height: 60,
                  width: 180,
                  textSize: 22,
                  onTap: () {},
                  label: 'Submit',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

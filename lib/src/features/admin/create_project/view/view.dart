import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ks_smart/src/features/admin/create_project/create_admin.dart';
import 'package:ks_smart/src/widgets/widgets.dart';

import '../../../../config/light_theme.dart';

class CreateProjectView extends StatefulWidget {
  const CreateProjectView({Key? key, required}) : super(key: key);

  @override
  State<CreateProjectView> createState() => _CreateProjectViewState();
}

class _CreateProjectViewState extends State<CreateProjectView> {
  final TextEditingController projectName = TextEditingController();

  final TextEditingController projectDate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: LightTheme.primary,
        appBar: const CustomAppBar(),
        body: Stack(
          children: [
            Visibility(
              visible: context
                  .select((CreateProjectCubit element) => element.fetched),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomHead(text: 'Create Project'),
                      const SizedBox(height: 20),
                      CustomTextField(
                        label: 'ProjectName',
                        controller: projectName,
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
                        controller: projectDate,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Please enter some text';
                          } else if (text.length < 10) {
                            return 'Please enter valid ProjectDate';
                          }
                          return null;
                        },
                      ),
                      CustomDropDownButton(
                          label: context.select((CreateProjectCubit element) =>
                                  element.company) ??
                              'company',
                          listModel: context
                              .select((CreateProjectCubit element) =>
                                  element.detailsModels)
                              .map((e) => e.company?.name.toString())
                              .toList(),
                          onChanged: (value) => setState(
                                () => context
                                    .read<CreateProjectCubit>()
                                    .company = value,
                              )),
                      const SizedBox(height: 20),
                      CustomDropDownButton(
                        label: context.select((CreateProjectCubit element) =>
                                element.website) ??
                            'website',
                        listModel: context
                            .select((CreateProjectCubit element) =>
                                element.detailsModels)
                            .map((e) => e.website.toString())
                            .toList(),
                        onChanged: (value) => setState(
                          () => context.read<CreateProjectCubit>().website =
                              value,
                        ),
                      ),
                      const SizedBox(height: 20),
                      CustomDropDownButton(
                        label: context.select(
                                (CreateProjectCubit element) => element.city) ??
                            'city',
                        listModel: context
                            .select((CreateProjectCubit element) =>
                                element.detailsModels)
                            .map((e) => e.address?.city.toString())
                            .toList(),
                        onChanged: (value) => setState(() =>
                            context.read<CreateProjectCubit>().city = value),
                      ),
                      const SizedBox(height: 20),
                      CustomDropDownButton(
                        label: context.select(
                                (CreateProjectCubit element) => element.user) ??
                            'AssignUser',
                        listModel: context
                            .select(
                                (CreateProjectCubit element) => element.users)
                            .map((e) => e.toString())
                            .toList(),
                        onChanged: (value) => setState(() =>
                            context.read<CreateProjectCubit>().user = value),
                      ),
                      const SizedBox(height: 20),
                      CustomButton(
                        height: 60,
                        width: 180,
                        textSize: 22,
                        onTap: () =>
                            context.read<CreateProjectCubit>().validate(
                                  projectName: projectName.text,
                                  projectDate: projectDate.text,
                                  context: context,
                                ),
                        label: 'Submit',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: BlocBuilder<CreateProjectCubit, CreateProjectState>(
                builder: (context, state) {
                  if (state is LoadingState) {
                    return CircularProgressIndicator(
                      color: LightTheme.secondary,
                      strokeWidth: 10,
                    );
                  } else if (state is ErrorState) {
                    return Text(
                      'Something Went Wrong !',
                      style: TextStyle(
                        color: LightTheme.secondary,
                        fontWeight: FontWeight.w700,
                        fontSize: 25,
                      ),
                    );
                  } else if (state is NetworkErrorState) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Connection Refused !',
                          style: TextStyle(
                              color: LightTheme.secondary,
                              fontWeight: FontWeight.w700,
                              fontSize: 25),
                        ),
                        const SizedBox(height: 20),
                        CustomButton(
                          height: 50,
                          width: 100,
                          textSize: 18,
                          onTap: () =>
                              context.read<CreateProjectCubit>().fetchData(),
                          label: 'Retry',
                        ),
                      ],
                    );
                  } else if (state is LoadedState) {
                    return const SizedBox();
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

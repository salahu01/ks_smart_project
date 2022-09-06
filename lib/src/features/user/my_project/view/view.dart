import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ks_smart/src/features/user/my_project/cubit/cubit.dart';

import '../../../../config/light_theme.dart';
import '../../../../widgets/widgets.dart';

class MyProjectView extends StatelessWidget {
  const MyProjectView({Key? key, required this.userName}) : super(key: key);
  final String userName;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: LightTheme.primary,
        appBar: const CustomAppBar(),
        body: BlocProvider(
          create: (context) => MyProjectCubit(userName),
          child: BlocBuilder<MyProjectCubit, MyProjectState>(
            builder: (context, state) {
              if (state is LoadingState) {
                return Center(
                  child: CircularProgressIndicator(
                    color: LightTheme.secondary,
                    strokeWidth: 10,
                  ),
                );
              } else if (state is ErrorState) {
                return Center(
                  child: Text(
                    'Something Went Wrong !',
                    style: TextStyle(
                      color: LightTheme.secondary,
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                    ),
                  ),
                );
              } else if (state is NetworkErrorState) {
                return Center(
                  child: Column(
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
                            context.read<MyProjectCubit>().fetchData(userName),
                        label: 'Retry',
                      ),
                    ],
                  ),
                );
              } else if (state is LoadedState) {
                if (state.projects.isEmpty) {
                  return Center(
                    child: Text(
                      'Empty Projects !',
                      style: TextStyle(
                          color: LightTheme.secondary,
                          fontWeight: FontWeight.w700,
                          fontSize: 25),
                    ),
                  );
                }
                return Column(
                  children: [
                    const CustomHead(text: 'My Projects'),
                    const SizedBox(height: 30),
                    ListView.separated(
                      itemCount: state.projects.length,
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider();
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          color: LightTheme.theme,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '# ${index + 1}',
                                      style: TextStyle(
                                        color: LightTheme.secondary,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 23,
                                      ),
                                    ),
                                    Text(
                                      'Date : ${state.projects[index].projectDate.toString()}',
                                      style: TextStyle(
                                        color: LightTheme.secondary,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  state.projects[index].projectName.toString(),
                                  style: TextStyle(
                                    color: LightTheme.secondary,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 25,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'company : ${state.projects[index].companyName.toString()}',
                                  style: TextStyle(
                                    color: LightTheme.secondary,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'web : ${state.projects[index].website.toString()}',
                                  style: TextStyle(
                                    color: LightTheme.secondary,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'location : ${state.projects[index].city.toString()}',
                                  style: TextStyle(
                                    color: LightTheme.secondary,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}

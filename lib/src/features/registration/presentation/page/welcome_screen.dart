import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meal/src/core/config/style.dart';
import 'package:meal/src/features/registration/presentation/bloc/member_bloc.dart';

import '../bloc/welcome_validation_cubit.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<MemberBloc, MemberState>(
        listenWhen: (context, state) {
          return (state is MemberLoading) || (state is MemberLoaded);
        },
        listener: (context, state) {
          if (state is MemberLoading) {
            showDialog(
                //barrierColor: Colors.transparent,

                context: context,
                builder: (context) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FittedBox(
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 209, 208, 208),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: CircularProgressIndicator(
                              color: primarycolor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                });
          }
          if (state is MemberLoaded) {
            //Navigator.pop(context);
            print(
                "[WelcomeScreen] member state is $state | ${state.member.id} - ${state.member.name}");
            Modular.to.navigate('/');
          }
        },
        child: Column(
          children: [
            Flexible(
                flex: 6,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    'assets/welcome.png',
                    fit: BoxFit.fill,
                  ),
                )),
            Flexible(
                flex: 7,
                child: ListView(
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: defaultpadding),
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: 'Welcome Back',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600)),
                          TextSpan(
                              text: '\nNice to meet you again!',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w300))
                        ]))),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultpadding, vertical: defaultpadding),
                      child: TextField(
                        controller: _nameController,
                        onChanged: (val) {
                          context.read<WelcomeValidationCubit>().validate(val);
                        },
                        decoration: InputDecoration(
                            hintText: 'Your name here',
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: primarycolor, width: 0.5)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black.withOpacity(0.6),
                                    width: 0.5))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultpadding),
                      child: BlocBuilder<WelcomeValidationCubit, bool>(
                          builder: (context, state) {
                        return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                backgroundColor: primarycolor),
                            onPressed: state
                                ? () async {
                                    context
                                        .read<MemberBloc>()
                                        .add(AddMember(_nameController.text));
                                  }
                                : null,
                            child: Text('GET STARTED'));
                      }),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

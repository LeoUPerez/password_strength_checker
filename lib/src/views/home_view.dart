import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_strength_checker/src/bloc/global_bloc.dart';
import 'package:password_strength_checker/src/common/app_colors.dart';
import 'package:password_strength_checker/src/components/check_requeriments.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalBloc, GlobalState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: AppColors.black,
            title: const Text(
              'Create Your Account',
              style: TextStyle(color: AppColors.white, fontSize: 20),
            ),
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.height * 0.03),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.black,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Set a password",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        "Kindly generate a strong password that adheres to the following criteria",
                        style: TextStyle(color: AppColors.grey),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 28),
                        child: TextFormField(
                          onChanged: (value) => context
                              .read<GlobalBloc>()
                              .add(RequerimentsChecking(value)),
                          obscureText: state.seePassword,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 15),
                            border: const OutlineInputBorder(),
                            suffixIcon: IconButton(
                              icon: state.seePassword
                                  ? const Icon(Icons.remove_red_eye)
                                  : const Icon(Icons.remove_red_eye_outlined),
                              onPressed: () {
                                context
                                    .read<GlobalBloc>()
                                    .add(SeePassword(!state.seePassword));
                              },
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      CheckRequeriments(
                          checking: state.cantNecessaryCharacters,
                          textInfo: "Contains at least 8 characters"),
                      CheckRequeriments(
                          textInfo: "Contains Uppercase",
                          checking: state.containsUppercaseLetter),
                      CheckRequeriments(
                          textInfo: "Contains Lowercase",
                          checking: state.containsLowercaseLetter),
                      CheckRequeriments(
                          textInfo: "Contains at least 1 number",
                          checking: state.containsNumbers),
                      CheckRequeriments(
                          textInfo: "Contains Symbols (?#@)",
                          checking: state.containsSymbols),
                    ],
                  ),
                ),
              ),
              Positioned(
                  child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color.fromARGB(255, 73, 28, 197),
                      ),
                      width: MediaQuery.of(context).size.width * .9,
                      child: TextButton(
                          onPressed: null,
                          child: Text(
                            "Create Account".toUpperCase(),
                            style: const TextStyle(color: AppColors.white),
                          ))),
                ),
              )),
            ],
          ),
        );
      },
    );
  }
}

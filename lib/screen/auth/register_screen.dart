import 'package:flutter_application_4/cubit/create_users/create_user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class FormInput extends StatelessWidget {
  final String name;
  final TextEditingController controller;
  const FormInput({super.key, required this.name, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$name:", style: TextStyle(fontWeight: FontWeight.w600)),
          SizedBox(height: 4),
          TextField(controller: controller),
        ],
      ),
    );
  }
}

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _registerUser({
    required String nama,
    required String username,
    required String password,
  }) async {
    if (_namaController.text.trim().isEmpty ||
        _usernameController.text.trim().isEmpty ||
        _passwordController.text.trim().isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("field jan ada yang kosong >:(")));

      return;
    }

    context.read<CreateUserCubit>().createUser(
      nama: nama,
      username: username,
      password: password,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<CreateUserCubit, CreateUserState>(
        listener: (context, state) {
          state.maybeWhen(
            failure: (errorMessage) {
              return showBottomSheet(
                context: context, 
                builder: (context) {
                  return Column(
                    children: [
                      Text(errorMessage)
                    ],
                  );
                }
              );
            },
            success: (_) {
              return showBottomSheet(
                context: context, 
                builder: (context) {
                  return Column(
                    children: [
                      Text("rejister berhjasil !!1!!!!!111!!111")
                    ],
                  );
                }
              );
            },
            orElse: () {}
          );
        },
        child: Stack(
          children: [
            SvgPicture.asset(
              "assets/image/stacked-peaks-haikei.svg",
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
        
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 400,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 32),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Text(
                      "rejister",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
        
                    SizedBox(height: 24),
        
                    FormInput(name: "nama", controller: _namaController),
                    SizedBox(height: 12),
                    FormInput(name: "username", controller: _usernameController),
                    SizedBox(height: 12),
                    FormInput(name: "password", controller: _passwordController),
        
                    BlocBuilder<CreateUserCubit, CreateUserState>(
                      builder: (context, state) {
                        final isLoading = state.maybeWhen(
                          loading: () => true,
                          orElse: () => false,
                        );
        
                        return FilledButton(
                          onPressed: () => _registerUser(
                            nama: _namaController.text.trim(),
                            username: _usernameController.text.trim(),
                            password: _passwordController.text.trim(),
                          ),
                          child: isLoading
                              ? CircularProgressIndicator(
                                color: Theme.of(context).colorScheme.onPrimary
                              )
                              : Text("rejister"),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
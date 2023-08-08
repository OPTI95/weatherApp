import 'package:book/features/login/presentation/cubit/login_cubit.dart';
import 'package:book/features/weather/presentation/pages/weather_page.dart';
import 'package:book/helpers/text_style/custom_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});
  TextEditingController loginController =
      TextEditingController();
  TextEditingController passwordController =
      TextEditingController();
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool viewPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Text(
                "Вход",
                style: CustomTextStyle.H1(context)
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                "Введите данные для входа ",
                style: CustomTextStyle.B2(context).copyWith(color: Colors.grey),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: TextField(
                  controller: widget.loginController,
                  style:
                      CustomTextStyle.B1(context).copyWith(color: Colors.black),
                  cursorWidth: 1.4,
                  maxLines: 1,
                  cursorHeight: 17,
                  cursorColor: Colors.red,
                  decoration: InputDecoration(
                      floatingLabelStyle: CustomTextStyle.B2(context)
                          .copyWith(color: Colors.grey),
                      labelStyle: CustomTextStyle.B1(context)
                          .copyWith(color: Colors.grey),
                      labelText: "Email",
                      border: const UnderlineInputBorder(),
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey))),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              TextField(
                controller: widget.passwordController,
                style:
                    CustomTextStyle.B1(context).copyWith(color: Colors.black),
                cursorWidth: 1.4,
                maxLines: 1,
                cursorHeight: 17,
                obscureText: viewPassword ? false : true,
                cursorColor: Colors.red,
                decoration: InputDecoration(
                    floatingLabelStyle: CustomTextStyle.B2(context)
                        .copyWith(color: Colors.grey),
                    labelStyle: CustomTextStyle.B1(context)
                        .copyWith(color: Colors.grey),
                    labelText: "Пароль",
                    suffixIcon: IconButton(
                        onPressed: () {
                          viewPassword = !viewPassword;
                          setState(() {});
                        },
                        icon: ImageIcon(
                          viewPassword
                              ? const AssetImage("images/icon-outline-eye.png")
                              : const AssetImage(
                                  "images/icon-outline-eye-off-2.png"),
                          color: Colors.blue,
                        )),
                    border: const UnderlineInputBorder(),
                    focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey))),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 48),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 48,
                        child: ElevatedButton(
                            style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.blue)),
                            onPressed: () async {
                              await context.read<LoginCubit>().auth(
                                  widget.loginController.text,
                                  widget.passwordController.text);
                              if (context.read<LoginCubit>().state
                                  is LoginLoadedState) {
                                await Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => WeatherPage(),
                                  ),
                                );
                              }
                            },
                            child: BlocBuilder<LoginCubit, LoginState>(
                              builder: (context, state) {
                                if (state is LoginLoadedState) {}
                                return Text("Войти",
                                    style: CustomTextStyle.B1(context)
                                        .copyWith(color: Colors.white));
                              },
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class BottonAuth extends StatefulWidget {
//   const BottonAuth({super.key});

//   @override
//   State<BottonAuth> createState() => _BottonAuthState();
// }

// class _BottonAuthState extends State<BottonAuth> {
//   final _formKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//             width: double.infinity,
//             child: FilledButton(
//               onPressed: () {
//                 if (_formKey.currentState != null &&
//                     _formKey.currentState!.validate()) {
//                   context.read<SignInBloc>().add(SignInRequired(
//                         emailController.text,
//                         passwordController.text,
//                       ));
//                 }
//               },
//               child: const Text('Войти'),
//             ),
//           );
//   }
// }
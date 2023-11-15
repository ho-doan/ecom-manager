import 'package:clean_arc/common/custom_button.dart';
import 'package:clean_arc/common/widgets/custom_textfield.dart';
import 'package:clean_arc/constants/global_variables.dart';
import 'package:flutter/material.dart';

enum Auth{
  signin,
  signup,
}

class AuthScreen extends StatefulWidget {
  static const String routeName='/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth=Auth.signup;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();

  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  final TextEditingController _nameController=TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
        child:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Xin chào!!',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),),
              ListTile(
                tileColor: _auth == Auth.signup
                ?GlobalVariables.backgroundColor
                :GlobalVariables.backgroundColor,
                title: const Text('Tạo tài khoản',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signup,
                  groupValue: _auth,
                  onChanged: (Auth? val){
                    setState(() {
                      _auth=val!;
                    });
                  },
                ),
              ),
              if(_auth==Auth.signup)
                Container(
                  padding: const EdgeInsets.all(8),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                    key: _signUpFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: _nameController,
                          hintText: 'Tên',
                          ),
                          const SizedBox(height: 10,),
                        CustomTextField(
                          controller: _emailController,
                          hintText: 'Email',
                          ),
                          const SizedBox(height: 10,),
                        CustomTextField(
                          controller: _passwordController,
                          hintText: 'Mật khẩu',
                          ),
                          const SizedBox(height: 10,),
                          CustomButton(
                            text: 'Đăng kí', 
                            onTap: (){},
                            )
                      ],
                    ),
                  ),
                ),
                //39:00
              ListTile(
                tileColor: _auth == Auth.signin
                ?GlobalVariables.backgroundColor
                :GlobalVariables.backgroundColor,
                title: const Text('Đăng nhập.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signin,
                  groupValue: _auth,
                  onChanged: (Auth? val){
                    setState(() {
                      _auth=val!;
                      
                    });
                  },
                ),
              ),
              if(_auth==Auth.signin)
                Container(
                  padding: const EdgeInsets.all(8),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                    key: _signUpFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: _emailController,
                          hintText: 'Email',
                          ),
                          const SizedBox(height: 10,),
                        CustomTextField(
                          controller: _passwordController,
                          hintText: 'Mật khẩu',
                          ),
                          const SizedBox(height: 10,),
                          CustomButton(
                            text: 'Đăng nhập', 
                            onTap: (){},
                            )
                      ],
                    ),
                  ),
                ),
            ],
          ),
        )
         ),
    );
  }
}
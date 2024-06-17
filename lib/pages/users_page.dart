import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_api_demo/bloc/user_bloc.dart';
import 'package:rest_api_demo/bloc/user_state.dart';
import 'package:rest_api_demo/customWidgets/custom_card.dart';

import '../bloc/user_event.dart';

class Users extends StatefulWidget {
  const Users({super.key});

  @override
  UsersState createState() => UsersState();
}

class UsersState extends State<Users> {
  @override
  void initState() {
    BlocProvider.of<UserBloc>(context).add(FetchUsers());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users posts API"),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is UserLoaded) {
            return ListView.builder(
              itemCount: state.users.length,
              itemBuilder: (context, index) {
                final user = state.users[index];
                return CustomCard(
                  name: user.name ?? '',
                  username: user.username ?? '',
                  phoneNumber: user.phone ?? '',
                  email: user.email ?? '',
                  city: user.address?.city ?? '',
                  zipCode: user.address?.zipcode ?? '',
                );
              },
            );
          } else if (state is UserError) {
            return Center(child: Text(state.message.toString()));
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}

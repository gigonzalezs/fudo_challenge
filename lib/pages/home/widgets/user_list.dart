
import 'package:flutter/material.dart';
import 'package:fudo_challenge/pages/home/home_states.dart';

import '../../../users/user.dart';

class UserList extends StatelessWidget {
  final UsersState state;

  const UserList({super.key, required this.state});
  @override
  Widget build(BuildContext context) {
   return FutureBuilder<List<User>>(
     future: state.users,
     builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
       if (snapshot.connectionState == ConnectionState.waiting) {
         return const Center(child: CircularProgressIndicator());
       } else if (snapshot.hasError) {
         return Center(child: Text('Error: ${snapshot.error}'));
       } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
         return Center(child: Text('No data available'));
       } else {
         return ListView.builder(
           itemCount: snapshot.data!.length,
           itemBuilder: (BuildContext context, int index) {
             return ListTile(
               title: Text(snapshot.data![index].name),
             );
           },
         );
       }
     }
   );
  }

}
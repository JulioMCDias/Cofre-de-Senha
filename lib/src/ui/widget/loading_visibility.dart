

import 'package:flutter/material.dart';

Widget loadingVisibility(streamLoadingVisibility){
  return StreamBuilder<bool>(
    stream: streamLoadingVisibility,
    initialData: false,
    builder: (context, snapshot){
      return snapshot.data ? Expanded(
        child: Container(
          color: Color.fromARGB(80, 100, 100, 100),
          child: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white)
            )
          ),
        ),
      ) : Container();
    },
  );
}
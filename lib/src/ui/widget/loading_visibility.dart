

import 'package:flutter/material.dart';

class LoadingVisibility extends StreamBuilder<bool>{
  
  LoadingVisibility(streamLoadingVisibility): super(
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
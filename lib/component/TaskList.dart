


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task_manager/style/style.dart';

import '../api/apiClient.dart';

ListView TaskList(TaskItems,_showAlertDialog){
  return ListView.builder(
      itemCount: TaskItems.length,
      itemBuilder: (context,index){
        return Card(
          child: ItemSizeBox(
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(TaskItems[index]['title'],style: Head6Text(colorDarkBlue),),
                Text(TaskItems[index]['description'],style: Head7Text(colorLightGray),),

                Row(
                  children: [
                    // Text on the left
                    Align(
                      alignment: Alignment.centerLeft,
                      child:Text(TaskItems[index]['createdDate'],style: Head7Text(colorRed),),
                    ),

                    // Icons on the right
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(onPressed: (){}, child: Icon(Icons.update)),
                            SizedBox(width: 10,),
                            ElevatedButton(onPressed: (){
                              _showAlertDialog(TaskItems[index]['_id']);

                            }, child: Icon(Icons.delete)),// Replace 'icon1' with your first icon

                          ],
                        ),
                      ),
                    ),
                  ],
                )

              ],
            )
          ),
        );
      }
  );
}
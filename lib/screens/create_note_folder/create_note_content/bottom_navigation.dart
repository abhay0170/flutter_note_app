import 'package:flutter/material.dart';

class NoteBottomNavigation extends StatelessWidget {
  const NoteBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: () {}, icon: Icon(Icons.draw)),
          IconButton(onPressed: () {}, icon: Icon(Icons.check_box_outlined)),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog( 
                    content: SizedBox(width: 270,),
                    actions: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Text options",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Spacer(),
                              IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(Icons.close))
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10)),
                                height: 40,
                                width: 90,
                                child: Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.numbers)),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.numbers))
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10)),
                                height: 40,
                                width: 130,
                                child: Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.numbers)),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.numbers)),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.numbers)),
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10)),
                                height: 40,
                                width: 130,
                                child: Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.numbers)),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.numbers)),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.numbers)),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10)),
                                height: 40,
                                width: 90,
                                child: Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.numbers)),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.numbers))
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  );
                },
              );
            },
            icon: Icon(Icons.text_fields),
          ),

          IconButton(onPressed: () {}, icon: Icon(Icons.format_color_text)),
          IconButton(onPressed: () {}, icon: Icon(Icons.format_paint_outlined)),
          IconButton(
              onPressed: () {},
              icon: Icon(
                  Icons.add)), /////////////dropdownbuttion ////arrowdropdown
          IconButton(onPressed: () {}, icon: Icon(Icons.undo_rounded)),
          IconButton(onPressed: () {}, icon: Icon(Icons.redo_rounded)),
        ],
      ),
    );
  }
}

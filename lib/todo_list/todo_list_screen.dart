import 'package:flutter/material.dart';
import 'package:todo_appwrite/animations/hover_lift.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        anchor: .2,
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Text(
                  "📝\ntoTooooDoooos",
                  style: Theme.of(context) //
                      .textTheme
                      .headline2
                      ?.copyWith(height: 2.1),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ConstrainedBox(
                        constraints:
                            BoxConstraints(minWidth: 100, maxWidth: 420),
                        child: HoverLift(
                          child: PhysicalModel(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            elevation: 8,
                            child: TextField(
                              cursorColor: Colors.black,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                              decoration: InputDecoration(
                                hintText: "🤔   What to do today?",
                                hintStyle: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (_, index) {
              return _TodoWidget(
                index: index,
                checked: index.isEven,
              );
            },
            childCount: 50,
          ))
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(50.0),
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 20),
          ),
          onPressed: () {},
          child: Text(
            "Logout👋",
            style: TextStyle(fontSize: 15),
          ),
        ),
      ),
    );
  }
}

class _TodoWidget extends StatefulWidget {
  const _TodoWidget({
    Key? key,
    required this.index,
    required this.checked,
  }) : super(key: key);
  final int index;
  final bool checked;

  @override
  __TodoWidgetState createState() => __TodoWidgetState();
}

class __TodoWidgetState extends State<_TodoWidget> {
  late bool checked;

  @override
  void initState() {
    super.initState();
    checked = widget.checked;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(minWidth: 100, maxWidth: 420),
            child: Row(
              children: <Widget>[
                HoverLift(
                  endScale: 1.25,
                  child: Transform.scale(
                    scale: 1.4,
                    child: Checkbox(
                      value: checked,
                      onChanged: (value) {
                        setState(() {
                          checked = value!;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    "${widget.index.toString() * widget.index}",
                    overflow: TextOverflow.visible,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                HoverLift(
                  endScale: 1.25,
                  child: IconButton(
                    splashColor: Colors.transparent,
                    iconSize: 30,
                    hoverColor: Colors.transparent,
                    onPressed: () {},
                    icon: Icon(Icons.delete_outline_rounded),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

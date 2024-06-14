import 'package:edudoor_jobseeker/src/sizer/extension.dart';
import 'package:edudoor_jobseeker/src/themes/app_colors.dart';
import 'package:edudoor_jobseeker/src/themes/app_decorations.dart';
import 'package:edudoor_jobseeker/src/types/enums.dart';
import 'package:flutter/material.dart';

class ModalSearchbox extends StatefulWidget {
  const ModalSearchbox(
      {super.key,
      required this.label,
      required this.icon,
      required this.onChanged,
      this.isMultipleSelect = false,
      this.selectedValue,
      this.selectedMultipleValue = const [],
      this.borderRadius,
      this.selectedItemRadius = 50,
      required this.list,
      this.prefix = "",
      this.suffix = "",
      this.isShowProgress = false,
      this.progressWidget,
      this.btnType,
      this.addBtnTitle,
      this.addBtnIcon});

  final IconData icon;
  final bool isMultipleSelect;
  final String label;
  final Function(dynamic value) onChanged;
  final List<String> list;
  final String? selectedValue;
  final List<String> selectedMultipleValue;
  final BorderRadius? borderRadius;
  final int selectedItemRadius;
  final String prefix;
  final String suffix;
  final bool isShowProgress;
  final Widget? progressWidget;
  final SelectBtn? btnType;
  final IconData? addBtnIcon;
  final String? addBtnTitle;

  @override
  State<ModalSearchbox> createState() => _ModalSearchboxState();
}

class _ModalSearchboxState extends State<ModalSearchbox> with SingleTickerProviderStateMixin {
  String? selectedValue;
  List<String> selectedMultipleValue = [];
  List<String> listData = [];

  @override
  void didUpdateWidget(covariant ModalSearchbox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedValue != widget.selectedValue) {
      setState(() {
        selectedValue = widget.selectedValue;
      });
    }
    if (oldWidget.list != widget.list) {
      setState(() {
        listData = widget.list;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    selectedValue = widget.selectedValue;
    selectedMultipleValue.addAll(widget.selectedMultipleValue);
    listData.addAll(widget.list);
  }

  void _showList(String title, List<dynamic> data, BuildContext context) {
    showModalBottomSheet(
        context: context,
        barrierLabel: "search_drop_down_modal",
        elevation: 100,
        isScrollControlled: true,
        barrierColor: Colors.black.withOpacity(0.5),
        constraints: const BoxConstraints(minHeight: 100, maxHeight: 500),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30.sp), topRight: Radius.circular(30.sp)),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        builder: (bottomSheetContext) {
          return _SearchItem(
            isMultipleSelect: widget.isMultipleSelect,
            multipleSelectedValue: selectedMultipleValue,
            title: title,
            data: data,
            selectedValue: selectedValue,
            selectedItemRadius: widget.selectedItemRadius,
            prefix: widget.prefix,
            suffix: widget.suffix,
            isShowProgress: widget.isShowProgress,
            progressWidget: widget.progressWidget,
            onSelected: (v, isAlreadySelected) {
              if (widget.isMultipleSelect) {
                setState(() {
                  if (isAlreadySelected) {
                    selectedMultipleValue.remove(v);
                  } else {
                    selectedMultipleValue.add(v);
                  }
                  widget.onChanged(selectedMultipleValue);
                });
              } else {
                setState(() {
                  selectedValue = v;
                });
                widget.onChanged(v);
              }
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return widget.btnType == SelectBtn.addBtn
        ? OutlinedButton.icon(
            icon: Icon(widget.addBtnIcon ?? Icons.add_circle),
            label: Text(widget.addBtnTitle ?? "Open"),
            onPressed: () {
              _showList(widget.label, listData, context);
            },
          )
        : Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: [
                    InkWell(
                      onTap: () {
                        _showList(widget.label, listData, context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Theme.of(context).primaryColor.withOpacity(.5), width: 2.sp),
                          ),
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 3),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: widget.isMultipleSelect
                                      ? selectedMultipleValue.isEmpty
                                          ? Text(
                                              widget.label,
                                              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp, color: colorGrey),
                                            )
                                          : Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: selectedMultipleValue.map(
                                                (e) {
                                                  var index = selectedMultipleValue.indexOf(e);
                                                  return Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                        color: Theme.of(context).primaryColorLight.withOpacity(.5), borderRadius: BorderRadius.circular(widget.selectedItemRadius.toDouble())),
                                                    margin: EdgeInsets.only(right: 8, bottom: (index < (selectedMultipleValue.length - 1)) ? 10 : 0),
                                                    padding: const EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 5),
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: Text('${widget.prefix}$e${widget.suffix}',
                                                              style: TextStyle(fontSize: 15, height: 1.4, color: Theme.of(context).textTheme.bodyLarge?.color ?? Theme.of(context).primaryColorDark)),
                                                        ),
                                                        GestureDetector(
                                                          child: Container(
                                                            width: 30,
                                                            height: 30,
                                                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Theme.of(context).primaryColorDark.withOpacity(.5)),
                                                            child: const Center(child: Icon(Icons.close_rounded, size: 15)),
                                                          ),
                                                          onTap: () {
                                                            setState(
                                                              () {
                                                                selectedMultipleValue.remove(e);
                                                                widget.onChanged(widget.selectedMultipleValue);
                                                              },
                                                            );
                                                          },
                                                        )
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ).toList(),
                                            )
                                      : selectedValue != null
                                          ? Text(
                                              '${widget.prefix}${selectedValue!}${widget.suffix}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.sp,
                                              ),
                                            )
                                          : Text(
                                              widget.label,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16,
                                                color: colorGrey,
                                              ),
                                            ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _showList(widget.label, listData, context);
                                  },
                                  child: Icon(
                                    widget.icon,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
  }
}

class _SearchItem extends StatefulWidget {
  final String title;
  final List<dynamic> data;
  final String? selectedValue;
  final List<String> multipleSelectedValue;
  final Function onSelected;
  final bool isMultipleSelect;
  final String prefix;
  final String suffix;
  final int selectedItemRadius;
  final bool isShowProgress;
  final Widget? progressWidget;

  const _SearchItem({
    required this.title,
    this.multipleSelectedValue = const [],
    this.isMultipleSelect = false,
    required this.data,
    required this.selectedValue,
    required this.selectedItemRadius,
    required this.onSelected,
    this.prefix = "",
    this.suffix = "",
    this.isShowProgress = false,
    this.progressWidget,
  });

  @override
  State<_SearchItem> createState() => _SearchItemState();
}

class _SearchItemState extends State<_SearchItem> {
  List<dynamic> filteredData = [];

  @override
  void initState() {
    filteredData.clear();

    if (widget.isMultipleSelect) {
      filteredData.addAll(widget.multipleSelectedValue);
      filteredData.addAll(widget.data.where((element) => !widget.multipleSelectedValue.contains(element)));
    } else {
      if (widget.selectedValue != null) {
        filteredData.add(widget.selectedValue);
      }
      filteredData.addAll(widget.data.where((element) => element != widget.selectedValue));
    }
    super.initState();
  }

  void search(String keyword) {
    var filtered = [];
    for (var data in widget.data) {
      if (data.toString().toLowerCase().contains(keyword.toLowerCase())) {
        filtered.add(data);
      }
    }
    setState(() {
      filteredData = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: TextField(
                onChanged: (value) async {
                  search(value);
                },
                decoration: AppDecoration.inputFieldDecoration(
                  context,
                  hint: widget.title,
                  prefixIcon: Icon(Icons.search_rounded, color: Theme.of(context).primaryColor),
                ).inputDecoration),
          ),
          Expanded(
            child: widget.isShowProgress
                ? widget.progressWidget!
                : ListView.builder(
                    itemCount: filteredData.length,
                    itemBuilder: (context, index) {
                      var isAlreadySelected = widget.isMultipleSelect ? widget.multipleSelectedValue.contains(filteredData[index]) : widget.selectedValue == filteredData[index];

                      return InkWell(
                        onTap: () {
                          widget.onSelected(filteredData[index], isAlreadySelected);
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          child: Container(
                            decoration: isAlreadySelected
                                ? BoxDecoration(color: Theme.of(context).primaryColorLight.withOpacity(.5), borderRadius: BorderRadius.circular(widget.selectedItemRadius.toDouble()))
                                : const BoxDecoration(),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text('${widget.prefix}${filteredData[index]}${widget.suffix}',
                                        style: TextStyle(fontSize: 15, height: 1.4, color: Theme.of(context).textTheme.bodyLarge?.color ?? Theme.of(context).primaryColorDark)),
                                  ),
                                  if (isAlreadySelected && widget.isMultipleSelect)
                                    GestureDetector(
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Theme.of(context).primaryColorDark.withOpacity(.5)),
                                        child: const Center(child: Icon(Icons.close_rounded, size: 15)),
                                      ),
                                      onTap: () {
                                        setState(
                                          () {
                                            widget.onSelected(filteredData[index], isAlreadySelected);
                                          },
                                        );
                                      },
                                    )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

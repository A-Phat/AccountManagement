import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:passbooks/constants/colors.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class AppBarComponent extends StatefulWidget {
  const AppBarComponent({Key? key, required this.scaffoldKey})
      : super(key: key);
  final scaffoldKey;

  @override
  _AppBarComponentState createState() => _AppBarComponentState();
}

class _AppBarComponentState extends State<AppBarComponent> {
  @override
  Widget build(BuildContext context) {
    var height = AppBar().preferredSize.height;
    return Stack(
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                MaterialColors.signStartGradient,
                MaterialColors.signEndGradient,
              ],
              stops: [0.3, 0.8],
              begin: FractionalOffset.topRight,
              end: FractionalOffset.bottomLeft,
            ),
          ), // Background
          child: const Center(
            child: Text(
              "Balance",
              style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ),
          height: height + 85,
          width: MediaQuery.of(context).size.width,
        ),

        Container(), // Required some widget in between to float AppBar

        Positioned(
          // To take AppBar Size only
          top: 110.0,
          left: 12.0,
          right: 12.0,
          child: AppBar(
            toolbarHeight: 50.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            backgroundColor: MaterialColors.appBar,
            leading: IconButton(
              onPressed: () {
                widget.scaffoldKey.currentState!.openDrawer();
              },
              icon: const Icon(
                Icons.menu,
                color: MaterialColors.drawerHeader,
              ),
            ),
            primary: false,
            title: const TextField(
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0),
                decoration: InputDecoration(
                    hintText: "10,000",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    hintStyle: TextStyle(color: MaterialColors.drawerHeader))),
            actions: <Widget>[
              IconButton(
                icon: const FaIcon(
                  FontAwesomeIcons.calendarWeek,
                  color: MaterialColors.drawerHeader,
                  size: 18,
                ),
                onPressed: () {
                  SfDateRangePicker(
                    onSelectionChanged: _onSelectionChanged,
                    selectionMode: DateRangePickerSelectionMode.multiple,
                    initialSelectedRange: PickerDateRange(
                        DateTime.now().subtract(const Duration(days: 4)),
                        DateTime.now().add(const Duration(days: 3))),
                  );
                },
              )
            ],
          ),
        )
      ],
    );
  }

  String _selectedDate = '';
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';

  /// The method for [DateRangePickerSelectionChanged] callback, which will be
  /// called whenever a selection changed on the date picker widget.
  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    /// The argument value will return the changed date as [DateTime] when the
    /// widget [SfDateRangeSelectionMode] set as single.
    ///
    /// The argument value will return the changed dates as [List<DateTime>]
    /// when the widget [SfDateRangeSelectionMode] set as multiple.
    ///
    /// The argument value will return the changed range as [PickerDateRange]
    /// when the widget [SfDateRangeSelectionMode] set as range.
    ///
    /// The argument value will return the changed ranges as
    /// [List<PickerDateRange] when the widget [SfDateRangeSelectionMode] set as
    /// multi range.
    setState(() {
      if (args.value is PickerDateRange) {
        _range =
            DateFormat('dd/MM/yyyy').format(args.value.startDate).toString() +
                ' - ' +
                DateFormat('dd/MM/yyyy')
                    .format(args.value.endDate ?? args.value.startDate)
                    .toString();
      } else if (args.value is DateTime) {
        _selectedDate = args.value.toString();
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
      } else {
        _rangeCount = args.value.length.toString();
      }
    });
  }
}

import 'package:dartuif/utils/UiHelper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../SuperCalendar/model/calendar_date_picker2_config.dart';
import '../../SuperCalendar/widgets/calendar_date_picker2_with_action_buttons.dart';
import '../../main.dart';

DateTime _startDate = DateTime.now();
DateTime _endDate = DateTime.now();

class SuperCalendar extends StatefulWidget {
  final int selectionType;

  const SuperCalendar({Key? key, required this.selectionType}) : super(key: key);

  @override
  State<SuperCalendar> createState() => SuperCalendarState();
}

class SuperCalendarState extends State<SuperCalendar> {
  late AppData appData;
  int selectionType = 0;

  @override
  void initState() {
    super.initState();
    appData = AppData();

  }

  List<DateTime?> _rangeDatePickerWithActionButtonsWithValue = [
    _startDate,
    _endDate,
  ];

  @override
  Widget build(BuildContext context) {
    selectionType = Provider.of<SharedData>(context).selectionType;
    setState(() {

      switch (selectionType) {
        case 1:
          _startDate = DateTime.now().subtract(const Duration(days: 6));
          _endDate = DateTime.now();
          break;
        case 2:
          _startDate =
              DateTime(DateTime.now().year, DateTime.now().month - 1, 1);
          _endDate = DateTime(DateTime.now().year, DateTime.now().month, 0);
          break;
        case 3:
          _startDate = DateTime(DateTime.now().year, DateTime.now().month, 1);
          _endDate = DateTime(DateTime.now().year, DateTime.now().month + 1, 0);
          break;
        case 4:
          int currentDay = DateTime.now().weekday;
          _startDate = DateTime.now().subtract(Duration(days: currentDay));
          _endDate = DateTime.now()
              .add(Duration(days: DateTime.daysPerWeek - currentDay - 1));
          break;
      }
      appData.saveSelectedRange(_startDate, _endDate);
      print("selected weepe ===============> $_startDate  $_endDate");

      _rangeDatePickerWithActionButtonsWithValue.clear();
      _rangeDatePickerWithActionButtonsWithValue = [
        appData.startDate,
        appData.endDate
      ];
    });

    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: _buildCalendarWithActionButtons(),
      ),
    );
  }

  String _getValueText(
    CalendarDatePicker2Type datePickerType,
    List<DateTime?> values,
  ) {
    values =
        values.map((e) => e != null ? DateUtils.dateOnly(e) : null).toList();
    var valueText = (values.isNotEmpty ? values[0] : null)
        .toString()
        .replaceAll('00:00:00.000', '');
    if (datePickerType == CalendarDatePicker2Type.multi) {
      valueText = values.isNotEmpty
          ? values
              .map((v) => v.toString().replaceAll('00:00:00.000', ''))
              .join(', ')
          : 'null';
    } else if (datePickerType == CalendarDatePicker2Type.range) {
      if (values.isNotEmpty) {
        final startDate = values[0].toString().replaceAll('00:00:00.000', '');
        final endDate = values.length > 1
            ? values[1].toString().replaceAll('00:00:00.000', '')
            : 'null';
        valueText = '$startDate to $endDate';
      } else {
        return 'null';
      }
    }
    return valueText;
  }

  Widget _buildCalendarWithActionButtons() {
    const dayTextStyle = TextStyle(
      color: Color(0xff2D3436),
      fontWeight: FontWeight.w700,
    );
    final weekendTextStyle =
        const TextStyle(color: Color(0xff2D3436), fontWeight: FontWeight.w600);
    final anniversaryTextStyle = const TextStyle(
      color: Color(0xff152E58),
      fontWeight: FontWeight.w700,
      decoration: TextDecoration.underline,
    );
    final config = CalendarDatePicker2WithActionButtonsConfig(
        dayTextStyle: GoogleFonts.inter(
            fontSize: 16,
            color: Color(0xff2D3436),
            fontWeight: FontWeight.w400),
        selectedRangeDayTextStyle: GoogleFonts.inter(
            fontSize: 16,
            color: Color(0xff2D3436),
            fontWeight: FontWeight.w400),
        dayBorderRadius: BorderRadius.circular(20),
        calendarType: CalendarDatePicker2Type.range,
        selectedDayHighlightColor: Color(0xff152E58),
        weekdayLabels: [
          "SU",
          "MO",
          "TU",
          "WE",
          "TH",
          "FR",
          "SA",
        ],
        weekdayLabelTextStyle: GoogleFonts.inter(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
            fontSize: 14,
            fontStyle: FontStyle.normal),
        controlsTextStyle: GoogleFonts.inter(
          fontSize: 18,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600,
          color: Color(0xff2D3436),
        ),
        rangeBidirectional: true,
        cancelButton: CustomButtonWithBorder(
          borderRadius: 28,
          height: 48,
          width: MediaQuery.of(context).size.width * 0.40,
          backgroundColor: Colors.white,
          borderColor: Color(0xff8395A7),
          borderWidth: 0.5,
          text: 'Cancel',
          textColor: Color(0xff8395A7),
        ),

        okButton: CustomButtonWithBorder(
          borderRadius: 28,
          height: 48,
          backgroundColor: Color(0xff152E58),
          borderColor: Color(0xff152E58),
          borderWidth: .5,
          text: 'Done',
          textColor: Colors.white,
          width: MediaQuery.of(context).size.width * 0.40,
        ),
        centerAlignModePicker: true,
        customModePickerIcon: const SizedBox(),
        selectedDayTextStyle: dayTextStyle.copyWith(color: Colors.white),
        dayTextStylePredicate: ({required date}) {
          TextStyle? textStyle;
          if (date.weekday == DateTime.saturday ||
              date.weekday == DateTime.sunday) {
            textStyle = weekendTextStyle;
          }
          if (DateUtils.isSameDay(date, DateTime(2021, 1, 25))) {
            textStyle = anniversaryTextStyle;
          }
          return textStyle;
        },
        dayBuilder: ({
          required date,
          textStyle,
          decoration,
          isSelected,
          isDisabled,
          isToday,
        }) {
          Widget? dayWidget;
          // if (date.day % 3 == 0 && date.day % 9 != 0) {
          //   dayWidget = Container(
          //     decoration: decoration,
          //     child: Center(
          //       child: Stack(
          //         alignment: AlignmentDirectional.center,
          //         children: [
          //           Text(
          //             MaterialLocalizations.of(context).formatDecimal(date.day),
          //             style: textStyle,
          //             // GoogleFonts.inter(
          //             //   fontSize: 16,
          //             //   fontWeight: FontWeight.w400,
          //             //   color: Color(0xff2D3436),
          //             // ),
          //           ),
          //           Padding(
          //             padding: const EdgeInsets.only(top: 27.5),
          //             child: Container(
          //               height: 4,
          //               width: 4,
          //               decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.circular(5),
          //                 color: isSelected == true
          //                     ? Colors.white
          //                     : Colors.grey[500],
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   );
          // }
          return dayWidget;
        },
        yearBuilder: ({
          required year,
          decoration,
          isCurrentYear,
          isDisabled,
          isSelected,
          textStyle,
        }) {
          return Center(
            child: Container(
              decoration: decoration,
              height: 36,
              width: 72,
              child: Center(
                child: Semantics(
                  selected: isSelected,
                  button: true,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        year.toString(),
                        style: textStyle,
                      ),
                      if (isCurrentYear == true)
                        Container(
                          padding: const EdgeInsets.all(4),
                          margin: const EdgeInsets.only(left: 5),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffE6EAF5),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [

        CalendarDatePicker2WithActionButtons(
            config: config,
            value: _rangeDatePickerWithActionButtonsWithValue,
            onValueChanged: (dates) {
              if (dates.isNotEmpty) {
                var startDate = dates[0];
                var endDate = (dates.length > 0 ? dates[1] : dates[0]);
                switch (selectionType) {
                  case 0:
                  case 5:
                    _startDate = startDate!;
                    _endDate = endDate!;
                    break;
                }
              }
              setState(() {
                print("valChanged ==========> $dates");
                _rangeDatePickerWithActionButtonsWithValue = dates;
              });
            }),
        const SizedBox(height: 10),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Selection(s):  '),
            const SizedBox(width: 10),
            Flexible(
              child: Text(
                _getValueText(config.calendarType,
                    _rangeDatePickerWithActionButtonsWithValue),
              ),
            ),
          ],
        ),
        const SizedBox(height: 25),
      ],
    );
  }
}

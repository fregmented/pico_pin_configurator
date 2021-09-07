
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pico_pin_configurator/components/scaffold_widget.dart';
import 'package:pico_pin_configurator/data/local.dart';
import 'package:pico_pin_configurator/providers/pin_info_provider.dart';
import 'package:provider/provider.dart';

class RP2040TableItem extends StatelessWidget {
  PinData? data;
  RP2040TableItem(this.data);
  String selectedFunction = '';

  List<Widget> getList(BuildContext ctx) {
    var data = Provider.of<PinData>(ctx);
    if (data.available_functions!.isEmpty) {
      return [
        Expanded(child: Text('${data.pin}', textAlign: TextAlign.center)),
        Expanded(child: Text('${data.static}', textAlign: TextAlign.center)),
        Expanded(child: Text(''))
      ];
    } else {
      return [
        Expanded(child: Text('${data.pin}', textAlign: TextAlign.center)),
        Expanded(child: Text('${data.pico_pin??'X'}', textAlign: TextAlign.center)),
        Expanded(child: Container(
          child: DropdownButton<String>(
            value: data.selected_function,
            icon: const Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            onChanged: (newValue) {
              data.selected_function = newValue;
            },
            items: (data.available_functions??[])
                .map<DropdownMenuItem<String>>((e) => DropdownMenuItem<String>(
                value: e,
                child: Text(e)
            )
            ).toList(),
          ),
        ),
        ),
      ];
    }
  }

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider.value(
      value: data,
      builder: (context, _) => Container(
        width: double.infinity,
        child: Row(
          children: getList(context),
        ),
      )
  );
}

class RP2040TableSelector extends StatelessWidget {

  Widget getItem(BuildContext context, int index) {
    var data = Provider.of<PinInfoProvider>(context).data(index);
    debugPrint("RP2040TableView::$index::$data");
    return RP2040TableItem(data);
  }
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text("appbar.title.tableview".tr()),),
    body: Container(
        width: double.infinity,
        height: double.infinity,
        child: (Provider.of<PinInfoProvider>(context).count > 0) ? ListView.separated(
            itemBuilder: (_, index) {
              if(index == 0) {
                return Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Text('Pin number', textAlign: TextAlign.center,)
                    ),
                    Expanded(
                        child: Text('Pico pin', textAlign: TextAlign.center)
                    ),
                    Expanded(
                        child: Text('Function', textAlign: TextAlign.center)
                    )
                  ],
                );
              }
              return RP2040TableItem(Provider.of<PinInfoProvider>(context).data(index-1));
            },
            separatorBuilder: (_, __) => const Divider(),
            itemCount: Provider.of<PinInfoProvider>(context).count
        ): Center(
            child: Text("No Data")
        )
    ),
    bottomNavigationBar: getBottomNav(context),
    floatingActionButton: getFAB(context),
  );
}
import 'package:consuming_rest_api/core/view_helper/base_view.dart';
import 'package:consuming_rest_api/core/view_model/aviation_view_model.dart';
import 'package:consuming_rest_api/utils/enums.dart';
import 'package:flutter/material.dart';

class AirlinePage extends StatefulWidget {
  static const String routeName = 'flights-page';
  const AirlinePage({Key? key}) : super(key: key);

  @override
  State<AirlinePage> createState() => _AirlinePageState();
}

class _AirlinePageState extends State<AirlinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Flights data'),
      ),
      body: BaseView<AviationViewModel>(onModelReady: (viewModel) {
        if (viewModel.getFlightsState != BaseModelState.success) {
          viewModel.getFlights();
        }
      }, builder: (context, aviationViewModel, _) {
        return aviationViewModel.getFlightsState == BaseModelState.loading
            ? const Center(
                child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.red),
              ))
            : aviationViewModel.getFlightsState == BaseModelState.error
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Error : ${aviationViewModel.errorMessage}'),
                        const SizedBox(height: 20),
                        ElevatedButton(
                            style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.red)),
                            onPressed: () {
                              setState(() {
                                aviationViewModel.getFlights();
                              });
                            },
                            child: const Text('Retry'))
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: aviationViewModel.listOfFlights!.length,
                    itemBuilder: (BuildContext context, int index) {
                      final data = aviationViewModel.listOfFlights![index];

                      return ListTile(
                        title: Text(data.airlineName!),
                        subtitle: Text(data.countryName!),
                        trailing: Text(data.status!.toUpperCase()),
                      );
                    },
                  );
      }),
    );
  }
}

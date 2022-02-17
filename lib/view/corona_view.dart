import 'package:corona/bloc/corona_cubit.dart';
import 'package:corona/constant/widgets/dropdown_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoronaView extends StatefulWidget {
  @override
  State<CoronaView> createState() => _CoronaViewState();
}

class _CoronaViewState extends State<CoronaView> {
  String? country;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CoronaCubit, CoronaState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = CoronaCubit.get(context);
        return Scaffold(

          appBar: AppBar(
            title: Text('Corana'),
          ),
          body: Padding(

            padding: const EdgeInsets.all(0),
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/coronaimages.jpeg'),
                  fit: BoxFit.cover,
                  repeat: ImageRepeat.noRepeat
                )
              ),

              child: Column(
                children: [
                  const Text('Corona Virus App',style: TextStyle(color: Colors.white,fontSize: 20),),
                  CustomDropdownButton(
                    hint: '-- country --',
                    nameFiled: country,
                    onChanged: (selected) {
                      setState(() {
                        country = selected!;
                      });
                    },
                  ),
                  ElevatedButton(
                      onPressed: () => {
                            print(country),
                            cubit.getCorona(country.toString()),
                          },
                      child: Text('Serach')),

                  cubit.corona?.countryInfo == null
                      ? Text('')
                      : Image.network(
                          cubit.corona!.countryInfo!.flag.toString(),
                          fit: BoxFit.cover,
                        ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    padding:EdgeInsets.all(10),
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,

                        colors: [
                          Colors.cyan,
                          Colors.indigo,
                        ],
                      ),
                      border: Border.all(
                        width: 2,
                        color: Colors.blueAccent,
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.ac_unit),
                        Text(
                          'Cases :',
                          style: TextStyle(fontSize: 20),
                        ),
                        cubit.corona == null
                            ? Text('')
                            : Text(cubit.corona!.cases.toString(),
                                style: TextStyle(fontSize: 20)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

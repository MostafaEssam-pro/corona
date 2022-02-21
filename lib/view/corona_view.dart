import 'package:corona/bloc/corona_cubit.dart';
import 'package:corona/constant/widgets/dropdown_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoronaView extends StatefulWidget {
  const CoronaView({Key? key}) : super(key: key);

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
            title: const Text('Corana'),
          ),
          body: Padding(

            padding: const EdgeInsets.all(0),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/coronaimages.jpeg'),
                      fit: BoxFit.cover,
                      repeat: ImageRepeat.noRepeat)),
              child: Column(
                children: [
                  const Text(
                    'Corona Virus App',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
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
                            cubit.getCorona(country.toString()),
                          },
                      child: const Text('Search')),
                  cubit.corona?.countryInfo == null
                      ? const Text('')
                      : Image.network(
                          cubit.corona!.countryInfo!.flag.toString(),
                          fit: BoxFit.cover,
                        ),
                  const SizedBox(
                    height: 25,
                  ),
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          border: Border.all(
                            width: 2,
                            color: Colors.blueAccent,
                          ),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.person),
                            const Text(
                              'Cases : ',
                              style: TextStyle(fontSize: 20),
                            ),
                            cubit.corona == null
                                ? const Text('')
                                : Text(cubit.corona!.cases.toString(),
                                style: const TextStyle(fontSize: 20)),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        padding: const EdgeInsets.all(10),
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          border: Border.all(
                            width: 2,
                            color: Colors.blueAccent,
                          ),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.person),
                            const Text(
                              'Today Cases : ',
                              style: TextStyle(fontSize: 20),
                            ),
                            cubit.corona == null
                                ? const Text('')
                                : Text(cubit.corona!.todayCases.toString(),
                                style: const TextStyle(fontSize: 20)),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        padding: const EdgeInsets.all(10),
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          border: Border.all(
                            width: 2,
                            color: Colors.blueAccent,
                          ),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.person),
                            const Text(
                              'Deaths : ',
                              style: TextStyle(fontSize: 20),
                            ),
                            cubit.corona == null
                                ? const Text('')
                                : Text(cubit.corona!.deaths.toString(),
                                style: const TextStyle(fontSize: 20)),
                          ],
                        ),
                      ),
                    ],

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

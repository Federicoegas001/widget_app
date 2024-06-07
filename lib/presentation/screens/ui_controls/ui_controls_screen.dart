import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls'),
      ),
      body: _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;
  bool wantsBreakFast = false;
  bool wantsLaunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Developer Mode'),
          subtitle: const Text('Controles adicionales'),
          value: isDeveloper,
          onChanged: (value) {
            setState(() {
              isDeveloper = !isDeveloper;
            });
          },
        ),
        ExpansionTile(
          title: const Text('Vehiculo de Transporte'),
          subtitle: Text('$selectedTransportation'),
          children: [
            RadioListTile(
              title: const Text('By Car'),
              subtitle: const Text('Viajar por auto'),
              value: Transportation.car,
              groupValue: selectedTransportation,
              onChanged: ((value) => setState(
                    () {
                      selectedTransportation = Transportation.car;
                    },
                  )),
            ),
            RadioListTile(
              title: const Text('By Boat'),
              subtitle: const Text('Viajar por boat'),
              value: Transportation.boat,
              groupValue: selectedTransportation,
              onChanged: ((value) => setState(
                    () {
                      selectedTransportation = Transportation.boat;
                    },
                  )),
            ),
            RadioListTile(
              title: const Text('By Plane'),
              subtitle: const Text('Viajar por plane'),
              value: Transportation.plane,
              groupValue: selectedTransportation,
              onChanged: ((value) => setState(
                    () {
                      selectedTransportation = Transportation.plane;
                    },
                  )),
            ),
            RadioListTile(
              title: const Text('By Submarine'),
              subtitle: const Text('Viajar por submarine'),
              value: Transportation.submarine,
              groupValue: selectedTransportation,
              onChanged: ((value) => setState(
                    () {
                      selectedTransportation = Transportation.submarine;
                    },
                  )),
            )
          ],
        ),
        CheckboxListTile(
          title: const Text('Desayuno?'),
          value: wantsBreakFast,
          onChanged: ((value) {
            return setState(
              () {
                wantsBreakFast = !wantsBreakFast;
              },
            );
          }),
        ),
        CheckboxListTile(
          title: const Text('Almuerzo?'),
          value: wantsLaunch,
          onChanged: ((value) {
            return setState(
              () {
                wantsLaunch = !wantsLaunch;
              },
            );
          }),
        ),
        CheckboxListTile(
          title: const Text('Cena?'),
          value: wantsDinner,
          onChanged: ((value) {
            return setState(
              () {
                wantsDinner = !wantsDinner;
              },
            );
          }),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PinView extends StatefulWidget {
  const PinView(
      {Key? key,
      required this.onDigitPressed,
      required this.onDelete,
      required this.onDone,
      required this.pinController})
      : super(key: key);

  final Function(int) onDigitPressed;
  final VoidCallback onDelete;
  final Function(String) onDone;
  final PINController pinController;

  @override
  State<PinView> createState() => _PinViewState();
}

class _PinViewState extends State<PinView> {
  String output = '';

  @override
  void initState() {
    // widget.pinController.resetPin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PINController, PINState>(
      bloc: widget.pinController,
      listener: (context, state) {
        if (state is PINResetState) {
          output = '';
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            PinDots(activeCount: output.length - 1),
            const SizedBox(
              height: 32.0,
            ),
            GridView.count(
                padding: EdgeInsets.zero,
                // padding: const EdgeInsets.only(horizontal: 18,b: 6),
                crossAxisSpacing: 18,
                mainAxisSpacing: 10,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 3,
                children: List.generate(
                    12,
                    (index) => index == 9
                        ? SizedBox.fromSize()
                        : InkWell(
                            // borderRadius: BorderRadius.circular(32),
                            onTap: () {
                              int number = index + 1;
                              if (number != 10 &&
                                  number != 11 &&
                                  number != 12) {
                                widget.onDigitPressed(number);
                                if (output.length < 4) {
                                  output += number.toString();
                                }
                              } else if (number == 11) {
                                widget.onDigitPressed(0);
                                if (output.length < 4) {
                                  output += '0';
                                }
                              } else if (number == 12) {
                                widget.onDelete();
                                if (output.isNotEmpty) {
                                  output =
                                      output.substring(0, output.length - 1);
                                }
                              }
                              setState(() {
                                if (output.length == 4) {
                                  widget.onDone(output);
                                }
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              // decoration: const BoxDecoration(
                              //     shape: BoxShape.circle,
                              //     border: Border.fromBorderSide(BorderSide(
                              //         width: 1, color: Colors.grey))),
                              child: Center(
                                  child: index == 11
                                      ? Icon(
                                          Icons.backspace_outlined,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                        )
                                      : Text(
                                          index == 10 ? '0' : '${index + 1}',
                                          style: TextStyle(
                                              fontSize: 30,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimary,
                                              fontWeight: FontWeight.w500),
                                        )),
                            ),
                          )).toList()),
          ],
        );
      },
    );
  }
}

class PinDots extends StatefulWidget {
  final int activeCount;

  const PinDots({Key? key, required this.activeCount}) : super(key: key);

  @override
  State<PinDots> createState() => _PinDotsState();
}

class _PinDotsState extends State<PinDots> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            4,
            (index) => Container(
                  width: 12,
                  height: 12,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: index <= widget.activeCount
                          ? Theme.of(context).colorScheme.onPrimary
                          : Colors.transparent,
                      border: Border.fromBorderSide(BorderSide(
                          width: 1.5,
                          color: Theme.of(context).colorScheme.onPrimary))),
                )).toList(),
      ),
    );
  }
}

class PINController extends Cubit<PINState> {
  PINController() : super(PINInitialState());

  void resetPin() {
    emit(PINResetState(''));
  }
}

abstract class PINState {}

class PINInitialState extends PINState {
  @override
  List<Object?> get props => [];
}

class PINResetState extends PINState {
  final String pin;

  PINResetState(this.pin);

  @override
  List<Object?> get props => [pin];
}

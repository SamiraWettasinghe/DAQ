# Vehicle OBD-II Integration Instructions

## Sensor Info
The breakout board that will be plugged into the vehicle OBD port is a [Sparkfun OBD-II-UART](https://learn.sparkfun.com/tutorials/obd-ii-uart-hookup-guide/all).

## Sensor Communications
This board has a MCP2551 chip (CAN communication) as well as the STN1110 (OBD-II interpretor) which means that this board can be use to look at raw CAN data as well as interpret OBD-II data and send it over UART protocol.

## Instructions
This board does not need to be wired to an external through hole PCB. The current holes on the PCB have Dupont wires soldered into it already with male pins on the other side. These will need to be replaced with other wires such that it can be wired to a Nano. The mapping is as follows:
OBD-II | Nano
------------- | ----
TX-0 | RX
RX-I | TX
GND | GND

**WARNING:** Remove the TX and RX wires before starting up the Arduino otherwise we risk bricking the OBD-II board. The start up sequence in vehicle will have to be to first power DAQ up, then plug the board into the vehicle OBD port.

The Nano will need a power source so make sure to connect VIN and GND to the positive and negative of a 9 volt (or other external battery). The DAQ CAN communication wiring is the same as before.

## Mounting
The OBD-II board will need to be attached to the vehicle OBD port via the DB9 cable. The OBD-II board, Nano, and MCP2515 can be packaged into one enclosure. This package can be located in vehicle, relatively close to the OBD port.

## Code
The code is already configured to communicate via CAN to the Mega. The data will have CAN ID 0x05. Currently vehicle speed and RPM is being logged. The first byte is vehicle speed and the next two bytes are RPM.
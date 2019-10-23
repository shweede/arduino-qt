# arduino-qt
Template project for using Qt Creator as IDE for Arduino projects

## Motivation
Due to many disadvantages original Arduino IDE has this project was created. Qt Creator as replacement chosen because of personal preferences also because of speed and primary focus on C/C++ development.

## Inspiration and references
See original article - https://habr.com/ru/post/408261/

Translated version - https://geeks-world.github.io/articles/408261/index.html

## Required hardware
- Generic linux computer
- Arduino Uno development board
- USB A->B cable

## Used software packages
| Name              | Tested version |
| ----------------- | -------------- |
| qtcreator         | 4.10.1-2
| arduino           | 1:1.8.9-3
| arduino-avr-core  | 1.6.23-1
| avr-gcc           | 9.2.0-1
| avr-binutils      | 2.32-1
| avr-libc          | 2.0.0-3

## Getting started
1. Clone project
2. Open project, configure with default settings. `ArduinoQt.pro.user` file should be generated with user specific config and host absolute paths.
3. In project file `ArduinoQt.pro` edit `ARDUINO_DIR` variable according to distribution used. For example:
> `ARDUINO_DIR=/usr/share/arduino/hardware/archlinux-arduino/avr/`
4. Under `Projects->Run Settings->Run configuration` add `Custom executable`
- Executable: /usr/bin/avrdude
- Command line arguments:
> `-c arduino -p m328p -P /dev/ttyUSB0 -b 115200 -U flash:w:led_blink.hex:i`

> where
> - `-c arduino` - type of programmer: built-in Uno board
> - `-p m328p` - microcontroller model
> - `-P /dev/ttyUSB0` - programmer port
> - `-b 115200` - port speed
> - `-U flash:w:led_blink.hex:i` - - specify the firmware area, type of operation (write) and firmware file

- Working directory: an absolute path to project bin directory where .hex file is

5. Connect board to computer and click run. All should be working now.

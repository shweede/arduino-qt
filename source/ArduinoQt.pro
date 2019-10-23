# Arduino Core root directory
ARDUINO_DIR=/usr/share/arduino/hardware/archlinux-arduino/avr/
# Select the target controller (Arduino Uno, Nano, Mini)
ARDUINO_MCU=atmega328p
# Controller clock frequency
ARDUINO_FCPU = 16000000L
# We can't run Qt on ATmega so no need for that
QT -= gui core
CONFIG -= qt
# Project template - application, ELF format executable will be compiled
TEMPLATE = app
# Set executable location and name
DESTDIR = ../bin
TARGET = led_blink
# Include header files
INCLUDEPATH += $$ARDUINO_DIR/cores/arduino
INCLUDEPATH += $$ARDUINO_DIR/variants/standard
INCLUDEPATH += $$ARDUINO_DIR/libraries
INCLUDEPATH += /usr/avr/include
# Set C compiler and its flags
QMAKE_CC = /usr/bin/avr-gcc
QMAKE_CFLAGS += -c -g -Os -w -ffunction-sections -fdata-sections
QMAKE_CFLAGS += -MMD -mmcu=$$ARDUINO_MCU -DF_CPU=$$ARDUINO_FCPU
QMAKE_CFLAGS += -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR
# Set C++ compiler and its flags
QMAKE_CXX = /usr/bin/avr-g++
QMAKE_CXXFLAGS += -c -g -Os -w  -ffunction-sections -fdata-sections
QMAKE_CXXFLAGS += -fno-exceptions -fno-threadsafe-statics
QMAKE_CXXFLAGS += -MMD -mmcu=$$ARDUINO_MCU -DF_CPU=$$ARDUINO_FCPU
QMAKE_CXXFLAGS += -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR
# Set linker and its flags
QMAKE_LINK = /usr/bin/avr-gcc
QMAKE_LFLAGS = -w -Os -Wl,--gc-sections -mmcu=$$ARDUINO_MCU
QMAKE_LIBS = -lm
# Configure post-processing to convert ELF file to Intel HEX for loading into board
QMAKE_POST_LINK += /usr/bin/avr-objcopy -O ihex -j .text -j .data -S ${TARGET} ${TARGET}.hex
# Specify which header files are included in the project
HEADERS += $$files($$ARDUINO_DIR/cores/arduino/*.h) \
    src/led_blink.h
HEADERS += $$files($$ARDUINO_DIR/variants/standard/*.h)
# Define Arduino Core source files
SOURCES += $$files($$ARDUINO_DIR/cores/arduino/*.c)
SOURCES += $$files($$ARDUINO_DIR/cores/arduino/*.cpp)
# Project sources
SOURCES += $$files(./src/*.cpp)
# Project headers
INCLUDEPATH += ./src
HEADERS += $$files(./src/*.h)

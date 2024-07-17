# Digital Clock - VHDL Implementation

## Project Overview

This repository contains the VHDL code for a digital clock, developed as a final project for the Logic 2 course at the Faculty of Engineering, Alexandria University. The digital clock is designed to keep track of hours, minutes, and seconds, and is implemented using VHDL.

## Team Members

- Fatema Elzahraa Ezzat
- Nada Ahmed
- Nada Hisham Ali
- Nada Omar
- Rodina Ashraf


## Course Details

- **Course Name:** Logic 2
- **Institution:** Faculty of Engineering, Alexandria University
- **Instructor:** Dr Nayra

## Defined Type: `v_of_v`

The type `v_of_v` is defined as a vector of vectors, which is an array of `STD_LOGIC_VECTOR`.

## Entity: `digital_clock`

The main entity of the digital clock which includes:
- `clk`: Clock input, assumed to be 1 Hz.
- `reset`: Reset input.
- `inp_sec`: Input seconds as an array of `STD_LOGIC_VECTOR`.
- `inp_min`: Input minutes as an array of `STD_LOGIC_VECTOR`.
- `inp_hr`: Input hours as an array of `STD_LOGIC_VECTOR`.
- `sec`: Output seconds as an array of `STD_LOGIC_VECTOR`.
- `min`: Output minutes as an array of `STD_LOGIC_VECTOR`.
- `hr`: Output hours as an array of `STD_LOGIC_VECTOR`.

## Architecture: `BEH`

The architecture of the digital clock which includes:
- Signals for seconds, minutes, and hours.
- Processes to implement the clock functionality, including incrementing seconds, minutes, and hours based on the clock input and reset signal.

### Signals

- `sec0_reg`, `sec0_next`: Registers and next state for the least significant digit of seconds.
- `sec1_reg`, `sec1_next`: Registers and next state for the most significant digit of seconds.
- `min0_reg`, `min0_next`: Registers and next state for the least significant digit of minutes.
- `min1_reg`, `min1_next`: Registers and next state for the most significant digit of minutes.
- `hr0_reg`, `hr0_next`: Registers and next state for the least significant digit of hours.
- `hr1_reg`, `hr1_next`: Registers and next state for the most significant digit of hours.

### Process

A process that updates the registers based on the clock input and reset signal. It increments the seconds, minutes, and hours and handles the carry-over between the digits.

## Usage

To use this VHDL code, include the type definition `v_of_v` and instantiate the `digital_clock` entity in your VHDL project. Connect the clock, reset, input seconds, input minutes, and input hours signals to the corresponding ports of the `digital_clock` entity.

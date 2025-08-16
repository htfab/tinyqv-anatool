<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

The peripheral index is the number TinyQV will use to select your peripheral.  You will pick a free
slot when raising the pull request against the main TinyQV repository, and can fill this in then.  You
also need to set this value as the PERIPHERAL_NUM in your test script.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

# Your project title

Author: htfab

Peripheral index: nn

## What it does

Allows building low frequency ADCs, DACs, capacitive sensors etc. using passives only

(To be expanded)

## Register map

Document the registers that are used to interact with your peripheral

| Address | Name  | Access | Description                                                         |
|---------|-------|--------|---------------------------------------------------------------------|
| 0x00    | OUT0  | W      | Output channel 0 duty cycle: 1b sign, 4b exponent, 3b mantissa      |
| 0x01    | OUT1  | W      | Output channel 1 duty cycle: 1b sign, 4b exponent, 3b mantissa      |
| 0x02    | OUT2  | W      | Output channel 2 duty cycle: 1b sign, 4b exponent, 3b mantissa      |
| 0x03    | IN    | R      | Selected input duty cycle: 1b sign, 4b exponent, 3b mantissa        |
| 0x04    | DIV   | W      | Clock divider: 4b exponent, 4b mantissa                             |
| 0x05    | CH    | W      | Input channel number (0 to 7)

## How to test

Explain how to use your project

## External hardware

Depending on the circuit you want to build it might be useful to have a few
- ceramic capacitors (100nF)
- resistors (100Ω, 10kΩ, 1MΩ)
- potmeters (10kΩ linear)
- standard through-hole LEDs
- and a breadboard with some wires

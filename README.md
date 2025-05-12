# Verilog---Electronic-Level

This is 3 steps in for creating an electronic level.

-> Step 0 <-
Display a circle moving in a circular (roundabout) pattern on a 6x7 segment display.
This simulates the rotation of an object along a circular path and represents the first stage in creating the electronic level.

-> Step 1 <-
Enable read access from the accelerometer sensor via the SPI interface.
When the button (KEY[1]) is pressed, read the value of the sensor register whose address is specified by the switches (SW[5:0]). Display the read value on the LED array (LEDR[7:0]).
Each button press triggers exactly one read operation, regardless of how long the button is held down (hint: use an edge detector).
Store the last read value in a register when the read confirmation signal is received. Connect the output of this register to the LEDs.

-> Step 2 <-

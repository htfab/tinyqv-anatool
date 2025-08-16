#!/bin/bash
f4pga -vv build --flow anatool-basys3.json
mkdir -p build/log
mv *.log build/log/
cp build/basys3/fpga_top.bit anatool.bit

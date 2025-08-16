import machine, struct, time

cs = machine.Pin(17, machine.Pin.OUT)
sck = machine.Pin(18, machine.Pin.OUT)
mosi = machine.Pin(19, machine.Pin.OUT)
miso = machine.Pin(16, machine.Pin.IN)

useSoftSpi = False

if useSoftSpi:
    spi = machine.SoftSPI(
                  baudrate=10,
                  polarity=0,
                  phase=0,
                  bits=8,
                  firstbit=machine.SPI.MSB,
                  sck=sck,
                  mosi=mosi,
                  miso=miso)
else:
    spi = machine.SPI(0,
                  baudrate=1000000,
                  polarity=0,
                  phase=0,
                  bits=8,
                  firstbit=machine.SPI.MSB,
                  sck=sck,
                  mosi=mosi,
                  miso=miso)

def write_reg(address, value):
    cs.value(0)
    spi.write(struct.pack('>B', 128 + address) + struct.pack('>B', value))
    cs.value(1)

def read_reg(address):
    cs.value(0)
    spi.write(struct.pack('>B', address))
    res, = struct.unpack('>B', spi.read(1))
    cs.value(1)
    return res

def adc_test():
    write_reg(4, 96)
    while True:
        print(read_reg(3))
        time.sleep(0.1)

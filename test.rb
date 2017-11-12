require 'pi_piper'
include PiPiper

pin = PiPiper::Pin.new(pin: 4, direction: :out)

pin.on
sleep 1
pin.off
# Install Arduino

## Install Arduino (Ubuntu 22.04 Jammy)

```bash
sudo apt install arduino
```

## Troubleshooting

### Arduino does not open (Ubuntu 22.04 Jammy)

Issue <https://bugs.launchpad.net/ubuntu/+source/arduino/+bug/1916278> (Ubuntu 22.04.1 Jammy):

```
Picked up JAVA_TOOL_OPTIONS: 
java.lang.UnsatisfiedLinkError: /usr/lib/x86_64-linux-gnu/liblistSerialsj.so.1.4.0: /usr/lib/x86_64-linux-gnu/liblistSerialsj.so.1.4.0: undefined symbol: sp_get_port_usb_vid_pid
	at java.base/java.lang.ClassLoader$NativeLibrary.load0(Native Method)
	at java.base/java.lang.ClassLoader$NativeLibrary.load(ClassLoader.java:2445)
	at java.base/java.lang.ClassLoader$NativeLibrary.loadLibrary(ClassLoader.java:2501)
	at java.base/java.lang.ClassLoader.loadLibrary0(ClassLoader.java:2700)
	at java.base/java.lang.ClassLoader.loadLibrary(ClassLoader.java:2662)
	at java.base/java.lang.Runtime.loadLibrary0(Runtime.java:830)
	at java.base/java.lang.System.loadLibrary(System.java:1873)
	at processing.app.Platform.<clinit>(Platform.java:143)
	at java.base/java.lang.Class.forName0(Native Method)
	at java.base/java.lang.Class.forName(Class.java:315)
	at processing.app.BaseNoGui.initPlatform(BaseNoGui.java:514)
	at processing.app.Base.<init>(Base.java:201)
	at processing.app.Base.main(Base.java:141)
```

Solution (via <https://bugs.launchpad.net/ubuntu/+source/arduino/+bug/1916278/comments/11> by `Uğur Çetin`)

```bash
sudo apt install libserialport0 patchelf
sudo patchelf --add-needed /usr/lib/x86_64-linux-gnu/libserialport.so.0 /usr/lib/x86_64-linux-gnu/liblistSerialsj.so.1.4.0
```

### No ports in Tools: Ports (Ubuntu 22.04 Jammy)

Inspecting in `dmesg`/`tail -f /var/log/syslog`, lots of `brltty`. Solution (via `flaviut` at <https://unix.stackexchange.com/questions/670636/unable-to-use-usb-dongle-based-on-usb-serial-converter-chip/670637#670637>):

```bash
for f in /usr/lib/udev/rules.d/*brltty*.rules; do
    sudo ln -s /dev/null "/etc/udev/rules.d/$(basename "$f")"
done
sudo udevadm control --reload-rules
sudo systemctl mask brltty.path
```

And reboot!

### avrdude: stk500_recv(): programmer is not responding (Arduino Nano)

Try each (thanks `david_2018` at <https://forum.arduino.cc/t/solved-can-not-upload-to-nano-after-ubuntu-update-feb-04-2022/955456/3>):

- Tools > Processor: "ATmega328P"
- Tools> Processor: "ATmega328P (Old Bootloader)"

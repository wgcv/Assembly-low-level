https://rderik.com/blog/let-s-write-some-assembly-code-in-macos-for-intel-x86-64/
yasm -f macho64 hello_intel.asm
ld -o hello_intel hello_intel.o -platform_version macos 10.15 11.0 -lSystem -syslibroot $(xcrun --show-sdk-path)

as hello_atnt.asm -o hello_atnt.o
ld -o hello_atnt hello_atnt.o -platform_version macos 10.15 11.0 -lSystem -syslibroot $(xcrun --show-sdk-path)

import os


if os.path.exists('IR_hex.txt'):
    os.remove('IR_hex.txt')
hex_text = open('IR_hex.txt', "w")
if os.path.exists('IR_bin.txt'):
    os.remove('IR_bin.txt')
bin_text = open('IR_bin.txt', "w")

# Threshold determines 1 and 0 pulse widths.
# Data is not consistent using a single threshold for some reason.

threshold = 600

with open("IR_parsed.txt", "r") as text:
    for line in text:
        trimmed = line[7:]
        pairs = trimmed.split(",")
        val_time = []
        one_lengths = []
        bits = []

        for pair in pairs:
            pair_split = pair.split('@')
            val_time.append([int(pair_split[0]), float(pair_split[1])])

        for change in range(len(val_time)):
            if change > 2 and val_time[change][0] == 0:
                one_lengths.append(int((val_time[change][1]-val_time[change-1][1])*10**6+.5))
                bits.append('1' if int((val_time[change][1]-val_time[change-1][1])*10**6+.5) > threshold else '0')
        print one_lengths
        binary = ''.join(bits[:32])
        bin_text.write(str(line[0]) + ": " + binary + '\n')
        hexa = hex(int(binary, base=2))
        hex_text.write(str(line[0]) + ": " + str(hexa) + '\n')

hex_text.close()
bin_text.close()


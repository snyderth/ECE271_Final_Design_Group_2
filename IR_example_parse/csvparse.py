import csv
import os


def parse_csv(txt_name):
    prev_high = None
    shift = None

    output = ""

    times = []
    values = []
    with open(str(txt_name) + ".txt") as csv_file:
        reader = csv.reader(csv_file, delimiter=',')
        line = 0
        for row in reader:
            if line == 0:
                # Column names
                line += 1
            elif line == 1:
                # First row of values, sets prev_high to its initial value.
                if float(row[1]) > 1.5:
                    prev_high = True
                    times.append(float(0))
                    values.append(1)
                else:
                    prev_high = False
                    times.append(float(0))
                    values.append(0)
                shift = float(row[0])

                # shift allows time to start at 0.
                line += 1
            else:
                if prev_high and float(row[1]) < 1:
                    prev_high = False
                    times.append(float(row[0]) - shift)
                    values.append(0)
                elif (not prev_high) and float(row[1]) > 2.5:
                    prev_high = True
                    times.append(float(row[0]) - shift)
                    values.append(1)
                line += 1

    for i in range(len(times)):
        if i != len(times)-1:
            # print str(values[i]) + " @ " + str(times[i]) + ","
            output += str(values[i]) + " @ " + str(times[i]) + ", "
        else:
            # print str(values[i]) + " @ " + str(times[i])
            output += str(values[i]) + " @ " + str(times[i])
    print "Parsed " + str(line - 1) + " lines in " + str(txt_name) + ".txt."
    return output


if os.path.exists('IR_parsed.txt'):
    os.remove('IR_parsed.txt')
with open('IR_parsed.txt', "w") as out:
    for num in range(10):
        out.write(str(num) + " data: " + parse_csv(num) + '\n')

print "Wrote to 'IR_parsed.txt.'\n"
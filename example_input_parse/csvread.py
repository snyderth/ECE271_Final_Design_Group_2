import csv

prev_clk_high = True

values = []

logic_values = ""

with open('a.txt') as csv_file:
    reader = csv.reader(csv_file, delimiter=',')
    line = 0
    for row in reader:
        if line == 0:
            # Column names
            line += 1
        else:
            if float(row[1]) < 1 and prev_clk_high:
                values.append(float(row[2]))
                prev_clk_high = False
            elif float(row[1]) > 4 and not prev_clk_high:
                prev_clk_high = True
            line += 1
for value in values:
    if value < 2:
        logic_values += '0'
    else:
        logic_values += '1'
print logic_values


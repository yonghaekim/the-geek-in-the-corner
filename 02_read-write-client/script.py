
arr = []
file = "temp1.txt"

f = open(file, "r")
for line in f.readlines():
  arr.append(int(line))
f.close()

for i in range(2, 150):
  file = "temp" + str(i) + ".txt"

  f = open(file, "r")
  i = 0;
  for line in f.readlines():
    arr[i] += int(line)
    i += 1
  f.close()

f1 = open("output1.txt", "w+")
f2 = open("output2.txt", "w+")
for i in range(100000):
  if i % 2 == 0:
    f1.write(str(arr[i] / 150))
    f1.write("\n")
  else:
    f2.write(str(arr[i] / 150))
    f2.write("\n")
f1.close()
f2.close()

#!/usr/local/bin/python3

def genRegressors(name, list):
  ret = ""
  for id in list:
    ret += name + str(id) + " "
  return ret

def printContent(name, suffix, list):
  ret = ""
  ret += "reg " + name + suffix + " " + genRegressors('delta', list)
  ret += "$params, robust"
  return ret

def printFun(lists):
  for list in lists:
    print(printContent('quant', '_2', list))
    print(printContent('quant', '_3', list))
    #print(printContent('quant', '_23', list))

    # print(printContent('moyenne', list))

# string = """\
# gen tmp_ponderated = CR * $grade if {1}
# gen tmp_CR = CR if {1}
# egen tmp_total_CR = sum(tmp_CR) , by(ID)
# egen tmp_summed = sum(tmp_ponderated), by(ID)
# gen moyenne_{0} = tmp_summed/tmp_total_CR
# drop tmp_ponderated tmp_CR tmp_total_CR tmp_summed
# """

# print(string.format("OTH1", "sci == 0 & year == 1"))
# print(string.format("SCI1", "sci == 1 & year == 1"))
# print(string.format("MIX1", "sci == 2 & year == 1"))

# print(string.format("SCI2", "sci == 1 & year == 2"))
# print(string.format("SCI3", "sci == 1 & year == 3"))

# print(string.format("1", "year == 1"))
# print(string.format("2", "year == 2"))
# print(string.format("3", "year == 3"))

# print(string.format("23", "year == 2 | year == 3"))

# string = """\
# gen tmp_ponderated = CR * delta if {1}
# gen tmp_CR = CR if {1}
# egen tmp_total_CR = sum(tmp_CR) , by(ID)
# egen tmp_summed = sum(tmp_ponderated), by(ID)
# gen delta_{0} = tmp_summed/tmp_total_CR
# drop tmp_ponderated tmp_CR tmp_total_CR tmp_summed
# """

# print(string.format("OTH1", "sci == 0 & year == 1"))
# print(string.format("SCI1", "sci == 1 & year == 1"))
# print(string.format("MIX1", "sci == 2 & year == 1"))
# print(string.format("NONSCI1", "(sci == 0 | sci==2) & year == 1"))
# print(string.format("2", "year == 2"))
# print(string.format("3", "year == 3"))

printFun([[6, 51, 95, 121, 139, 148, 170], [6, 25, 26, 52, 55, 103, 104, 122, 123, 131, 171, 172], [6, 25, 26, 52, 57, 103, 104, 122, 123, 133, 171, 172], [6, 25, 26, 52, 57, 103, 104, 122, 123, 133, 171, 172]])



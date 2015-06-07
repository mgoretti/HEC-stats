#!/usr/local/bin/python3

def printFun(list):
  for name in list[:-1]:
    print('cours == "' + name + '" | ///')
  print('cours == "' + list[-1] + '"')


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

string = """\
gen tmp_ponderated = CR * delta if {1}
gen tmp_CR = CR if {1}
egen tmp_total_CR = sum(tmp_CR) , by(ID)
egen tmp_summed = sum(tmp_ponderated), by(ID)
gen delta_{0} = tmp_summed/tmp_total_CR
drop tmp_ponderated tmp_CR tmp_total_CR tmp_summed
"""

print(string.format("OTH1", "sci == 0 & year == 1"))
print(string.format("SCI1", "sci == 1 & year == 1"))
print(string.format("MIX1", "sci == 2 & year == 1"))
print(string.format("NONSCI1", "(sci == 0 | sci==2) & year == 1"))
print(string.format("OTH2", "sci == 0 & year == 2"))
print(string.format("SCI2", "sci == 1 & year == 2"))
print(string.format("MIX2", "sci == 2 & year == 2"))
print(string.format("OTH23", "sci == 0 & year != 1"))
print(string.format("SCI23", "sci == 1 & year != 1"))
print(string.format("MIX23", "sci == 2 & year != 1"))
print(string.format("2", "year == 2"))
print(string.format("3", "year == 3"))
print(string.format("23", "year == 2 | year == 3"))

string = """\
gen tmp_ponderated = CR * note if {1}
gen tmp_CR = CR if {1}
egen tmp_total_CR = sum(tmp_CR) , by(ID)
egen tmp_summed = sum(tmp_ponderated), by(ID)
gen moyenne_{0} = tmp_summed/tmp_total_CR
drop tmp_ponderated tmp_CR tmp_total_CR tmp_summed
"""

print(string.format("2", "year == 2"))
print(string.format("3", "year == 3"))
print(string.format("23", "year == 2 | year == 3"))

string = """\
gen tmp_ponderated = CR * quant if {1}
gen tmp_CR = CR if {1}
egen tmp_total_CR = sum(tmp_CR) , by(ID)
egen tmp_summed = sum(tmp_ponderated), by(ID)
gen quant_{0} = tmp_summed/tmp_total_CR
drop tmp_ponderated tmp_CR tmp_total_CR tmp_summed
"""

# print(string.format("2", "year == 2"))
# print(string.format("3", "year == 3"))
print(string.format("23", "year == 2 | year == 3"))
print(string.format("OTH23", "sci == 0 & year != 1"))
print(string.format("SCI23", "sci == 1 & year != 1"))
print(string.format("MIX23", "sci == 2 & year != 1"))


# print(string.format("SCI2", "sci == 1 & year == 2"))
# print(string.format("SCI3", "sci == 1 & year == 3"))

# print(string.format("1", "year == 1"))
# print(string.format("2", "year == 2"))
# print(string.format("3", "year == 3"))

# print(string.format("23", "year == 2 | year == 3"))
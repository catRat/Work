library(readxl)
booking <- read_excel("C:\\Users\\sz0108\\Downloads\\volume_detail.xls")
library(reshape)
bookingMelt <- melt(booking, id = (c("Salesman", "SalesGroup", "SalesmanType","FCL/LCL", "SvcType", "BookingNo",
                                "JobNo", "I/E", "Office", "Trade", "ShCode", "ShName", "CnCode", "CnName",
                                "NpCode", "NpName", "AgtCode", "AgtName", "Vessel/Voyage", "AMS Vsl/Voy",
                                "POR", "POL", "VIA", "POD", "PLD", "Cluster", "Region", "Etd",
                                "Year", "Month", "Week", "Eta", "Month__1", "20'", "40'", "40'HQ",
                                "45'", "wgt", "cbm", "PKG", "PKGUnit", "Principle", "Comodity",
                                "ContractCommodity", "Contract No", "RateType", "SC_Owner", "POD ETA",
                                "Service", "NAC", "MBL PLD", "AMS SHIPPER", "AMS CNSIGNEE", "FromOffice",
                                "MBLNo", "CarrierCode", "CarrierName", "ToOffice")))
bookingCast <- cast(bookingMelt, Office+Service~variable, sum)
library(writexl)
write_xlsx(bookingCast, "bookingCast.xlsx")
cat(date())

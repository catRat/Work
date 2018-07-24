library(readxl)
volume <- read_excel("C:\\Users\\sz0108\\Downloads\\volume_detail(1).xls")
names(volume)[46] <- 'Contract_No'
volume$Etd <- as.Date(volume$Etd)
portOld <- volume[which(grepl('\\w+17\\d+', volume$"Contract_No")), ]
pointDate <- as.Date("2018-04-30")
portOld <- subset(portOld, Etd > pointDate, Salesman:ToOffice)
portOld$'Contract_No' <- sub('17', '18', portOld$'Contract_No')
portNew <- volume[which(grepl('\\w+18\\d+', volume$"Contract_No")), ]
newVolume <- rbind(portOld, portNew)
library(reshape)
i.melt <- melt(newVolume, id = (c("Salesman", "SalesGroup", "SalesmanType","FCL/LCL", "SvcType", "BookingNo",
                                "JobNo", "I/E", "Office", "Trade", "ShCode", "ShName", "CnCode", "CnName",
                                "NpCode", "NpName", "AgtCode", "AgtName", "Vessel/Voyage", "AMS Vsl/Voy",
                                "POR", "POL", "VIA", "POD", "PLD", "Cluster", "Region", "Etd",
                                "Year", "Month", "Week", "Eta", "Month__1", "20'", "40'", "40'HQ",
                                "45'", "wgt", "cbm", "PKG", "PKGUnit", "Principle", "Comodity",
                                "ContractCommodity", "Contract_No", "RateType", "SC_Owner", "POD ETA",
                                "Service", "NAC", "MBL PLD", "AMS SHIPPER", "AMS CNSIGNEE", "FromOffice",
                                "MBLNo", "CarrierCode", "CarrierName", "ToOffice")))
week <- cast(i.melt, Office+Week~variable, sum)
library(writexl)
write_xlsx(week, "week.xlsx")
contract <- cast(i.melt, Office+Week+Contract_No~variable, sum)
write_xlsx(contract, "contract.xlsx")
cat('done!\n', date())

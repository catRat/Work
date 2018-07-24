library(readxl)
volume <- read_excel("C:\\Users\\sz0108\\Downloads\\volume_detail(2).xls")
names(volume)[46] <- 'Contract_No'
volume$Etd <- as.Date(volume$Etd)
portOld <- volume[which(grepl('17-\\w+', volume$"Contract_No")), ]
pointDate <- as.Date("2018-05-01")
portOld <- subset(portOld, Etd > pointDate, Salesman:ToOffice)
portOld$'Contract_No' <- sub('17', '18', portOld$'Contract_No')
portOld$'Contract_No' <- sub('0769', '0807', portOld$'Contract_No')
portOld$'Contract_No' <- sub('1009', '1394', portOld$'Contract_No')
portNew <- volume[which(grepl('18-\\w+', volume$"Contract_No")), ]
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


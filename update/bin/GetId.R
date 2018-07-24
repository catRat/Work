GetId <- function(x = 'COSU') {
  # Change the carrier code-name to 
  # contract id.
  s <- c()
  for(i in seq(x)) {
    s[i] <- switch((x[i]),
      APLU = "EB18/1668",
      CMDU = "18-0807",
      COSU = "ATN18888",
      EGLV = "SC71586",
      HDMU = "1817202",
      HLCU = "S18ANC119",
      MAEU = "37238211",
      MSCU = "18-218TPC",
      OOLU = "PE184717",
      PABV = "ANO170044",
      SMLM = "AEF182888",
      SUDU = "LHKC8000027",
      WHLC = "YTN18-164N",
      YMLU = "651518",
      ZIMU = "Z18462HK",
      ONEY = "SHAN00006",
      cat(x[i], "is not a recognized type\n")
    )
  }
  return(s)
}

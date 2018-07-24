GetCode <- function(x = 'cosco') {
  # Change the carrier name to carrier 
  # code-name.
  s <- c()
  for(i in seq(x)) {
  s[i] <- switch((x[i]),
    APL = "APLU",
    CMA = "CMDU",
    COSCO = "COSU",
    EMC = "EGLV",
    HMM = "HDMU",
    HPL = "HLCU",
    MSK = "MAEU",
    MSC = "MSCU",
    OOCL = "OOLU",
    PIL = "PABV",
    SML = "SMLM",
    HBS = "SUDU",
    WHL = "WHLC",
    YML = "YMLU",
    ZIM = "ZIMU",
    ONE = "ONEY",
    cat(x[i], "is not a recognized type\n")
    )
  }
  return(s)
}


# ========================= Inställningar ===========================
Lanskod <- 20    # Välj vilket län du vill göra körningen för
skriptMapp <- "C:\\Users\\pmo\\OneDrive - Högskolan Dalarna\\Auto AF\\"
# Dessa används om du växelvis kör skriptet på två datorer så du slipper hålla
# reda på vilken dator du är på. Om du bara kör på en, kör samma sökväg på 
# båda variablerna nedan
sokvag1_pre <- "C:\\Users\\pmo\\OneDrive - Högskolan Dalarna\\Auto AF\\Uttag\\"
sokvag2_pre <- "C:\\Users\\Administratör\\OneDrive - Region Dalarna\\Auto AF\\Uttag\\"
# Används för att se var i skripten vi är någonstans, används främst vid
# felsökning
LoggMedd <- FALSE

# ========================== Förberedelser ==========================
#  Laddar in nödvändiga packages 
library(tidyverse)
library(RSelenium)
library(rvest)
library(stringr)

oldw <- getOption("warn")
options(warn = -1)

# Ladda funktioner för att navigera på AF:s statistiksida och ladda hem data
source("funktioner_veckostat.R", encoding = "UTF-8")

# ===================== Här börjar inläsningen =======================
StartTidtotal <- Sys.time()
# ====================== Öppet arbetslösa ============================
StartTid <- Sys.time()
aktKor <- "Öppet arbetslösa"
Filnamn <- "AF OppetArblosa uttag.xlsx"
sokvag1 <- paste0(sokvag1_pre,Filnamn)
sokvag2 <- paste0(sokvag2_pre,Filnamn)
suppressMessages(source("C:\\Users\\pmo\\OneDrive - Högskolan Dalarna\\Auto AF\\AF_OppetArblosa.R", encoding = "utf-8"))
print(paste0("Att läsa in ", aktKor, " tog ",TidFormaterat(Sys.time(),StartTid)))
Sys.sleep(5)  # Vänta 5 sekunder innan nästa skript körs
# ====================== Långtidsarbetslösa ============================
StartTid <- Sys.time()
aktKor <- "Långtidsarbetslösa"
Filnamn <- "AF LangArblosa uttag.xlsx"
sokvag1 <- paste0(sokvag1_pre,Filnamn)
sokvag2 <- paste0(sokvag2_pre,Filnamn)
suppressWarnings(suppressMessages(source("C:\\Users\\pmo\\OneDrive - Högskolan Dalarna\\Auto AF\\AF_Langtidsarblosa.R", encoding = "utf-8")))
print(paste0("Att läsa in ", aktKor, " tog ",TidFormaterat(Sys.time(),StartTid)))
Sys.sleep(5)  # Vänta 5 sekunder innan nästa skript körs
# ====================== Nyinskrivna ============================
StartTid <- Sys.time()
aktKor <- "Nyinskrivna"
Filnamn <- "AF Nyinskrivna uttag.xlsx"
sokvag1 <- paste0(sokvag1_pre,Filnamn)
sokvag2 <- paste0(sokvag2_pre,Filnamn)
source("C:\\Users\\pmo\\OneDrive - Högskolan Dalarna\\Auto AF\\AF_Nyanmalda.R", encoding = "utf-8")
print(paste0("Att läsa in ", aktKor, " tog ",TidFormaterat(Sys.time(),StartTid)))
Sys.sleep(5)  # Vänta 5 sekunder innan nästa skript körs
# ====================== Fått jobb under veckan ============================
StartTid <- Sys.time()
aktKor <- "Fått jobb under veckan"
Filnamn <- "AF FattJobb uttag.xlsx"
sokvag1 <- paste0(sokvag1_pre,Filnamn)
sokvag2 <- paste0(sokvag2_pre,Filnamn)
source("C:\\Users\\pmo\\OneDrive - Högskolan Dalarna\\Auto AF\\AF_FattJobbUnderVeckan.R", encoding = "utf-8")
print(paste0("Att läsa in ", aktKor, " tog ",TidFormaterat(Sys.time(),StartTid)))
Sys.sleep(5)  # Vänta 5 sekunder innan nästa skript körs
# ====================== Lediga jobb ============================
StartTid <- Sys.time()
aktKor <- "Lediga jobb"
Filnamn <- "AF LedigaPlatser uttag.xlsx"
sokvag1 <- paste0(sokvag1_pre,Filnamn)
sokvag2 <- paste0(sokvag2_pre,Filnamn)
source("C:\\Users\\pmo\\OneDrive - Högskolan Dalarna\\Auto AF\\AF_LedigaPlatser.R", encoding = "utf-8")
print(paste0("Att läsa in ", aktKor, " tog ",TidFormaterat(Sys.time(),StartTid)))

options(warn = oldw)
Sys.sleep(5)  # Vänta 5 sekunder innan nästa skript körs

print(paste0("Hela körningen tog totalt ",TidFormaterat(Sys.time(),StartTidtotal)))
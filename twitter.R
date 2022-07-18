library(rtweet)
library(httr)

manchete_token <- rtweet::create_token(
  app = "Manchete",
  consumer_key =    Sys.getenv("TWITTER_CONSUMER_API_KEY"),
  consumer_secret = Sys.getenv("TWITTER_CONSUMER_API_SECRET"),
  access_token =    Sys.getenv("TWITTER_ACCESS_TOKEN"),
  access_secret =   Sys.getenv("TWITTER_ACCESS_TOKEN_SECRET")
)

## TIER 1

#get file names
req <- httr::GET("https://api.github.com/repos/brunomioto/manchete/git/trees/master?recursive=1")
httr::stop_for_status(req) 
filelist <- unlist(lapply(httr::content(req)$tree, "[", "path"), use.names = F)

tier_1_files <- grep("_tier1", filelist, value = TRUE)

# Build the status message
tier_1_tweet_text <- paste0("Manchetes do dia ", format(Sys.time(), format="%d/%m/%Y %X", tz = "America/Sao_Paulo"),"\n\n",
                            ifelse(grep("folha", tier_1_files, value = TRUE) == "screenshots/foto1_folha_tier1.png",
                                   "- Folha de S. Paulo\n",""),
                            ifelse(grep("estadao", tier_1_files, value = TRUE) == "screenshots/foto2_estadao_tier1.png",
                                   "- O Estado de S. Paulo\n",""),
                            ifelse(grep("poder360", tier_1_files, value = TRUE) == "screenshots/foto3_poder360_tier1.png",
                                   "- Poder360",""),
                            ifelse(grep("g1", tier_1_files, value = TRUE) == "screenshots/foto4_g1_tier1.png",
                                   "- G1\n","")
)

# Post the status message to Twitter
rtweet::post_tweet(
  status = tier_1_tweet_text,
  media = tier_1_files,
  token = manchete_token
)

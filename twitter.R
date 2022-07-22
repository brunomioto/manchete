#library(rtweet)
#library(httr)

manchete_token <- rtweet::rtweet_bot(
  #app = "Manchete",
  api_key =    Sys.getenv("TWITTER_CONSUMER_API_KEY"),
  api_secret = Sys.getenv("TWITTER_CONSUMER_API_SECRET"),
  access_token =    Sys.getenv("TWITTER_ACCESS_TOKEN"),
  access_secret =   Sys.getenv("TWITTER_ACCESS_TOKEN_SECRET")
)

#rtweet::auth_as(manchete_token)

## TIER 1

#get file names
req <- httr::GET("https://api.github.com/repos/brunomioto/manchete/git/trees/master?recursive=1")
httr::stop_for_status(req) 
filelist <- unlist(lapply(httr::content(req)$tree, "[", "path"), use.names = F)

tier_1_files <- grep("_tier1", filelist, value = TRUE)

# Build the status message
tier_1_tweet_text <- paste0("Manchetes do dia ", format(Sys.time(), format="%d/%m/%Y %X", tz = "America/Sao_Paulo"),"\n\n",
                            ifelse(isTRUE(grep("globo", tier_1_files, value = TRUE) == "screenshots/foto1_oglobo_tier1.png") == TRUE,
                                   "- O Globo\n",""),
                            ifelse(isTRUE(grep("folha", tier_1_files, value = TRUE) == "screenshots/foto2_folha_tier1.png") == TRUE,
                                   "- Folha de S. Paulo\n",""),
                            ifelse(isTRUE(grep("estadao", tier_1_files, value = TRUE) == "screenshots/foto3_estadao_tier1.png") == TRUE,
                                   "- O Estado de S. Paulo\n",""),
                            ifelse(isTRUE(grep("g1", tier_1_files, value = TRUE) == "screenshots/foto4_g1_tier1.png") == TRUE,
                                   "- G1\n","")
)

# Post the status message to Twitter
rtweet::post_tweet(
  status = tier_1_tweet_text,
  media = tier_1_files,
  media_alt_text = c("Homepage do portal O Globo do dia de hoje",
                     "Homepage do portal Folha de São Paulo do dia de hoje",
                     "Homepage do portal O Estado de São Paulo do dia de hoje",
                     "Homepage do portal G1 do dia de hoje"),
  token = manchete_token
)

## TIER 2

#get file names
req <- httr::GET("https://api.github.com/repos/brunomioto/manchete/git/trees/master?recursive=1")
httr::stop_for_status(req) 
filelist <- unlist(lapply(httr::content(req)$tree, "[", "path"), use.names = F)

tier_2_files <- grep("_tier2", filelist, value = TRUE)

# Build the status message
tier_2_tweet_text <- paste0("Manchetes do dia ", format(Sys.time(), format="%d/%m/%Y %X", tz = "America/Sao_Paulo"),"\n\n",
                            ifelse(isTRUE(grep("istoe", tier_2_files, value = TRUE) == "screenshots/foto1_istoe_tier2.png") == TRUE,
                                   "- IstoÉ\n",""),
                            ifelse(isTRUE(grep("metropoles", tier_2_files, value = TRUE) == "screenshots/foto2_metropoles_tier2.png") == TRUE,
                                   "- Metrópoloes\n",""),
                            ifelse(isTRUE(grep("poder360", tier_2_files, value = TRUE) == "screenshots/foto3_poder360_tier2.png") == TRUE,
                                   "- Poder360\n",""),
                            ifelse(isTRUE(grep("extra", tier_2_files, value = TRUE) == "screenshots/foto4_extra_tier2.png") == TRUE,
                                   "- Extra\n","")
)

# Post the status message to Twitter
rtweet::post_tweet(
  status = tier_2_tweet_text,
  media = tier_2_files,
  media_alt_text = c("Homepage do portal IstoÉ do dia de hoje",
                     "Homepage do portal Metrópoles do dia de hoje",
                     "Homepage do portal Poder360 do dia de hoje",
                     "Homepage do portal Extra do dia de hoje"),
  token = manchete_token
)

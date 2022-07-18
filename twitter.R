library(rtweet)

manchete_token <- rtweet::create_token(
  app = "Manchete",
  consumer_key =    Sys.getenv("TWITTER_CONSUMER_API_KEY"),
  consumer_secret = Sys.getenv("TWITTER_CONSUMER_API_SECRET"),
  access_token =    Sys.getenv("TWITTER_ACCESS_TOKEN"),
  access_secret =   Sys.getenv("TWITTER_ACCESS_TOKEN_SECRET")
)

# Build the status message
tweet_text <- paste0("Manchetes do dia ", format(Sys.time(), format="%d/%m/%Y %X"))

# Post the status message to Twitter
rtweet::post_tweet(
  status = tweet_text,
  media = c("./screenshots/folha.png",
            "./screenshots/g1.png",
            "./screenshots/estadao.png",
            "./screenshots/poder360.png"),
  token = manchete_token
)

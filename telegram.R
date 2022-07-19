library(telegram)

#connect manchete_bot
bot <- TGBot$new(token = bot_token('MANCHETE_BOT'))

bot$set_default_chat_id(-1001563823686)

#get file names
req <- httr::GET("https://api.github.com/repos/brunomioto/manchete/git/trees/master?recursive=1")
httr::stop_for_status(req) 
filelist <- unlist(lapply(httr::content(req)$tree, "[", "path"), use.names = F)

#send message
bot$sendMessage(paste0('Olá! Essas são as principais manchetes do dia ',
                       format(Sys.time(), format="%d/%m/%Y", tz = "America/Sao_Paulo"),
                       ' às ',
                       format(Sys.time(), format="%X", tz = "America/Sao_Paulo")
))

if(isTRUE(grep("foto1_oglobo_tier1", filelist, value = TRUE) == "screenshots/foto1_oglobo_tier1.png") == TRUE){
  bot$sendPhoto('./screenshots/foto1_oglobo_tier1.png')
}
if(isTRUE(grep("foto2_folha_tier1", filelist, value = TRUE) == "screenshots/foto2_folha_tier1.png") == TRUE){
  bot$sendPhoto('./screenshots/foto2_folha_tier1.png')
}
if(isTRUE(grep("foto3_estadao_tier1", filelist, value = TRUE) == "screenshots/foto3_estadao_tier1.png") == TRUE){
  bot$sendPhoto('./screenshots/foto3_estadao_tier1.png')
}
if(isTRUE(grep("foto4_g1_tier1", filelist, value = TRUE) == "screenshots/foto4_g1_tier1.png") == TRUE){
  bot$sendPhoto('./screenshots/foto4_g1_tier1.png')
}
if(isTRUE(grep("foto1_istoe_tier2", filelist, value = TRUE) == "screenshots/foto1_istoe_tier2.png") == TRUE){
  bot$sendPhoto('./screenshots/foto1_istoe_tier2.png')
}
if(isTRUE(grep("foto2_metropoles_tier2", filelist, value = TRUE) == "screenshots/foto2_metropoles_tier2.png") == TRUE){
  bot$sendPhoto('./screenshots/foto2_metropoles_tier2.png')
}
if(isTRUE(grep("foto3_poder360_tier2", filelist, value = TRUE) == "screenshots/foto3_poder360_tier2.png") == TRUE){
  bot$sendPhoto('./screenshots/foto3_poder360_tier2.png')
}
if(isTRUE(grep("foto4_extra_tier2", filelist, value = TRUE) == "screenshots/foto4_extra_tier2.png") == TRUE){
  bot$sendPhoto('./screenshots/foto4_extra_tier2.png')

library(telegram)

#connect manchete_bot
bot <- TGBot$new(token = bot_token('MANCHETE_BOT'))

bot$set_default_chat_id(-1001563823686)

#send message
bot$sendMessage(paste0('Olá! Essas são as principais manchetes do dia ',
                       format(Sys.time(), format="%d/%m/%Y", tz = "America/Sao_Paulo"),
                       ' às ',
                       format(Sys.time(), format="%X", tz = "America/Sao_Paulo")
                       ))

bot$sendPhoto('./screenshots/folha.png')
bot$sendPhoto('./screenshots/g1.png')
bot$sendPhoto('./screenshots/estadao.png')
bot$sendPhoto('./screenshots/poder360.png')

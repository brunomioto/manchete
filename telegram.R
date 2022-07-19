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

bot$sendPhoto('./screenshots/foto1_oglobo_tier1.png')
bot$sendPhoto('./screenshots/foto2_folha_tier1.png')
bot$sendPhoto('./screenshots/foto3_estadao_tier1.png')
bot$sendPhoto('./screenshots/foto4_g1_tier1.png')

bot$sendPhoto('./screenshots/foto1_istoe_tier2.png')
bot$sendPhoto('./screenshots/foto2_metropoles_tier2.png')
bot$sendPhoto('./screenshots/foto3_poder360_tier2.png')
bot$sendPhoto('./screenshots/foto4_extra_tier2.png')

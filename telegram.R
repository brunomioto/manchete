library(telegram)

#connect manchete_bot
bot <- TGBot$new(token = bot_token('manchete_bot'))

bot$set_default_chat_id(-1001563823686)

#send message
bot$sendMessage('oi')

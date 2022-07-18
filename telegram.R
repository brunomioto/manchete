library(telegram)

#connect manchete_bot
bot <- TGBot$new(token = bot_token('MANCHETE_BOT'))

bot$set_default_chat_id(-1001563823686)

#send message
bot$sendMessage('oi')

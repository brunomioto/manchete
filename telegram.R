library(telegram)

#connect manchete_bot
bot <- TGBot$new(token = bot_token('manchete_bot'))

#send message
bot$sendMessage('This is plain text')
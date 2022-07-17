library(webshot2)

# Lista portais
portais <- data.frame(
  url = c("https://www.folha.uol.com.br",
          "https://www.estadao.com.br/")
  file = paste("./screenshots/",c("folha","estadao"),".png")
)


# Efetua screenshot
webshot2::webshot(url = portais$url, vwidth = 1500, vheight = 2000,
                  file = portais$file, delay = 10, cliprect = "viewport")
  

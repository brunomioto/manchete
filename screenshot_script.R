library(webshot2)

# Lista portais
portais <- data.frame(
  url = c("https://www.folha.uol.com.br",
          "https://www.estadao.com.br",
          "https://www.poder360.com.br"),
  file = paste0("./screenshots/",c("folha","estadao", "poder360"),".png")
)

# Efetua screenshot
webshot2::webshot(url = portais$url, vwidth = 1500, vheight = 2000,
                  file = portais$file, delay = 10, cliprect = "viewport")

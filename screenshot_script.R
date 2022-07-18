library(webshot2)
library(purrr)

# Lista portais
portais <- data.frame(
  url = c("https://www.folha.uol.com.br",
          "https://www.estadao.com.br",
          "https://www.poder360.com.br",
          "https://g1.globo.com/"),
  file = paste0("./screenshots/",c("folha","estadao", "poder360", "g1"),".png"),
  nome = c("Folha", "Estadão", "Poder360", "G1")
)

# Cria um wrapper em torno da função de screenshot que inclui delay e torna a função "verbose"
paparazzi <- function(url, file, nome) {
  print(paste0("Fotografando ", nome, "..."))
  
  webshot2::webshot(url = url, vwidth = 1500, vheight = 2000,
                    file = file, delay = 25, cliprect = "viewport")
  
  Sys.sleep(5)
}

# Efetua o screenshot, um portal por vez
purrr::pwalk(
  .l = portais,
  .f = paparazzi
)
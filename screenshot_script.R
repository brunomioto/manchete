library(webshot2)
library(purrr)
library(dplyr)

# Lista portais
portais <- tibble(
  url = c("https://oglobo.globo.com/",
          "https://www.folha.uol.com.br",
          "https://www.estadao.com.br",
          "https://g1.globo.com/",
          "https://istoe.com.br/",
          "https://www.metropoles.com/",
          "https://www.poder360.com.br",
          "https://extra.globo.com/"
          # "https://www.r7.com",
          # "https://veja.abril.com.br",
          # "https://www.ig.com.br",
          # "https://www.cartacapital.com.br"
          ),
  nome = c("oglobo", "folha", "estadao", "g1",
           "istoe", "metropoles", "poder360", "extra"
           ),
  tier = c(rep("_tier1", 4),
           rep("_tier2", 4)
           )
) %>% 
  dplyr::group_by(tier) %>% 
  dplyr::mutate(
    ordem = paste0("foto", row_number(), "_"),
    file = paste0("./screenshots/", ordem, nome, tier, ".png")
  ) %>%
  dplyr::ungroup()

# Mantem apenas variáveis a serem usadas
portais <- portais %>% dplyr::select(url, file, nome)

# Cria um wrapper em torno da função de screenshot
# que inclui delay e torna a função "verbose"
paparazzi <- function(url, file, nome) {
  print(paste0("Fotografando ", nome, "..."))
  
  paths = paste0("./screenshots/",list.files("./screenshots"))
  
  if (!(file %in% paths)) {
    webshot2::webshot(url = url, vwidth = 1500, vheight = 2000,
                      file = file, delay = 25, cliprect = "viewport")
  } else {
    print(paste0("Fotografia de ", nome, " já encontrada! Seguindo..."))
  }
  
  Sys.sleep(10)
}

# Efetua o screenshot um portal por vez. Tenta todos portais mesmo que um falhe
safe_paparazzi <- purrr::safely(paparazzi)
purrr::pwalk(
  .l = portais,
  .f = safe_paparazzi
)

# Confirma a obtenção de todas as imagens. Provoca erro em caso de imagem faltante
paths = paste0("./screenshots/",list.files("./screenshots"))
if (sum(portais$file %in% paths) != 8) {
  stop("Nem todas imagens foram obtidas. Fotografando novamente...")
}

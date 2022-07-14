library(webshot2)

# Lista portais
portais <- data.frame(
  url = c("https://www.folha.uol.com.br","https://g1.globo.com","https://www.poder360.com.br"),
  nome = paste0(c("folha","g1","poder360"), ".png")
)
portais$file <- paste0(".github/workflows/", portais$nome)

# Cria variaveis para guardar as condicoes do loop
cond_files <- TRUE
cond_tries <- TRUE
tries <- 0

# Tenta por varias vezes fazer o screeshot das paginas
while((cond_files & cond_tries)) {
  
  # Atualiza indicador de tentativas
  tries <- tries + 1
  
  # Efetua screenshot
  webshot2::webshot(url = portais$url, vwidth = 2000, vheight = 2000,
                    file = portais$file, delay = 5, cliprect = "viewport")
  
  # Confirma que todas imagens foram criadas
  nomes <- list.files(path = ".github/workflows")
  files <- sum(portais$name %in% nomes)
  cond_files <- files == dim(portais)[1]
  
  # Atualiza condicao da tentativa
  cond_tries <- tries == 10
  
  # Realiza uma pausa antes da proxima tentativa
  Sys.sleep(5)
  
}

library(webshot2)


# Efetua screenshot
webshot2::webshot(url = "https://g1.globo.com/", vwidth = 1500, vheight = 2000,
                  file = "./screenshots/g1.png", delay = 25, cliprect = "viewport")
  

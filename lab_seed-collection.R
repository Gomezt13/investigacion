# Seed collection

source("https://inkaverse.com/setup.r")
url <- "https://docs.google.com/spreadsheets/d/1Syjv4hAf4UY6_l2doBPqQW-YdcnnftVaCSywwwq-lNY/edit?gid=1820432866#gid=1820432866"
gs <- as_sheets_id(url)
  
fb <- gs %>% 
  range_read("fb")

font <- c("Courgette", "Tillana")

huito_fonts(font)

label <- fb %>% 
  mutate(name = paste0('"', "Maíz", '"')) %>% 
  label_layout(size = c(5, 4)
               , border_color = "darkgreen"
               ) %>% 
  include_image(
    value = "https://www.untrm.edu.pe/assets/images/untrmazul.png"
    , size = c(2.2, 1.9)
    , position = c(1.2, 3.6)
    ) %>% 
  include_image(
    value = "https://huito.inkaverse.com/img/scale.pdf"
    , size = c(5, 1)
    , position = c(2.5, 0.5)
  ) %>% 
  include_image(
    value = "https://aminochem.com/wp-content/uploads/2022/08/aminochem-cultivos-maiz-maizhero.webp"
    , size = c(1.5, 3)
    , position = c(0.7, 1.5)
    ) %>% 
  include_barcode(
     value = "qrcode"
     , size = c(2, 2)
     , position = c(4, 3)
     ) %>% 
  include_text(value = "Familia:"
               , position = c(0.5, 3.1)
               , size = 6
               , color = "black"
               , opts = list(hjust = 0)
              ) %>% 
    include_text(value = "Poaceae"
                 , position = c(1, 2.8)
                 , size = 6
                 , color = "black"
                 , opts = list(hjust = 0)
                ) %>% 
  include_text(value = "Genero:"
               , position = c(0.5, 2.5)
               , size = 6
               , color = "black"
               , opts = list(hjust = 0)
              ) %>% 
  include_text(value = "Zea"
               , position = c(1, 2.2)
               , size = 6
               , color = "black"
               , opts = list(hjust = 0)
                ) %>% 
  include_text(value = "plots"
               , position = c(3.5, 1.5)
               , size = 6
               , color = "black"
               , opts = list(hjust = 0)
  ) %>% 
  include_text(value = "factor1"
               , position = c(3.8, 1.5)
               , size = 6
               , color = "black"
               , opts = list(hjust = 0)
  ) %>% 
  include_text(value = "Zea mays"
               , position = c(2, 1.8)
               , size = 9
               , color = "black"
               , font[1] 
              ) %>% 
  include_text(value = "name"
               , position = c(2, 1.3)
               , size = 9
               , color = "black"
               , font[2]
              )
label %>% label_print()

label %>% label_print(mode = "c")




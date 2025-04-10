# Seed collection

source("https://inkaverse.com/setup.r")
url <- "https://docs.google.com/spreadsheets/d/1KMfVJOYhafHZDOGLqcGZ36N3U5Ml_uP-qParPy5GAt8/edit?gid=0#gid=0"
gs <- as_sheets_id(url)

fb <- gs %>% 
  range_read("seeds")

font <- c("Courgette", "Tillana")

huito_fonts(font)

label <- fb %>% 
  rename("scientific.name" = "Especie", "name" = "Nombre común") %>% 
  mutate(barcode = paste(number, gsub("(\\w+\\s+\\w+).*", "\\1", scientific.name), sep = "_")) %>% 
  mutate(across(barcode, ~gsub(" ", "-", .))) %>% 
  mutate(name = paste0('"', name, '"')) %>% 
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
    , position = c(4.2, 3.5)
    ) %>% 
  include_barcode(
     value = "barcode"
     , size = c(2, 2)
     , position = c(4, 2)
     ) %>% 
  include_text(value = "Familia:"
               , position = c(0.5, 3.1)
               , size = 6
               , color = "black"
                 , opts = list(hjust = 0)
               ) %>% 
  include_text(value = "Familia"
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
  include_text(value = "Genero"
               , position = c(1, 2.2)
               , size = 6
               , color = "black"
                 , opts = list(hjust = 0)
               ) %>% 
  include_text(value = "scientific.name"
               , position = c(1.5, 1.8)
               , size = 9
               , color = "black"
                 , font[1] 
               ) %>% 
  include_text(value = "name"
               , position = c(1.5, 1.3)
               , size = 9
               , color = "black"
                 , font[2]
               )

label %>% label_print()

label %>% label_print(mode = "c")




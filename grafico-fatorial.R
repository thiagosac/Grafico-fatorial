################################################################################
#                                                                              #
# Desenvolvedor: THIAGO ARA?JO DOS SANTOS                                      #
#                                                                              #
# Contato: thiagosantosac96@outlook.com                                        #
#                                                                              #
################################################################################

#------------------------------------------------------------------------------#
# Reiniciando sessão R                                                                       
# -----------------------------------------------------------------------------#
  rm(list=ls())
  graphics.off()
  options(warn=0)
  .rs.restartR()

#------------------------------------------------------------------------------#
# Checando pacotes necessários                                
# -----------------------------------------------------------------------------#
  .packages = c("xlsx", "metan")
  .inst <- .packages %in% installed.packages()
  lapply(.packages, require, character.only=TRUE)

#------------------------------------------------------------------------------#
# Informando o diretório de trabalho                                                                       
# -----------------------------------------------------------------------------#
  setwd("~/GitHub/Grafico-fatorial")
  getwd()
  dir()

#------------------------------------------------------------------------------#
# Carregando dados                                                            
# -----------------------------------------------------------------------------#
  Data <- read.xlsx(file="dados.xlsx", 
                  sheetName="planilha", 
                  h=T, 
                  row.names=)

#------------------------------------------------------------------------------#
# Plotanto e salvando gráfico                                                            
# -----------------------------------------------------------------------------#
  plot1 = plot_factbars(Data,
              sistema,
              estirpe,
              resp = clorofila.total,
              xlab = "Cultivation Systems",
              ylab = "Total Chlorophyll (Falker Index)",
              y.lim = c(0, 70),
              lab.bar = c("Aa","Aa","Aa","Aa","Aa",
                          "Aa","Aa","Aa","Aa","Aa")) +
              labs(caption = "Means with the same letter are not different, capital letters for means among lines; small letters for means between columns for each studied element.")




  plot2 = plot1 + scale_fill_brewer("Greens")

  ggsave ("Gráfico.tiff", width = 21, height = 10, units = "cm")
  plot2
  dev.off()


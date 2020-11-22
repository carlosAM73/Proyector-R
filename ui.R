
library(shiny)

shinyUI(
    #PRIMER ENTORNO
    navbarPage("Seguro de Riesgos del Trabajo",theme = shinytheme("flatly"),
               
               
               #### CARATULA
               
               navbarMenu(  "Presentacion", hr() ,  
                            
                            tabPanel("Caratula",  div(img(src="caratula.jpg", width = "400px", height = "300px"),
                                                      style="text-align: center;"), 
                                     
                                     # div(img(scr="pensiones.jpg", width="500px" , height="500px"), 
                                     #style="text-align: center;"),
                                     
                                     # wellPanel(h2("PROYECTO FINAL"),style="text-align: center;"),
                                     wellPanel(h3("Analisis de las pensiones para personas accidentadas"),
                                               style="text-align: center;" )
                                     ,
                                     
                                     tags$div(class="alert alert-dismissible alert-success", style="text-align: center;",
                                              type="button", class="alert alert-dismissible alert-primary", "Integrantes"),
                                     hr(),
                                     
                                     tags$h3(tags$li("Janeth Castillo J. ")) ,
                                     tags$br("Página web 
                 de Janet Castillo J" ),
                                     tags$a(href="https://www.linkedin.com/in/janeth-cristina-castillo-4b81119b/", "Click aqui!"),
                                     
                                     tags$h3(tags$li("Carlos Alcantara M.")) , 
                                     
                                     tags$br("Página web 
                 de Carlos Alcantara M"),
                                     tags$a(href="https://www.facebook.com/carlos.alcantaram ", "Click aqui!"),
                                     hr(),
                                     hr(),
                                     
                                     tags$br("Página web 
                 Instituto Ecuatoriano de Seguridad Social."),
                                     tags$a(href="http://www.iess.gob.ec/", "Click aqui!"),
                                     
                            ),
               
               
               ######
               
               
               
               
               tabPanel("Prestaciones del Seguro",
                sidebarPanel(img(src="imagen_02.jpg", height=200, width=320)),
                
                column(4,
                wellPanel(style = "background-color:#adbfff;",
                         tags$div(align="justify",tags$p(span (h3("El Seguro General de Riesgos del Trabajo cubre toda lesión corporal y todo estado
                                                            mórbido originado con ocasión, a causa, o por consecuencia del trabajo que realiza el afiliado, y regula la
                                                            entrega de las prestaciones a que haya lugar para la reparación de los daños derivados de accidentes de
                                                            trabajo y/o enfermedades profesionales u ocupacionales que afecten la capacidad laboral del asegurado." , 
                                                                  style ="color:blue"))))
                )),
                
                column(4,
                       wellPanel(style = "background-color:#bdbfff;",
                          tags$div(align="justify",tags$p(span(h3("Son sujetos de protección: el trabajador en relación de dependencia,
                                                                así como el trabajador afiliado sin relación de dependencia o autónomo, independiente o por cuenta
                                                                propia, el menor trabajador, y los demás asegurados obligados al régimen del Seguro General Obligatorio
                                                                en virtud de leyes y decretos especiales y que cotice para este Seguro.", style="color:blue"))))
                )),
                column(12,
                       wellPanel(style = "background-color:#cdbfff;",
                                 tags$div(align="justify",tags$p(span(h4("De conformidad con la Ley de Seguridad Social, el Seguro General de Riesgos
                                                                    del Trabajo otorga a sus afiliados el derecho de las siguientes prestaciones básicas:",
                                                                         style ="color:red"))))
                       )),

                                wellPanel(
                  fluidRow(
                    column(4, selectInput("presta", label = h4("Prestaciones Básicas"), 
                                          choices = list("Servicios de Prevención" = 1, "Servicios Médicos" = 2, 
                                                         "Subsidios Económicos" = 3,"Indemnización Económica" = 4,
                                                         "Pensión Económica" = 4,"Pensión de Montepío" = 5),
                                          selected = 1),
                           uiOutput("img_presta"))) ,
                    mainPanel(h3(span(textOutput("value"), style="color:blue" )) 
                    
                        )),
                ) ),
               
               #SEGUNDO ENTORNO -> Estructura de la información
               tabPanel("Información",
                        
                        
                        fluidRow(column(12 ,   
                        radioButtons(inputId = "estructura", 
                                     label = "Estructura de la información:",
                                     choices = c("Datos", "Variables", "Periodicidad"),
                                     inline = T),     conditionalPanel(condition = "input.estructura == 'Datos'",
                                         wellPanel(
                                           (img(src="imagen_06.jpg", height=300, width=420))),
                                         tags$div(align="justify",tags$p(h4("Se cuenta con datos nacionales de la población que recibe una pensión por un accidente de trabajo;
                                                                            la información identifica el número de beneficiarios según el tipo de incapacidad calificada 
                                                                            (permanente o temporal), así como, de los beneficiarios de montepío, de igual manera se cuenta con 
                                                                            la ubicación geográfica e información económica del pensionista. ")
                        )),
                        ),  
                        conditionalPanel(condition = "input.estructura == 'Variables'",
                                         wellPanel(
                                           (img(src="imagen_07.jpg", height=300, width=420))),
                                         tags$div(align="justify",tags$p(h4("Variables cuantitativas (valor de la pensión, ingresos, descuentos ) 
                                                                            y cualitativas (sexo,provincia, banco al que se deposita su pensión, etc.)")
                         )),
                        ),  
                        conditionalPanel(condition = "input.estructura == 'Periodicidad'",
                                         wellPanel(
                                           (img(src="imagen_08.jpg", height=300, width=420))),
                                         tags$div(align="justify",tags$p(h4("Información de caracter mensual actualizado a octubre 2020")
                        )),
                        ),             
                        )),
                        ), 
               
                
               
               
               
           ###BASE DE DATOS    
               tabPanel( h3("Base de datos Pensiones para el seguro de riesgo en el trabajo"), title = ("Base de pensiones "), 
                          fluidRow( column ( DT:: dataTableOutput("RawData"), width = 12 ))
                          ) ,           
           
           
              ### 
               #TERCER ENTORNO
               tabPanel("Pensionistas",
                        p('El Seguro General de Riesgos del Trabajo, mantiene en nómina de pago a pensionistas por incapacidad de tipo:
                          temporal, total, absoluta o parcial; así como de los beneficiarios de montepío,
                          dicha información se detalla a continuación:'),
                        column(6,
                              highchartOutput("graf_01"),
                        ),
                        column(6, 
                              highchartOutput("graf_02"),
                        ),
                        column(12,
                               highchartOutput("graf_03"),
                        ),
                        column(12,
                               highchartOutput("graf_04"),
                        )
               ),
             
               #CUARTO ENTORNO
               tabPanel("Análisis económico",
                        column(6,
                               highchartOutput("graf_05"),
                        ),     
                        column(6,
                               highchartOutput("graf_06"),
                        ), 
                        column(12,
                               highchartOutput("graf_07"),
                        ), 
                        column(12,
                               highchartOutput("graf_08"),
                        ), 
                        
                        
               )
              ))








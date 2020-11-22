library(shiny)


shinyServer(function(input, output){
    
    #### La base
    output$RawData<-DT :: renderDataTable(
        DT:: datatable( 
            { bd}
            
            ,
            
            ### OPCIONES
            options = list(lengthMenu =list(c(7,15,-1) , c("5","15","All") ), 
                           pageLength=15
                           ), 
            ## fILTROS
            
            filter = "top",
            selection = "multiple",
            style = "bootstrap"
            ##
            
            ####
            
            )
        
    )
    ###
    
    
    ####  Seleccionar la variable
    
    output$value <- renderPrint({ input$select })
    
    ####
    output$img_presta <- renderUI({
        if(input$presta == 1){            
            img(src="imagen_10.jpg", height=200, width=320)
        }                                        
        else if(input$presta == 2){
            img(src="imagen_11.jpg", height=200, width=320)
        }
        else if(input$presta == 3){
            img(src="imagen_12.jpg", height=200, width=320)
        }
        else if(input$presta == 4){
            img(src="imagen_13.jpg", height=200, width=320)
        }
        else if(input$presta == 5){
            img(src="imagen_15.jpg", height=200, width=320)
        }
    })
    
    output$value <- renderText({
        if(input$presta == 1){            
            print("Actividad preventiva a fin de garantizar la adecuada protección de la seguridad y salud de los trabajadores")
        }                                        
        else if(input$presta == 2){
            print("Servicio otorgado a través de las Unidades Médicas de la Red del Seguro de Salud Individual y Familiar")
        } 
        else if(input$presta == 3){
            print("Prestación económica temporal cubiertal por el IESS hasta un año en función de su salario laboral")
        } 
        else if(input$presta == 4){
            print("Pensión económica cubierta por el IESS en función al grado de incapacidad")
        } 
        else if(input$presta == 5){
            print("Pensión económica para el grupo familiar de la persona fallecida en el siniestro")
        } 
    })

    ################################################################
    # Gráficos Generales
    ###############################################################################
    output$graf_01 <- renderHighchart({
        hchart(bd$prov_bene, "scatter", colorByPoint = TRUE, name="Provincia")%>%
            hc_title(text = "Pensionistas por provincia") %>%
            hc_add_theme(hc_theme_economist())
    })
    output$graf_02 <- renderHighchart({
        hchart(bd$sexo, "pie", colorByPoint = TRUE,name="Sexo")%>%
            hc_title(text = "Pensionistas por sexo") %>%
            hc_add_theme(hc_theme_economist())
    })     
    output$graf_03<- renderHighchart({
        hchart(bd$tipo_prestacion, "column", colorByPoint = TRUE,name="Prestación")%>%
            hc_title(text = "Pensionistas por tipo de prestacion") %>%
            hc_add_theme(hc_theme_economist())
    })
    output$graf_04<- renderHighchart({
        hchart(bd$nombre_institucion_financiera, "bar", colorByPoint = TRUE,name="Institución Financiera")%>%
            hc_title(text = "Tipo de Banco del Pensionsita ") %>%
            hc_add_theme(hc_theme_economist())
    })
    
#### Análisis económico
    output$graf_05<- renderHighchart({
        hcboxplot(bd$tot_ingr, var=bd$tipo_prestacion, name="Total Ingreso") %>%
            hc_title(text = "Ingresos del pensionista") %>%
            hc_add_theme(hc_theme_economist())
    })    
    output$graf_06<- renderHighchart({
        hcboxplot(bd$tot_desc, var=bd$tipo_prestacion, name="Total Descuento") %>%
            hc_title(text = "Descuentos al pensionista") %>%
            hc_add_theme(hc_theme_economist())
    })    
    output$graf_07<- renderHighchart({
        hchart(density(bd$tot_pension), type="area", name="Total pensión") %>%
        hc_title(text = "Total Pensión")%>%
            hc_add_theme(hc_theme_economist())
    })
    output$graf_08<- renderHighchart({
        hcmap("countries/ec/ec-all", data = data_ecuador, value = "X",
              joinBy = c("hc-a2", "PROVINCIA"),
              dataLabels = list(enabled = TRUE, format = '{point.name}')) 
    })
})

library(shiny); library(miniUI)
multiply_Numbers = function(num1, num2){
  ui = miniPage(
    gadgetTitleBar("Multiply Two Numbers"),
    miniContentPanel(
      selectInput("num1", "First Number", choices = num1),
      selectInput("num2", "Second Number", choices = num2)
    )
  )
  server = function(input, output, session){
    observeEvent(
      input$done,
      {
        num1 = as.numeric(input$num1)
        num2 = as.numeric(input$num2)
        stopApp(num1*num2)
      }
    )
  }
  runGadget(ui, server)
}
multiply_Numbers(1:10,1:10)

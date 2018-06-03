# create your custom box
my_tiny_socialbox <- function(username = "Paul", userposition = "looking for job",
                              sales = NULL, followers = NULL, products = NULL) {
  
  # check some inputs
  stopifnot(is.numeric(sales))
  stopifnot(is.numeric(followers))
  stopifnot(is.numeric(products))
  
  # the box tags
  withTags(
    # col
    div(
      class = "col-md-4",
      # Widget: user widget style 1
      div(
        class = "box box-widget widget-user",
        # Add the bg color to the header using any of the bg-* classes
        ## Box Header ##
        div(
          class = "widget-user-header bg-aqua-active",
          h3(class = "widget-user-username", username),
          h5(class = "widget-user-desc", userposition)
        ),
        ## Box Image ##
        div(
          class = "widget-user-image",
          img(class = "img-circle", src = "images/elliot.jpg", alt = "User Avatar")
        ),
        ## Box Footer ##
        div(
          class = "box-footer",
          div(
            class = "row",
            # first column
            div(
              class = "col-sm-4 border-right",
              div(
                class = "description-block",
                h5(class = "description-header", sales),
                span(class = "description-text", "SALES")
              )
            ),
            # second column
            div(
              class = "col-sm-4 border-right",
              div(
                class = "description-block",
                h5(class = "description-header", followers),
                span(class = "description-text", "FOLLOWERS")
              )
            ),
            # third column
            div(
              class = "col-sm-4 border-right",
              div(
                class = "description-block",
                h5(class = "description-header", products),
                span(class = "description-text", "PRODUCTS")
              )
            )
          )
        )
      )
    )
  )
}

# launch the dashboard with our simple custom function
library(shiny)
library(shinydashboard)
users <- c("Paul1","Paul2","Paul3")
userposition <- c("Teacher","Manager","Student")
shinyApp(
  ui = dashboardPage(
    dashboardHeader(),
    dashboardSidebar(),
    dashboardBody(
      lapply(1:3, function(i) {
       my_tiny_socialbox(username = users[i], userposition = userposition[i],
                        sales = 150, followers = 1200, products = 3)
      })
    ),
    title = "Dashboard example"
  ),
  server = function(input, output) { }
)

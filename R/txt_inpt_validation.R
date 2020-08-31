#' Function validating entered text as number
#' @param text_value the entered text
#' @param condition condition entered - should be a logical condition using usual logical operators
#' @param incorrect_format string, what string should be shown below the input if the FORMAT is incorrect
#' @param incorrect_value string, what string should be shown below the input if the condition is not true
#' @export
validate_text_input <- function(text_value,
                                condition = NULL,
                                incorrect_format,
                                incorrect_value) {
  if (is.null(text_value) || text_value == "") {
    return(text_value)
  }
  x <- suppressWarnings(as.numeric(text_value))
  if(!is.na(x)) {
    if (!is.null(condition) && eval(parse(text = paste0('!(', condition, ')')))) {
      return(incorrect_value)
    } else {
      return("")
    }
  } else {
    return(incorrect_format)
  }
}

#' Function showing validation messages for text input used as numeric input
#' @param text_value the entered text
#' @param condition condition entered - should be a logical condition using usual logical operators
#' @param incorrect_format string, what string should be shown below the input if the FORMAT is incorrect
#' @param incorrect_value string, what string should be shown below the input if the condition is not true
#' @export
validate_input <- function(input_id,
                           text_value,
                           condition = NULL,
                           incorrect_format = "incorrect format",
                           incorrect_value = "incorrect value") {
  shinyjs::runjs(sprintf('updateAlert("%s", "%s")',
                         input_id,
                         validate_text_input(text_value,
                                             condition = condition,
                                             incorrect_format = incorrect_format,
                                             incorrect_value = incorrect_value)))
}

#' Add html element with the alert to the input
#' @param input_id id of the input
#' @export
add_validation_to_input <- function(input_id) {
  shinyjs::runjs(sprintf('waitForEl("%s", add_validation_field);', input_id))
}

#' Function validating entered text as number
#' @param text_value the entered text
#' @param condition condition entered - should be a logical condition using usual logical operators
#' @param incorrect_format string, what string should be shown below the input if the FORMAT is incorrect
#' @param incorrect_value string, what string should be shown below the input if the condition is not true
#' @export
validate_text_input <- function(text_value,
                                condition = NULL,
                                incorrect_format,
                                incorrect_value) {
  if (is.null(text_value) || text_value == "") {
    return(text_value)
  }
  x <- suppressWarnings(as.numeric(text_value))
  if(!is.na(x)) {
    if (!is.null(condition) && eval(parse(text = paste0('!(', condition, ')')))) {
      return(incorrect_value)
    } else {
      return("")
    }
  } else {
    return(incorrect_format)
  }
}

#' Function showing validation messages for text input used as numeric input
#' @param text_value the entered text
#' @param condition condition entered - should be a logical condition using usual logical operators
#' @param incorrect_format string, what string should be shown below the input if the FORMAT is incorrect
#' @param incorrect_value string, what string should be shown below the input if the condition is not true
#' @export
validate_input <- function(input_id,
                           text_value,
                           condition = NULL,
                           incorrect_format = "incorrect format",
                           incorrect_value = "incorrect value") {
  shinyjs::runjs(sprintf('updateAlert("%s", "%s")',
                         input_id,
                         validate_text_input(text_value,
                                             condition = condition,
                                             incorrect_format = incorrect_format,
                                             incorrect_value = incorrect_value)))
}

#' Function adding validation field beneath text input
#' @param input_id input id
#' @export
add_validation_to_input <- function(input_id) {
  shinyjs::runjs(sprintf('waitForEl("%s", add_validation_field);', input_id))
}

#' Function initializing the package in UI
#' Use it in UI of a shiny app like useShinyJS
#' @export
useValidateTextInput <- function() {
  tags$script(src=system.file("srcjs/validatejs.js", package = "validatetxtinpt"), type="text/javascript")
}

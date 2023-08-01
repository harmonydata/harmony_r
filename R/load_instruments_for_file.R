#' Load Instruments from File
#'
#' This function loads instruments from a file specified by the \code{path}
#' parameter and sends the file content to an API for further processing.
#' It also accepts a url leading to a file.
#'
#' If the file is a text file (with extension .txt), it returns the text file's
#' content as a string. Otherwise, it converts the file content to a base64-encoded
#' string and sends it to the API. The supported file types for conversion are PDF,
#' and XLSX (Excel) files.
#'
#' The function generates a random UUID to uniquely identify the file and sends
#' the file name, file type, and content to the API in JSON format and returns
#' a list of instruments.
#'
#' @param path The path to the file to load instruments from.
#' @return A JSON response from the API containing the processed contents.
#'
#' @importFrom uuid UUIDgenerate
#' @importFrom base64enc base64encode
#' @importFrom jsonlite toJSON
#' @importFrom httr POST add_headers content
#' @importFrom tools file_ext
#'
#' @examples
#' # Load instruments from a PDF file
#' pdf_file <- "https://www.apa.org/depression-guideline/patient-health-questionnaire.pdf"
#' response <- load_instruments_from_file(pdf_file)
#'
#' @export
load_instruments_from_file = function(path){
  file_string = ""

  #if the file is text, it just returns the text file as a string
  if(file_ext(path) == "txt")
  {
    # Read the text file as lines
    file_lines <- readLines(path)

    # Concatenate the lines into a single string
    file_string <- paste(file_lines, collapse = "")

  }
  else {
    file_string = tobase64(path)
    if(file_ext(path) == "pdf")
    {
      file_string = paste("data:application/", file_ext(path),";base64,", file_string, sep = "")
    }
    else
    {
      file_string = paste("data:application/", "vnd.openxmlformats-officedocument.spreadsheetml.sheet",";base64,", file_string, sep = "")

    }

  }
  #create info you need to send to api
  #headers
  headers = c(
    `accept` = "application/json",
    `Content-Type` = "application/json"
  )

  # Generate a random UUID
  random_uuid <- paste(UUIDgenerate(output = "raw"), collapse = "")
  #app might not necessarily be a base64

  data = list(list(file_id =  random_uuid,
              file_name = basename(path),
              file_type = file_ext(path),
              content = file_string))
  #convert to json
  data_json = jsonlite::toJSON(data,pretty=FALSE,auto_unbox=TRUE)
  #add brackets
  #send contents
  #change url to be an enviroment variable
  res <- httr::POST(url = "https://api.harmonydata.org/text/parse", encode = "json", httr::add_headers(.headers=headers), body = data_json)
  #contents
  conten = content(res)
  #
  return(conten)

}

tobase64 = function(path){

  # Check if the string is a valid URL
  is_link <- is_url_file(path)

  # Check if the file is a local file (not a link)
  is_local_file <- !is_link

  if (is_link) {
    # Define the link to the PDF file
    link <- path

    # Download the PDF file
    temp_file <- tempfile()  # Create a temporary file to store the downloaded PDF
    utils::download.file(link, temp_file, mode = "wb")  # 'wb' mode for binary download

    pdf_binary = temp_file

    # Convert the binary data to base64 encoded string
    pdf_base64 <- base64encode(pdf_binary)

    # Remove the temporary file
    unlink(temp_file)


  } else {

    # Read the downloaded PDF as binary
    pdf_binary <- readBin(path, "raw", file.info(path)$size)

    # Convert the binary data to base64 encoded string
    pdf_base64 <- base64encode(pdf_binary)
  }
  return(pdf_base64)

}

is_url_file <- function(url) {
  # Perform an HTTP HEAD request to get the headers
  response <- httr::HEAD(url)

  # Get the content type from the headers
  content_type <- httr::headers(response)$`content-type`

  # Check if the content type indicates a file
  is_file <- grepl("^application\\/|^text\\/", content_type)

  return(is_file)
}




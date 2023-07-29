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
#' @importFrom base paste basename
#' @importFrom base readLines
#' @importFrom base file_ext
#' @importFrom uuid UUIDgenerate
#' @importFrom base64enc base64encode
#' @importFrom jsonlite toJSON
#' @importFrom httr POST add_headers content
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
      file_string = paste("data:application/", file_ext(path),";base64,", base64_file, sep = "")
    }
    else
    {
      file_string = paste("data:application/", "vnd.openxmlformats-officedocument.spreadsheetml.sheet",";base64,", base64_file, sep = "")

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
  data_json = toJSON(data,pretty=FALSE,auto_unbox=TRUE)
  #add brackets
  #send contents
  #change url to be an enviroment variable
  res <- httr::POST(url = "https://api.harmonydata.org/text/parse", encode = "json", httr::add_headers(.headers=headers), body = data_json)
  #contents
  conten = content(res)
  #
  return(conten)

}
#' Convert File to Base64
#'
#' This function takes a file path or URL as input and converts the file content to a
#' base64-encoded string. If the input is a valid URL, it downloads the file first and
#' then converts it to base64. If the input is a local file path, it reads the file as
#' binary and converts the binary data to base64.
#'
#' @param path A file path or URL to convert to base64.
#' @return A base64-encoded string representing the content of the file.
#'
#' @importFrom base is_url_file
#' @importFrom base unlink
#' @importFrom base readBin
#' @importFrom base file.info
#' @importFrom base tempfile
#' @importFrom utils download.file
#' @importFrom base64enc base64encode
#'
#' @examples
#' # Convert a remote PDF file to base64
#' pdf_url <- "https://www.apa.org/depression-guideline/patient-health-questionnaire.pdf"
#' pdf_base64 <- tobase64(pdf_url)
#'
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
    download.file(link, temp_file, mode = "wb")  # 'wb' mode for binary download

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
#' Check if a URL points to a file.
#'
#' This function checks if a given URL likely points to a file based on the content
#' type obtained from an HTTP HEAD request. It performs an HTTP HEAD request to the
#' specified URL and checks if the content type indicates a file, such as PDF, CSV,
#' TXT, etc.
#'
#' @param url The URL to check.
#' @return \code{TRUE} if the URL likely points to a file, and \code{FALSE} otherwise.
#'
#' @importFrom httr HEAD
#' @importFrom httr headers
#' @importFrom base grepl
#'
#' @examples
#' is_url_file("https://www.apa.org/depression-guideline/patient-health-questionnaire.pdf")
#'
is_url_file <- function(url) {
  # Perform an HTTP HEAD request to get the headers
  response <- httr::HEAD(url)

  # Get the content type from the headers
  content_type <- httr::headers(response)$`content-type`

  # Check if the content type indicates a file
  is_file <- grepl("^application\\/|^text\\/", content_type)

  return(is_file)
}




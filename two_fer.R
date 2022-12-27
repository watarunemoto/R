two_fer <- function(name) {
  if (missing(name))
    print("One for you, one for me.")
  else
    paste("One for ", name, " one for me.")
}
name <- args[1]
two_fer(name)
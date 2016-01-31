# Question 1

library(httr)
library(httpuv)

oauth_endpoints("github")

myapp <- oauth_app("github",
                   key = "885c6336c604511a6e66",
                   secret = "2bd0dc207d9bb67b3aebfc706e46e81af5515c63")
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)


gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
content(req)


for (i in 1:length(content(req))) {
        if (content(req)[[i]]$full_name == "jtleek/datasharing"){
                print(content(req)[[i]]$created_at)
        }
}

#-------------------------------------------------------------------------------------------

# Question 5
cr <- file("C:/Users/Lenovo/Desktop/getdata-wksst8110.for")
data_1 <-readLines(cr)
head(data_1)
data_1 <- data_1[5:length(data_1)]
dt_1 <- substr(data_1[1:length(data)], start = 29, stop = 32)
sum(as.numeric(dt_1), na.rm = TRUE)


#--------README--------  

##Usage guide  

    1. clone this repository  
    2. download docker for your environment (docker-toolbox for windows home edition)  
    3. run `docker-compose up -d` in for example docker quickstart terminal inside the directory of the clone  
    4. open localhost in web browser if you are using docker or http://192.168.99.100/ if you are using docker-toolbox  
    5. Follow instructions in the browser  

##Project explanation  

###Docker  
  
This project uses docker containers for simple use in any environment and therefore it is expected that  
users download docker for their specific environment.  
  
###Nginx  
  
...  
  
###PHP/Saxon  
  
This project uses php with a saxon addon inside a docker container to transform xml-files into the final resulting xhtml file.  
The Saxon addon is used to in the first step transform xmlfiles from [xmltv](xmltv.xmltv.se "xmltv:s homepage") to another  
filtered collection of several xmlfiles inside one xmlfile which is holding only the things that is important for a tvguide.  
  
The last step in the transformation process is done with xquery that transform the collection into the resulting xhtml page  
which is displayed after this transformation.  
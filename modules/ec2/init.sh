#!/bin/bash
  echo '<html><body><h1 style="font-size:50px;color:blue;">Sarmistha <br> <font style="color:red;"> www.myweb.com <br> <font style="color:green;"> Learn Devops </h1> </body></html>' > index.html
nohup busybox httpd -f -p 8080 &
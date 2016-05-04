# Convert your notebook to an interactive webpage
#
#  Attached a notebook (really-interactive-posts.ipynb) and the generated
# output (really-interactive-posts.html). The thebe.tpl template file is
# at the very end of the gist.

$ jupyter nbconvert --template thebe/basic.tpl --to html <notebook.ipynb>


# You can open the generated webpage locally file://... howerver some
# resources will not load properly. Best to open it from a webserver:

$ python3 -m http.server

# or if you'd rather have a local https server (credit to: https://gist.github.com/dergachev/7028596)
# generate certificate with the following command:

$ openssl req -new -x509 -keyout server.pem -out server.pem -days 365 -nodes
$ echo "import BaseHTTPServer, SimpleHTTPServer
import ssl

httpd = BaseHTTPServer.HTTPServer(('localhost', 4443), SimpleHTTPServer.SimpleHTTPRequestHandler)
httpd.socket = ssl.wrap_socket (httpd.socket, certfile='./server.pem', server_side=True)
httpd.serve_forever()" > simple-https-server.py

# run with:

$ python simple-https-server.py

# In your browser, visit:
#    https://localhost:4443

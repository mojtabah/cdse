# CURL 

### HTTP Get

<pre><code>
# Single URL
curl http://www.google.com | more
# Multiple urls
curl -O http://www.gnu.org/software/gettext/manual/html_node/index.html -O http://www.gnu.org/software/gettext/manual/gettext.html
</code></pre>

### FTP Get
<pre><code>
curl ftp://speedtest.tele2.net/512KB.zip -o data.zip
curl -O ftp://speedtest.tele2.net/512KB.zip
</code></pre>

# Scrape

## Toy example
```bash

htmldoc=$(cat << EOF
<div id=a>
    <a href="x.pdf">x</a>
</div>
<div id=b>
    <a href="png.png">y</a>
    <a href="pdf.pdf">y</a>
</div>
EOF
)
    # Select liks that end with pdf and are within div with id=b (Use CSS3 selector)
    echo $htmldoc | scrape -e "$b a[href$=pdf]"

    # Select all anchors (use Xpath)
    echo $htmldoc | scrape -e "//a"

    <a href="pdf.pdf">y</a>
```

## Exercise
Extract faculty names from the CDSE website (http://www.buffalo.edu/cdse/faculty/faculty_directory.html)

<pre><code>

### Using CSS3 selector
curl http://www.buffalo.edu/cdse/faculty/faculty_directory.html  | scrape -e ".staff_name_bolded > a"
### Using XPath Query
curl http://www.buffalo.edu/cdse/faculty/faculty_directory.html  | scrape -e "data(//span/a[@target='_blank'])"
</code></pre>


## Helpful links
* https://www.w3schools.com/cssref/css_selectors.asp
* https://msdn.microsoft.com/en-us/library/ms256086(v=vs.110).aspx 

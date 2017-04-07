
# Filters
Filters can be used to extract individual elements within the JSON record. 

## Identity
jq '.' passes the input unchanged

<pre><code>
$ echo '"Hello world"' | jq '.'
"Hello world"
</code></pre>
<hr>

## Field selection
'.foo', '.foo.bar', '.foo|.bar', '.["foo"]
<pre><code>
echo '{"foo": 42, "bar": 10}' | jq '.foo' 
42

echo '{"foo": {"bar": 10, "baz": 20}}' | jq '.foo.bar'  
10
</code></pre>

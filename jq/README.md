
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

## Arrays
<pre><code>
echo '["foo", "bar"]' | jq '.[0]' 
"foo"
echo '["foo", "bar", "baz"]' | jq '.[1:3]' 
["bar", "baz"]
</code></pre>
<hr>

## Pipe
<pre><code>
echo '[{"f": 10}, {"f": 20}, {"f": 30}]' | jq '.[] | .f
10  20  30
</code></pre>
<hr>

## Object construction
<pre><code>
# Field selection
echo {"foo": "F", "bar": "B", "baz": "Z"} | jq '{"foo": .foo}'
{"foo": "F"}

# Array expansion
echo '{"foo": "A", "bar": ["X", "Y"]}' | jq '{"foo": .foo, "bar": .bar[]}'
{"foo": "F", "bar": "X"}
{"foo": "F", "bar": "Y"}

# Expression evaluation, key and value can be substituted
echo '{"foo": "A", "bar": ["X", "Y"]}' | jq '{(.foo): .bar[]}'
{"A": "X"}
{"A": "Y"}
</code></pre>
<hr>

## Expression evaluation
<pre><code>
# key and value can be substituted
echo '{"foo": "A", "bar": ["X", "Y"]}' | jq '{(.foo): .bar[]}'
{"A": "X"}
{"A": "Y"}
</code></pre>
<hr>

## Operators
<pre><code>
# Adding fields 
echo '{"foo": 10}' | jq '.foo + 1'
11
# Adding arrays
echo '{"foo": [1,2,3], "bar": [11,12,13]}' | jq '.foo + .bar'
[1,2,3,11,12,13]
</code></pre>

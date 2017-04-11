# Commandline datascience workflow

## obtaining data
<pre><code>
curl -s https://raw.githubusercontent.com/sharatsc/cdse/master/boston-housing/boston.csv 
</code></pre>

# Scrubbing data
Replace NAs with 0

<pre><code>
cat boston.csv | sed -e 's/NA/0/g;s/na/0/g'
</code></pre>

# Exploring data
cat boston.csv | csvlook | less
cat boston.csv | csvstat

# Modeling
<pre><code>
cat boston.csv | csv2vw --label medv | vw -c -l 0.1 --passes 10 --bfgs -f vw.model
</code></pre>

# Interpreting the model
<pre><code>
cat boston.csv | csv2vw --label medv | vw -i vw.model -t --invert_hash hash & less hash
</code></pre>

# Combined workflow (VW)
<pre><code>
# Data -> Model
curl -s https://raw.githubusercontent.com/sharatsc/cdse/master/boston-housing/boston.csv  | \
sed -e 's/NA/0/g;s/na/0/g' | \
csv2vw --label medv | \
vw -c -l 0.1 --passes 10 --bfgs -f vw.model
</code></pre>

# Combined workflow R
<pre><code>
curl -s https://raw.githubusercontent.com/sharatsc/cdse/master/boston-housing/boston.csv  | \
Rio -e 'model=lm("medv~.", df);model'
<pre><code>

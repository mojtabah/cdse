### Fetch data in XLS format

(LESO) 1033 Program dataset, which describes how surplus military arms have been distributed to local police forces.
This data was widely cited in the aftermath of the Ferguson, Missouri protests.

```bash
curl -L -O https://raw.githubusercontent.com/wireservice/csvkit/master/examples/realdata/ne_1033_data.xlsx
```

### Convert to csv
```bash
in2csv ne_1033_data.xlxs > data.csv
```

### Inspect the columns
```bash
csvcut -n data.csv
```

### Inspect the data in specific columns
```bash
csvcut -c county, quantity data.csv | csvlook
```

### Summary
```bash
csvcut -c county,acquisition_cost,ship_date data.csv | csvstat
```
### Searching
```bash
csvcut -c county,item_name,total_cost data.csv | csvgrep -c county -m LANCASTER | csvlook
```
### Mergine files
```bash
        curl -L -O https://raw.githubusercontent.com/wireservice/csvkit/master/examples/realdata/ks_1033_data.csv
        in2csv ne_1033_data.xlsx > ne_1033_data.csv
        in2csv ks_1033_data.xlsx > ks_1033_data.csv
        csvstack -g region ne_1033_data.csv ks_1033_data.csv > region.csv
```

### Query
```bash
csvsql --query "select count(*) from data" data.csv
```

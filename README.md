# CDSE Data science at the command line workshop

## Abstract
The workshop will present how to combine tools to quickly query, transform and model data using command line tools.
The goal is to show that command line tools are efficient at handling reasonable sizes of data and can accelerate the data science
process. The content
of the workshop is derived from the book of the same name (http://datascienceatthecommandline.com). In addition, we will cover
vowpal-wabbit (https://github.com/JohnLangford/vowpal_wabbit) as a versatile command line tool for modeling large datasets.

## Setup instructions

* Download and install virtual box to run virtual machines. Select the appropriate binary from https://www.virtualbox.org/wiki/Downloads
* Download vagrant to manage pre-built virtual machines. Vagrant is available for most platforms from https://www.vagrantup.com/
* Install the Datascience toolbox
  <code>
    mkdir data-science
    cd data-science
    vagrant init data-science-toolbox/data-science-at-the-command-line
    vagrant up
    vagant ssh
  </code>
* Once in the virtual machine, install the vowpal wabbit library. 
  * You can install it directly from source https://github.com/JohnLangford/vowpal_wabbit
  * You can also install it using 'sudo apt-get install vowpal-wabbit' within the vagrant session

#!/bin/bash

# Sample data in CSV format
data="name,age,country
John,25,USA
Alice,30,UK
Bob,35,Australia
Eve,20,USA"

# Function to parse data and generate visualization
parse_data() {
  echo "<html>"
  echo "<body>"
  echo "<h1>Data Visualization</h1>"
  echo "<table border='1'>"
  echo "<tr><th>Name</th><th>Age</th><th>Country</th></tr>"
  
  # Parse data and generate table rows
  IFS=',' read -r -a columns <<< "$data"
  for ((i=1; i<${#columns[@]}; i++)); do
    IFS=',' read -r -a row <<< "${columns[i]}"
    echo "<tr>"
    for cell in "${row[@]}"; do
      echo "<td>$cell</td>"
    done
    echo "</tr>"
  done
  
  echo "</table>"
  echo "</body>"
  echo "</html>"
}

# Generate visualization
parse_data > visualization.html

# Open the generated visualization in a browser
xdg-open visualization.html
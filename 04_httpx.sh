for i in $(cat 03_output.txt); do echo $i | httpx > 04_output_httpx.txt; done 

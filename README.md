# github_analysis


1. run pull_data.sh for the year and months that you care about

2. unzip_files.sh

3. python clean_files.py

4. run github_org_people.sh

5. run clean_people_file.sh

6.  run split -n 250 summary
grep seems to work better with smaller files

7. run process_files.sh

The results will be in the output directory

#!/bin/bash

# Define the path to the file and target directory
src="text.txt"
dst="LinuxProject"
file="$dst/text.txt"

# 1. Move the file to LinuxProject folder
echo "Moving $src to $dst..."
mv "$src" "$dst"
echo "$src has been moved to $dst."
echo

# 2. Display the contents of text.txt on the terminal
echo "Contents of $file:"
cat "$file"
echo

# 3. Append the following text to text.txt
echo "Let's learn Linux." >> "$file"
echo "Text appended to $file."
echo

# 4. Count the number of lines in text.txt
echo "Number of lines in $file:"
wc -l "$file"
echo

# 5. Search for the word "Love" in text.txt and display the lines containing it
echo "Lines containing 'Love' in $file:"
grep "Love" "$file"
echo

# 6. Replace "Make" with "Do" in text.txt
sed -i 's/Make/Do/g' "$file"
echo "'Make' has been replaced with 'Do' in $file."
echo

# 7. Display only the third word from each line in text.txt
echo "Third word from each line in $file:"
awk '{print $3}' "$file"
echo

# 8. Count the number of words in each line
echo "Number of words in each line of $file:"
awk '{print "Line " NR ": " NF " words"}' "$file"

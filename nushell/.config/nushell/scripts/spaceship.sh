
#!/usr/bin/env bash

# This script is a variation of the provided PACMAN script.
# It uses ANSI escape codes to display a colored spaceship graphic in the terminal.
# The code initializes a set of color variables and then uses a 'here document'
# to print the multi-colored ASCII art.

# Initialize foreground (f) and background (b) color variables
# The loop generates variables like f0, f1, f2... for easy access.
f=3 b=4
for j in f b; do
  for i in {0..7}; do
    printf -v $j$i %b "\e[${!j}${i}m"
  done
done

# Define some common text styles
bld=$'\e[1m' # Bold text
rst=$'\e[0m' # Reset all attributes
inv=$'\e[7m' # Invert colors

# Use a "here document" to print the ASCII art
# The color variables ($f1, $f4, etc.) are used to color the different parts.
cat << EOF

${rst}
             ${f4}      /\\
            /  \\
           /    \\
          /      \\
         /        \\
        |          |
        |  ${f3}*${f4}     ${f3}*${f4}  |
        |    ${f3}*${f4}     |
        |  ${f3}*${f4}   ${f3}*${f4}   |
        |  ${f3}*${f4}     ${f3}*${f4}  |
         \\        /
          \\______/
            |  |
         ${f1}*${f4} |  | ${f1}*${f4}
      ${f1}*${f4} /    \\ ${f1}*${f4}
     ${f1}*${f4} /      \\ ${f1}*${f4}
    ${f1}*${f4}/ ${bld}  ** ${rst}${f4}\\ ${f1}*${f4}
    ${f1}/  *** \\
    /  ** \\
   /    * \\
  /     * \\
 /_____________\\

EOF

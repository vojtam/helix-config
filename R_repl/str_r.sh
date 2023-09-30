#!/bin/bash
tmux load-buffer buffer.txt
buffer=$(tmux show-buffer)

# Define the string to be prepended
prepend_string="str("

# Define the string to be appended
appended_string=")"


# Append the desired string
buffer_content="${prepend_string}${buffer}${appended_string}"

# Reload the buffer with the updated content
echo -n "$buffer_content" | tmux load-buffer -

# Paste the buffer
tmux paste-buffer -dpr -t '{right-of}' \; send-keys -t '{right-of}' Enter

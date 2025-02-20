#!/bin/bash

# Prompt the user for their name
read -p "Enter your name: " user_name

# Create the base directory with the user's name
directory="submission_reminder_$user_name"
echo "Creating directory: $directory"
mkdir -p "$directory"/scripts "$directory"/config "$directory"/data

# Populate the config.env file
cat <<EOL > "$directory/config/config.env"
# Configuration for the submission reminder app
APP_NAME="Submission Reminder App"
REMINDER_INTERVAL=24h
EOL

echo "Created config.env"

# Populate the functions.sh file
cat <<EOL > "$directory/scripts/functions.sh"
#!/bin/bash
# Function to send a reminder
echo "Sending reminder to student..."
EOL

echo "Created functions.sh"

# Populate the reminder.sh file
cat <<EOL > "$directory/scripts/reminder.sh"
#!/bin/bash
# Reminder script that uses functions.sh
source "./functions.sh"
echo "Reminder script executed."
EOL

echo "Created reminder.sh"

# Populate the submissions.txt file
cat <<EOL > "$directory/data/submissions.txt"
# Sample student submission records
Alice, Submitted
Bob, Not Submitted
Charlie, Submitted
David, Not Submitted
Eve, Submitted

# Additional records
Frank, Submitted
Grace, Not Submitted
Heidi, Submitted
Ivan, Not Submitted
Judy, Submitted
EOL

echo "Created submissions.txt"

# Create the startup.sh file
cat <<EOL > "$directory/scripts/startup.sh"
#!/bin/bash
# Startup script for the submission reminder app
source "./config/config.env"
echo "Starting the \$APP_NAME..."
echo "Loading student submission data..."
cat "./data/submissions.txt"
echo "Application is now running."
EOL

# Make all shell scripts executable
chmod +x "$directory/scripts"/*.sh

# Completion message
echo "Environment setup complete! The submission reminder app has been configured in $directory."


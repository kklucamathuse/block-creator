
# Get user input
read -p "Name des Blocks: " blockName
echo "### block.json - config ###"
read -p "Titel des Blocks: " blockTitle
read -p "Beschreibung des Blocks: " blockDescription
read -p "Kategorie des Blocks: " blockCategory

# Create the block directory
create_directory() {
    if [ ! -d "$blockName" ]; then
        mkdir "$blockName"
        chmod 755 "$blockName"
        echo "Verzeichnis '$blockName' erstellt"
    else
        echo "Verzeichnis '$blockName' existiert bereits"
        exit 1
    fi
}

# Create the files within the directory
create_file() {
    jq -r 'keys[] as $key | $key' file_templates.json | while read -r key; do
        if [ ! -f "$blockName/$key" ]; then
            touch "$blockName/$key"
            echo "Datei '$key' erstellt"
        else
            echo "Datei '$key' existiert bereits"
            continue
        fi
    done
}

# Append content to the files
append_file() {
    # templates=$("./file_templates.json")
    template_php=$(jq -r '.["template.php"]' file_templates.json)
    block_json=$(jq -r '.["block.json"]' file_templates.json)

    # Replace placeholders using jq
    # block_json=$(jq '.["block.json"] | gsub("{{blockName}}"; "testName"))

    echo "$template_php" > "$blockName/template.php"
    echo "$block_json" > "$blockName/block.json"
}

# Call functions
create_directory
create_file
append_file

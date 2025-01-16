#!/usr/bin/env bash
read -p "Name des Blocks: " blockName
# create block folder
if [ ! -d "$blockName" ]; then
    mkdir "$blockName"
    chmod 755 "$blockName"
    echo "Verzeichnis '$blockName' erstellt."
else
    echo "Verzeichnis '$blockName' existiert bereits."
fi
# create standard files
files=("template.php" "block.json")
for file in "${files[@]}"; do
    if [ ! -f "$blockName/$file" ]; then
        touch "$blockName/$file"
        echo "Datei '$file' erstellt."

        case "$file" in
            ("template.php")
                cat <<EOL > "$blockName/$file"
<?php
    // Get name of the current element.
    \$element = basename(__DIR__);

    // Get block ID.
    \$id = \$block['id'];

    // Path to Block-Element
    \$blockPath = get_stylesheet_directory_uri() . "/blocks/" . \$element;
    \$path = "data-blockpath='\$blockPath'";

    // ACF fields.
    

    // Classes.
    \$kkBlock = " block-" . \$element;
    \$classes = \$kkBlock;

    // Show block-preview in Gutenberg Editor.
    if (isset(\$block['data']['block-preview'])) { ?>
        <img src="<?php echo \$blockPath . str_replace("file:.", "", \$block['data']['block-preview']); ?>" />
    <?php } else { }
?>
EOL
                ;;
            ("block.json")
            read -p "Titel des Blocks: " blockTitle
            read -p "Beschreibung des Blocks: " blockDescription
            cat <<EOL > "$blockName/$file"
{
    "name": "acf/$blockName",
    "title": "$blockTitle",
    "description": "$blockDescription",
    "category": "design",
    "icon": {
        "background": "#670229",
        "foreground": "#fff",
        "src": "minus"
    },
    "keywords": [
        "divider",
        "trenner"
    ],
    "acf": {
        "mode": "edit",
        "renderTemplate": "template.php"
    },
    "supports": {
        "align": false,
        "mode": false
    },
    "example": {
        "attributes": {
            "mode": "preview",
            "data": {
                "block-preview": "file:./preview.png"
            }
        }
    }
}
EOL
                ;;
        esac
    else
        echo "Datei '$file' existiert bereits."
    fi
done
# Erstellen von weiteren Dateien
read -r -p "Möchtest du style.css und script.js hinzufügen? [y/N] " response
case "$response" in
    ([yY][eE][sS]|[yY]) 
        touch "$blockName/style.sass"
        touch "$blockName/script.js"
        ;;
    (*)
        echo "Prozess beendet"
        ;;
esac

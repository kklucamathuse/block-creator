
## Block Creator

This script simplifies Advanced Custom Fields (ACF) Pro block creation by generating the necessary directory and files with boilerplate content within your `blocks` directory. It streamlines your workflow by automating the initial setup, allowing you to focus on building custom block functionality.

### Prerequisites

-   Bash
-   jq (command-line JSON processor)

### Installation

1.  **Install jq:** If you don't have `jq` installed, you can usually install it using your system's package manager.
 
    Debian / Ubuntu
    
    ```
    sudo apt-get install jq
    ```
    
    macOS
    
    ```
    brew install jq
    ```
    
    Windows
    
    ```
    winget install jqlang.jq
    ```
    
3.  **Clone the repository:**
    
    Bash
    
    ```
    git clone https://github.com/your-username/block-creator.git
    ```
    
4.  **Make the script executable:**
    
    Bash
    
    ```
    chmod +x block-creator.sh
    ```
    

### Usage

1.  **Place the script:** Put `block-creator.sh` and `file_templates.json` in the root directory of your ACF project, where your `blocks` directory is located.

2.  **Run the script:**

	Bash
	```
	./block-creator.sh
	```
3. **Follow the prompts:** The script will ask for the block name, title, description, and category.

The script will create a new directory for the block within your `blocks` directory and populate it with the necessary files (`block.json` and `template.php`) filled with boilerplate content.

### Example
 - blocks
	 - test-block
		 - block.json
		 - template.php

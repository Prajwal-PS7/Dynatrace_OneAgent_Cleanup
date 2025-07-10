<img width="1536" height="1024" alt="ChatGPT Image Jul 10, 2025, 11_40_53 PM" src="https://github.com/user-attachments/assets/36d5bc52-8009-4f24-a29d-9dba9631a4a9" />

# Dynatrace OneAgent Cleanup Script 🧹
A lightweight and efficient Bash script to remotely clean up Dynatrace OneAgent storage data from multiple Linux worker nodes.

## 🚀 Features

- Connects to multiple worker nodes over SSH
- Cleans up OneAgent data directory
- Skips empty lines in node list
- Modular, function-based design
- Clear success/failure feedback per node

## 📁 Directory Structure
dynatrace-oneagent-cleanup/
<br>├── cleanup.sh
<br>├── workers.txt
<br>├── .gitignore
<br>├── LICENSE
<br>└── README.md

## 🛠️ Usage

### 1. Prepare `workers.txt`
List each worker node (hostname/IP) on a new line:

> 192.168.1.10 <br> 192.168.1.11

🔒 Make sure passwordless SSH or SSH key access is enabled for all nodes.

### 2. Run the script
```
chmod +x cleanup.sh
```
```
./cleanup.sh
```

📌 Target Cleanup Path <br>
The script clears the following directory on each node:

> /var/lib/containers/storage/volumes/dynatrace_oneagent_storage/_data/

You can update the path in the `TARGET_DIRECTORY` variable.

⚠️ Disclaimer
- Use this script in production with caution.
- It will permanently delete the contents of the target directory.

📄 License
This project is licensed under the MIT License.

#!/bin/bash

# ---------- !! Configuration !! ---------- #
WORKER_NODES_FILE="workers.txt"
TARGET_DIRECTORY="/var/lib/containers/storage/volumes/dynatrace_oneagent_storage/_data/"

# ---------- !! Functions !! ---------- #
print_start_message() {
    echo "========================================"
    echo "🚀 Starting Dynatrace OneAgent Cleanup"
    echo "Target Directory: $TARGET_DIRECTORY"
    echo "Worker List File: $WORKER_NODES_FILE"
    echo "========================================"
    echo
}

print_end_message() {
    echo
    echo "✅ Cleanup Completed Successfully!"
}

check_workers_file() {
    if [ ! -f "$WORKER_NODES_FILE" ]; then
        echo "❌ ERROR: '$WORKER_NODES_FILE' not found."
        exit 1
    fi
}

clean_worker_node() {
    node="$1"
    if [ -z "$node" ]; then
        return
    fi

    echo "🔗 Connecting to $node..."

    ssh -o StrictHostKeyChecking=no "$node" "sudo rm -rf ${TARGET_DIRECTORY}/*"
    if [ $? -eq 0 ]; then
        echo "✅ Cleaned up on $node"
    else
        echo "❌ Failed to clean up on $node"
    fi
}

perform_cleanup() {
    while IFS= read -r WORKER_NODE; do
        clean_worker_node "$WORKER_NODE"
    done < "$WORKER_NODES_FILE"
}

# ---------- !! Main Execution !! ---------- #
check_workers_file
print_start_message
perform_cleanup
print_end_message

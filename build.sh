#!/bin/bash

# info prints an informational message
info() {
  echo $'\x1b[32m[INFO]\x1b[0m' "$@"
}

# error prints an error message and exits with exit code 1
error() {
  echo $'\x1b[31;1m[ERR]\x1b[0m' "$@"
  exit 1
}

# Check if the required environment variables are set
if [ -z "${CI_PREV_COMMIT_SHA}" ] || [ -z "${CI_COMMIT_SHA}" ]; then
    error "CI_PREV_COMMIT_SHA and CI_COMMIT_SHA environment variables must be set."
fi

# Get the list of changed files between the previous commit and the current commit
changed_files=$(git diff --name-only "${CI_PREV_COMMIT_SHA}" "${CI_COMMIT_SHA}")

# Declare an associative array to store unique changed directories
declare -A changed_directories

# Iterate over changed files and extract the directories
for file in $changed_files; do
    directory=$(dirname "$file")
    # We don't want to execute this script recursively, so skip the current directory if it shows up
    if [[ "$directory" != "." ]]; then
    	changed_directories["$directory"]=1
    fi
done

if [[ "${#changed_directories[@]}" == 0 ]]; then
	info "Nothing to do. Exiting..."
	exit 0
fi

# Iterate over changed directories and execute build.sh if it exists
for dir in "${!changed_directories[@]}"; do
    build_script="${dir}/build.sh"
    if [ -f "${build_script}" ]; then
    	info "Entering ${dir}..."
    	pushd "${dir}" >/dev/null || error "pushd failed"
    	info "Executing ${build_script}..."
        # ./build.sh || error "${build_script} failed"
        info "Finished executing ${build_script}"
        popd >/dev/null || error "popd failed"
        info "Exited ${dir}"
    fi
done

info "Done!"

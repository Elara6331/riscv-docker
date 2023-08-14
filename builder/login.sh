#!/bin/bash

# Check if the required environment variables are set
if [ -z "${REGISTRY}" ] || [ -z "${REGISTRY_USERNAME}" ] || [ -z "${REGISTRY_PASSWORD}" ]; then
    echo "The REGISTRY, REGISTRY_USERNAME, and REGISTRY_PASSWORD environment variables must be set."
    exit 1
fi

# Log in to the registry using ko. This should generate a config.json with the authentication info.
echo "Logging in to ${REGISTRY}..."
ko login "${REGISTRY}" -u "${REGISTRY_USERNAME}" --password-stdin <<<"${REGISTRY_PASSWORD}" || exit 2

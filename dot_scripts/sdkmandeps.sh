#!/usr/bin/env bash

# Use SDKMan to install development tools
echo "Installing SDKMan as development tools manager"
curl -s "https://get.sdkman.io" | bash

# Install missing package (Linux)
case "$(uname -s)" in
    Linux)
        source "/root/.sdkman/bin/sdkman-init.sh"
        ;;
esac

echo "SDKMan installing development tools"
sdk install java
sdk install gradle
sdk install java 8.0.222-zulu
sdk install kotlin
echo "SDKMan updating"
sdk selfupdate

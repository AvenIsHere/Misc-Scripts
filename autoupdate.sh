export DEBIAN_FRONTEND=noninteractive

NTFY_URL="avenserverurlntfy"

if UPGRADE_OUTPUT="$(apt update -y 2>&1&& apt upgrade -y 2>&1)"; then
  curl -H "Title: Server update succeeded!" \
    -d "The server was updated. Details:
    $(echo "$UPGRADE_OUTPUT" | tail -n 5)" \
    "ntfy.sh/$NTFY_URL"
else
  curl -H "Title: Server update failed." \
  -d "The server failed to update. Details:
  $(echo "$UPGRADE_OUTPUT" | tail -n 5)" \
  "ntfy.sh/$NTFY_URL"
fi

apt autoremove -y
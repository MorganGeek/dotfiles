#!/usr/bin/env bash

source "$HOME/.scripts/secrets.sh"

function file_to_mail() {
    local source_file="$1"
    local attachment_name=$(basename "$1")
    local target_file="$source_file-encoded"
    base64 "$source_file" >"$target_file"
    local target_file_content

    target_file_content=$(\cat "$target_file")

    local mail_template="$HOME/Code/dotfiles/dot_scripts/mail.tpl"

    local mail_from="$PRINCIPAL_ACCOUNT_EMAIL"
    local mail_to=${2:-"$mail_from"}
    local name_from="$PRINCIPAL_ACCOUNT_FULLNAME"
    local name_to="$name_from"

    \cat "$mail_template" |
        sed "s/#FROM_NAME/$name_from/g" |
        sed "s/#FROM_MAIL/$mail_from/g" |
        sed "s/#TO_NAME/$name_to/g" |
        sed "s/#TO_MAIL/$mail_to/g" |
        sed "s/#ATTACHMENT_NAME/$attachment_name/g" >/tmp/mailwithattachement.txt
    #       sed "s/#ATTACHMENT_CONTENT/$target_file_content/g" >/tmp/mailwithattachement.txt
    #       sed "s/#ATTACHMENT_CONTENT/$target_file_content/g" >/tmp/mailwithattachement.txt
    echo "\n$target_file_content\n" >>/tmp/mailwithattachement.txt
    echo "\n--MULTIPART-MIXED-BOUNDARY--" >>/tmp/mailwithattachement.txt

    curl -v --ssl-reqd --url 'smtps://smtp.gmail.com:465' --user "$GMAIL_APP_USER:$GMAIL_APP_PASSWORD" --mail-from "$mail_from" --mail-rcpt "$mail_to" --upload-file /tmp/mailwithattachement.txt
}

#!/bin/bash

accounts="$(az cognitiveservices account list -g $1 --query '[].name' -o tsv)"

printf "%-35s %-60s %-35s %-35s\n" "Resource Group" "Resource" "Key 1" "Key 2"
printf "%-35s %-60s %-35s %-35s\n" "----------------------------------" "-----------------------------------------------------------" "----------------------------------" "----------------------------------"

for account in $accounts; do
  keys="$(az cognitiveservices account keys list -g $1 -n $account)"
      key1="$(jq -r '.key1' <<< $keys)"
      key2="$(jq -r '.key2' <<< $keys)"
      printf "%-35s %-60s %-35s %-35s\n" "$1" "$account" "$key1" "$key2"
done
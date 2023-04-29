#!/bin/bash

api="https://theaudiodb.com/api/v1/json"
user_agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.114 Safari/537.36"

function set_api_key() {
    # 1 - api_key: (string): <api_key>
    api_key=$1
}

function search_artist() {
    # 1 - s: (string): <artist name>
    # 2 - limit: (integer): <limit - default: 25>
    curl --request GET \
        --url "$api/$api_key/search.php?s=${1}&limit=${2:-25}" \
        --user-agent "$user_agent" \
        --header "content-type: application/json"
}

function get_artist() {
    # 1 - id: (integer): <artist id>
    curl --request GET \
        --url "$api/$api_key/artist.php?i=${1}" \
        --user-agent "$user_agent" \
        --header "content-type: application/json"
}

function get_albums() {
    # 1 - id: (integer): <artist id>
    curl --request GET \
        --url "$api/$api_key/album.php?i=${1}" \
        --user-agent "$user_agent" \
        --header "content-type: application/json"
}

function get_tracks() {
    # 1 - id: (integer): <album id>
    curl --request GET \
        --url "$api/$api_key/track.php?m=${1}" \
        --user-agent "$user_agent" \
        --header "content-type: application/json"
}

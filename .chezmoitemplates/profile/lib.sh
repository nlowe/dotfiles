ztwc() {
    TAB_NAME="${1}"
    shift

    COMMAND="${1}"
    shift

    if [[ $# -ne 0 ]]; then
        ARGS="args "
        for arg in "$@"; do
            ARGS+="\"${arg}\" "
        done
    else
        ARGS=""
    fi

    TEMP_LAYOUT=$(mktemp --suffix ".kdl")
    cat <<EOF >"${TEMP_LAYOUT}"
layout {
    pane size=1 borderless=true {
        plugin location="zellij:tab-bar"
    }
    pane {
        command "${COMMAND}"
        ${ARGS}
    }
    pane size=2 borderless=true {
        plugin location="zellij:status-bar"
    }
}
EOF

    zellij action new-tab --name "${TAB_NAME}" --layout "${TEMP_LAYOUT}"

    rm -f "${TEMP_LAYOUT}" >/dev/null 2>&1 || true
}

sst() {
    ztwc "${1}" ssh "${1}"
}

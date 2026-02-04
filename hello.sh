#!/bin/sh
# MINIFIER TORTURE TEST

# --- Heredocs (now supported!) ---
cat <<EOF
# This is NOT a comment - it's heredoc content
  Indented stays indented
EOF

# --- Strings with # ---
url="https://example.com/#anchor"
echo "Issue #42 is fixed"

# --- Parameter expansion ---
string="hello world"
echo "Length: ${#string}"
echo "Strip: ${string#hello }"

# --- Keywords in strings ---
echo "if then else do done"

# --- Case statement ---
test_case() {
    case "$1" in
        -h) echo "help" ;;
        *) echo "unknown" ;;
    esac
}

# --- Nested loops ---
outer() {
    if true; then
        for i in 1 2; do
            echo "i=$i"
        done
    fi
}

# --- Keyword-like function name ---
do_if_else() {
    echo "tricky name"
}

# --- Pipes/logic ---
echo "pipe" | tr 'a-z' 'A-Z'
true && echo "and"
false || echo "or"

# --- Main ---
main() {
    echo "=== Test ==="
    test_case -h
    outer
    do_if_else
    echo "=== Done ==="
}

main "$@"

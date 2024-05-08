#!/bin/bash

# Function to check if a given line exists in a file
line_exists() {
    grep -qF "$1" "$2"
}

# Add `className: hidden` in 1s line of _category_.yml files
# or `sidebar_class_name: hidden` in 2nd line of .mdx files to hide them from sidebar (added .hidden class in markdown.css)
if ! line_exists "className: hidden" "docs/subgraph/reference-guide/directives/_category_.yml"; then
    sed -i '1s/^/className: hidden\n/' "docs/subgraph/reference-guide/directives/_category_.yml"
fi

if ! line_exists "className: hidden" "docs/subgraph/reference-guide/scalars/_category_.yml"; then
    sed -i '1s/^/className: hidden\n/' "docs/subgraph/reference-guide/scalars/_category_.yml"
fi

if ! line_exists "sidebar_class_name: hidden" "docs/subgraph/reference-guide/objects/query.mdx"; then
    sed -i '2s/^/sidebar_class_name: hidden\n/' "docs/subgraph/reference-guide/objects/query.mdx"
fi

# Add pagination_next/pagination_previous to gracefully skip the previous sidbar hidden pages, to hide them from the
# next/previous page buttons at the bottom of the webpages
if ! line_exists "pagination_prev: subgraph/reference-guide/index" "docs/subgraph/reference-guide/enums/permission-operation.mdx"; then
    sed -i '2s#^#pagination_prev: subgraph/reference-guide/index\n#' "docs/subgraph/reference-guide/enums/permission-operation.mdx"
fi

if ! line_exists "pagination_next: subgraph/reference-guide/objects/standard-callback" "docs/subgraph/reference-guide/objects/plugin-version.mdx"; then
    sed -i '2s#^#pagination_next: subgraph/reference-guide/objects/standard-callback\n#' "docs/subgraph/reference-guide/objects/plugin-version.mdx"
fi

if ! line_exists "pagination_prev: subgraph/reference-guide/objects/plugin-version" "docs/subgraph/reference-guide/objects/standard-callback.mdx"; then
    sed -i '2s#^#pagination_prev: subgraph/reference-guide/objects/plugin-version\n#' "docs/subgraph/reference-guide/objects/standard-callback.mdx"
fi

if ! line_exists "pagination_next: null" "docs/subgraph/reference-guide/objects/transaction-actions-proposal.mdx"; then
    sed -i '2s/^/pagination_next: null\n/' "docs/subgraph/reference-guide/objects/transaction-actions-proposal.mdx"
fi
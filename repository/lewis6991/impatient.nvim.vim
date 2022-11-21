lua <<EOF
_G.__luacache_config = {
  modpaths = { enable = false }
}
require('impatient')
EOF

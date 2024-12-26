#######################################
# Print all arguments to stderr.
# Globals:
#   RED
#   NO_COLOR
# Arguments:
#   Any
# Outputs:
#   Writes all arguments to stderr
#######################################
fail() {
  echo "${RED}FAIL${NO_COLOR} | $*" >&2
}

#######################################
# Print all arguments to stdout.
# Globals:
#   GREEN
#   NO_COLOR
# Arguments:
#   Any
# Outputs:
#   Writes all arguments to stdout
#######################################
okay() {
  echo "${GREEN}OKAY${NO_COLOR} | $*" >&1
}

#######################################
# Print all arguments to stdout.
# Globals:
#   BLUE
#   NO_COLOR
# Arguments:
#   Any
# Outputs:
#   Writes all arguments to stdout
#######################################
info() {
  echo "${BLUE}INFO${NO_COLOR} | $*" >&1
}

#######################################
# Print all arguments to stdout.
# Globals:
#   YELLOW
#   NO_COLOR
# Arguments:
#   Any
# Outputs:
#   Writes all arguments to stdout
#######################################
warn() {
  echo "${YELLOW}WARN${NO_COLOR} | $*" >&1
}

#######################################
# Find service listening on a specific port.
# Globals:
#   None
# Arguments:
#   None or a port number
# Outputs:
#   Writes result to stdout
#######################################
listening() {
    if [ $# -eq 0 ]; then
        sudo lsof -iTCP -sTCP:LISTEN -n -P
    elif [ $# -eq 1 ]; then
        sudo lsof -iTCP -sTCP:LISTEN -n -P | grep -i --color $1
    else
        echo "Usage: listening [pattern]"
    fi
}

#######################################
# Find ip.
# Globals:
#   None
# Arguments:
#   None
# Outputs:
#   Writes ip to stdout
#######################################
ip() {
    ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'
}

#######################################
# Show all the names (CNs and SANs) listed in the SSL certificate for a given domain
# Credits: https://github.com/mathiasbynens/dotfiles/
# Globals:
#   None
# Arguments:
#   Domain
# Outputs:
#   Writes information to stdout
#######################################
function getcertnames() {
	if [ -z "${1}" ]; then
		echo "ERROR: No domain specified.";
		return 1;
	fi;

	local domain="${1}";
	echo "Testing ${domain}…";
	echo ""; # newline

	local tmp=$(echo -e "GET / HTTP/1.0\nEOT" \
		| openssl s_client -connect "${domain}:443" -servername "${domain}" 2>&1);

	if [[ "${tmp}" = *"-----BEGIN CERTIFICATE-----"* ]]; then
		local certText=$(echo "${tmp}" \
			| openssl x509 -text -certopt "no_aux, no_header, no_issuer, no_pubkey, \
			no_serial, no_sigdump, no_signame, no_validity, no_version");
		echo "Common Name:";
		echo ""; # newline
		echo "${certText}" | grep "Subject:" | sed -e "s/^.*CN=//" | sed -e "s/\/emailAddress=.*//";
		echo ""; # newline
		echo "Subject Alternative Name(s):";
		echo ""; # newline
		echo "${certText}" | grep -A 1 "Subject Alternative Name:" \
			| sed -e "2s/DNS://g" -e "s/ //g" | tr "," "\n" | tail -n +2;
		return 0;
	else
		echo "ERROR: Certificate not found.";
		return 1;
	fi;
}

#######################################
# Create a new directory and enter it.
# Credits: https://github.com/mathiasbynens/dotfiles/
# Globals:
#   None
# Arguments:
#   Directory name
# Outputs:
#   None
#######################################
mkd() {
    mkdir -p "$@" && cd "$@" || return 1
}

#######################################
# Determine size of a file or total size of a directory.
# Credits: https://github.com/mathiasbynens/dotfiles/
# Globals:
#   None
# Arguments:
#   File or directory path
# Outputs:
#   Writes information to stdout
#######################################
function fs() {
	if du -b /dev/null > /dev/null 2>&1; then
		local arg=-sbh;
	else
		local arg=-sh;
	fi
	if [[ -n "$@" ]]; then
		du $arg -- "$@";
	else
		du $arg .[^.]* ./*;
	fi;
}

#######################################
# Find files with the specified pattern (case insensitive) in the name.
# Credits: @purlpleidea, Quick Devops Hacks, talk at Infrastructure.Next
# Globals:
#   None
# Arguments:
#   Pattern
#   Directory to search, default to current directory
# Outputs:
#   Writes information to stdout
#######################################
ifind ()
{
  if [ "$#" = "0" ]; then
    echo "Usage: ifind PATTERN [DIR]..." 1>&2
    return 1
  fi
  pattern="$1";
  shift;
  if [ "$#" = "0" ]; then
    set ".";
  fi;
  for dir in "$@"; do
    find "${dir}" -iname "*${pattern}*";
    shift;
  done
}
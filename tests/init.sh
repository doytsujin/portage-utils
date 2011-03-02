d=$PWD
while [[ $d != "/" ]] ; do
	[[ -e $d/q ]] && break
	d=${d%/*}
done
PATH=$d:$PATH
unset d

q -i -q

fail() {
	echo "FAILED: $*"
	exit 1
}
die() { fail "$@" ; }

pass() {
	echo "PASSED"
	exit 0
}

mktmpdir() {
	local d=${1:-tmp}
	rm -rf "$d" && mkdir "$d" && cd "$d" \
		|| fail "could not make tmp dir '$1'"
}
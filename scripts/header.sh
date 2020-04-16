__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
__file="${__dir}/$(basename "${BASH_SOURCE[0]}")"

CODING_DIR=$HOME/Coding
STANDARD_MOUNTING_ARGUMENTS="-v ${CODING_DIR}:/Coding"
STANDARD_PORT_FORWARDS="-p 5920:5920 -p 9090:9090"

xhost + 127.0.0.1
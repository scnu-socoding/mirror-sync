#!/bin/bash
#
########
#
# Copyright © 2014-2019 Florian Pritz <bluewind@xinu.at>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, see <http://www.gnu.org/licenses/>.
#
########

source /mnt/socoding/mirror-sync/util.sh

distro=${1}

# Directory where the repo is stored locally. Example: /srv/repo
target="/mnt/socoding/files/${distro}"

# Directory where files are downloaded to before being moved in place.
# This should be on the same filesystem as $target, but not a subdirectory of $target.
# Example: /srv/tmp
tmp="/mnt/socoding/mirror-pending/${distro}"

# Lockfile path
lock="/var/lock/${distro}-syncrepo.lck"

# If you want to limit the bandwidth used by rsync set this.
# Use 0 to disable the limit.
# The default unit is KiB (see man rsync /--bwlimit for more)
bwlimit=0

# The source URL of the mirror you want to sync from.
source_url="rsync://mirrors.bfsu.edu.cn/${distro}/"

#### END CONFIG

[ ! -d "${target}" ] && mkdir -p "${target}"
[ ! -d "${tmp}" ] && mkdir -p "${tmp}"

exec 9>"${lock}"
flock -n 9 || exit

rsync_cmd() {
	local -a cmd=(rsync -rtlH --safe-links --delete-after ${VERBOSE} "--timeout=600" "--contimeout=60" -p \
		--delay-updates --no-motd "--temp-dir=${tmp}")

	cmd+=(-h -v --progress)

	if ((bwlimit>0)); then
		cmd+=("--bwlimit=${bwlimit}")
	fi

	"${cmd[@]}" "$@"
}

rsync_cmd \
	"${source_url}" \
	"${target}"

/mnt/socoding/mirror-sync/util/update-status.py ${2} ${?}

touch ${target}
echo "Last sync was $(LC_ALL=C date)" >> /mnt/socoding/mirror-log/${distro}.log

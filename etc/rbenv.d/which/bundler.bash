# Copyright 2012 Roy Liu
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may not
# use this file except in compliance with the License. You may obtain a copy of
# the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations under
# the License.

# The rbenv-bundler plugin delegate for "rbenv which".

source -- "$(dirname -- "$(dirname -- "${BASH_SOURCE[0]}")")/bundler/includes.sh"

if [[ -z "$plugin_enabled" ]]; then
    return -- 0
fi

manifest_dir="${plugin_root_dir}/share/rbenv/bundler"

if { ! bundled_executable=$(find_bundled_executable "$manifest_dir"); } then
    return -- 0
fi

# Yield an executable in the bundle installation path.
RBENV_COMMAND_PATH=$bundled_executable

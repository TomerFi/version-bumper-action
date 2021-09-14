#!/bin/bash

# Copyright Tomer Figenblat.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#     http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# execute script into variable
output=$(/usr/local/scripts/entrypoint.sh --changelog $1 --preset $2 --label $3 --repopath /github/workspace)
# split output members from the variable
read new_version next_dev_iteration <<< $(cut -f1,2 -d" " <<<$output)
echo "debug"
echo $new_version
echo $next_dev_iteration
# set action outputs
echo "::set-output name=new_version::$new_version"
echo "::set-output name=next_dev_iteration::$next_dev_iteration"

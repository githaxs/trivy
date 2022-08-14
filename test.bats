#!/usr/bin/env bats
source ./task.sh

@test "githaxs task" {
  #git clone --branch demo git@github.com:githaxs/demo.git /tmp/test
  git clone --branch GabeL7r-patch-9 git@github.com:githaxs/test.git /tmp/test
  cd /tmp/test
  FILES=$(ls)
  run run_task "$FILES"

  rm -rf /tmp/test
  echo "$status"
  echo "$output"
  [ "$status" -eq 1 ]
}

@test "returns success if no files changed" {
  mkdir /tmp/test
  cd /tmp/test
  run run_task ""

  echo "$status"
  echo "$output"
  [ "$status" -eq 0 ]

}
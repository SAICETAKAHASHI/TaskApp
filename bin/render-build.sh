#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rails db:migrate
#データの初期埋め込みが必要ない為以下は実行しない
#bundle exec rails db:seed
bundle exec rails assets:precompile
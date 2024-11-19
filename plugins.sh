#!/bin/bash

list_plugins() {
  local nvim_config_home="${XDG_CONFIG_HOME}/nvim"

  find "${nvim_config_home}" -type f -name "*.lua" -exec grep -H -C 10 '' {} \;
}

list_plugins


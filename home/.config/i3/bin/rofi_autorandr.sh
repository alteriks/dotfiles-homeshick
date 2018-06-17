#!/bin/bash
autorandr_mode=$( autorandr | rofi -dmenu | sed -e 's/ .*//')
autorandr -c ${autorandr_mode} 

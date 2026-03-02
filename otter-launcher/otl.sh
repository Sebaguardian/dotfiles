#!/usr/bin/env bash
#
# script that utilize kitten with otter-launcher
# don't know if I want to remove .sh or not tbh

pkill otter-launcher || \
        kitten panel -1 \
            --layer=overlay \
            --edge=center-sized \
            --lines=14 \
            --columns=46 \
            --move-to-active-monitor \
            --focus-policy exclusive \
            --app-id=otter-launcher \
            otter-launcher

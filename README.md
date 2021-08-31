
[![Bonsai Asset Badge](https://img.shields.io/badge/Bonsai-Download%20Me-brightgreen.svg?colorB=89C967&logo=sensu)](https://bonsai.sensu.io/assets/karlvr/sensu-plugins-vmstats)

# Sensu Go VMStats Plugin

Table of Contents

- [Overview](#overview)
- [Usage examples](#usage-examples)
- [Configuration](#configuration)
  - [Asset registration](#asset-registration)
- [Publishing](#publishing)

## Overview

Replacements for [sensu-plugins/sensu-plugins-vmstats](https://github.com/sensu-plugins/sensu-plugins-vmstats) using Perl rather than Ruby, so that it doesn't require the Ruby runtime.

This plugin is architecture independent; it will run on Intel and ARM machines.

## Configuration

### Asset Registration

Assets are the best way to make use of this plugin. If you're not using an asset, please consider doing so! If you're using sensuctl 5.13 or later, you can use the following command to add the asset: 

`sensuctl asset add karlvr/sensu-plugins-vmstats`

If you're using an earlier version of sensuctl, you can find the asset on the [Bonsai Asset Index](https://bonsai.sensu.io/assets/karlvr/sensu-plugins-vmstats).

## Publishing

1. Tag and push the current commit with the next release version.
2. Run `make` in order to create the release assets in the `dist` folder.
3. Create a new Release on GitHub from the tag, and attach the files from the `dist` folder to the release.

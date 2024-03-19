#!/bin/bash

mkdir -p /run/php
chown www-data:www-data /run/php

exec $@
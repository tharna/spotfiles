#!/usr/bin/php
<?php
$input = file_get_contents('php://stdin');
preg_match('|^To: (.*)|', $input, $matches);
$t = tempnam("/tmp", $matches[1]);
file_put_contents($t, $input);

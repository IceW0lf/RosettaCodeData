<?php
declare(ticks = 1);

$start = microtime(true);

function mySigHandler() {
  global $start;
  $elapsed = microtime(true) - $start;
  echo "Ran for $elapsed seconds.\n";
  exit();
}

pcntl_signal(SIGINT, 'mySigHandler');

for ($n = 0; ; usleep(500000)) // 0.5 seconds
   echo ++$n, "\n";
?>

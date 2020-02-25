<?php

$inputString = <<<HTML
<div>
  <script type="text/javascript" src="app.js"></script>
  <div>
    <img
    src="/img/01.png?a=0" alt="01"/>
    <img src="/img/02.png" alt="02"/>
  </div>
  <a href="/skip">Skip</a>
</div>
HTML;

echo PHP_EOL . urlRewriter($inputString) . PHP_EOL;

function urlRewriter(string $string)
{
    $result = preg_replace_callback("/(<img[^>]*src *= *[\"']?)([^\"']*)/i", function ($matches) {
        $delimiter = strpos($matches[2], '?') ? '&' : '?';

        return sprintf('%s%s%sv=%s', $matches[1], $matches['2'], $delimiter, mt_rand(1000000, 9999999));
    }, $string);

    return $result;
}

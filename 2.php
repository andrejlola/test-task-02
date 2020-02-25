<?php

function countDigits($inputString)
{
    $stringLength = mb_strlen($inputString);
    $counts = [];
    $result = [];

    for ($i = 0; $i < $stringLength; $i++) {
        $digit = $inputString[$i];

        if (!isset($counts[$digit])) {
            $counts[$digit] = 0;
        }

        $counts[$digit]++;
    }


    foreach ($counts as $digit => $count) {
        if ($count & 1) {
            $result[] = $digit;
        }
    }

    return implode('', $result);
}

echo PHP_EOL . countDigits('121303948');
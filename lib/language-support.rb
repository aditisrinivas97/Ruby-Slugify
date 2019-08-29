#!/usr/bin/env ruby

$defaultMap = {
    '"' =>  "",
    '\'' => "",
    '’' =>  "",
    '‒' =>  "-", 
    '–' =>  "-", 
    '—' =>  "-", 
    '―' =>  "-",
}

$deutscheMap = {
    '&' => "und",
    '@' => "an",
    'ä' => "ae",
    'Ä' => "Ae",
    'ö' => "oe",
    'Ö' => "Oe",
    'ü' => "ue",
    'Ü' => "Ue",
}

$englishMap = {
    '&' => "and",
    '@' => "at",
}

$spanishMap = {
    '&' => "y",
    '@' => "en",
}

$finnishMap = {
    '&' => "ja",
    '@' => "at",
}

$greekMap = {
    '&' => "kai",
    'η' => "i",
    'ή' => "i",
    'Η' => "i",
    'ι' => "i",
    'ί' => "i",
    'ϊ' => "i",
    'Ι' => "i",
    'χ' => "x",
    'Χ' => "x",
    'ω' => "w",
    'ώ' => "w",
    'Ω' => "w",
    'ϋ' => "u",
}

$dutchMap = {
    '&' => "en",
    '@' => "at",
}

$polishMap = {
    '&' => "i",
    '@' => "na",
}

$turkishMap = {
    '&' => "ve",
    '@' => "et",
    'ş' => "s",
    'Ş' => "S",
    'ü' => "u",
    'Ü' => "U",
    'ö' => "o",
    'Ö' => "O",
    'İ' => "I",
    'ı' => "i",
    'ğ' => "g",
    'Ğ' => "G",
    'ç' => "c",
    'Ç' => "C",
}

$referenceTable = {
    "en" => $englishMap,
    "es" => $spanishMap,
    "de" => $deutscheMap, 
    "fi" => $finnishMap,
    "nl" => $dutchMap,
    "po" => $polishMap,
    "tr" => $turkishMap, 
    "gr" => $greekMap,
    "el" => $greekMap,
    "ell" => $greekMap
}
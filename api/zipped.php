<?php
$dir = '../assets/files';
$archive = 'DokumenFoto.zip';


$zip = new ZipArchive;
$zip->open($archive, ZipArchive::CREATE);
$files = scandir($dir);
unset($files[0], $files[1]);
foreach ($files as $file) {
$zip->addFile($dir.'/'.$file, $file);
}
$zip->close();
header('Content-Type: application/zip');
header('Content-disposition: attachment; filename='.$archive);
header('Content-Length: '.filesize($archive));
readfile($archive);
unlink($archive);exit;
?>

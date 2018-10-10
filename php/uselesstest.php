<?php
echo '<pre>';
echo ob_get_level(),'<br/> ';
ob_start(); 
echo ob_get_level(),'<br/> ';
ob_start(); 
echo ob_get_level(),'<br/> ';
ob_end_flush();
echo ob_get_level(),'<br/> ';
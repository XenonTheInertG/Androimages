#!/system/bin/sh
e="\x1b[";c=$e"39;49;00m";y=$e"93;01m";cy=$e"96;01m";r=$e"1;91m";g=$e"92;01m";m=$e"95;01m";
quit() 
{
clear; 
exit;
}

____________________________________________________________
|                    Rec-Boot Bot                          |
|     Auto boot & reco port tool by XenonTheInertG         |
|                 Stable version V5.0                      |
|        Huge shoutout to to my parents & all the devs     |
|__________________________________________________________|
 
auto_tools()
{
clear;
echo ""
echo -e "____________________________________________________________";
echo -e "|                                                          |";
echo -e "|                      $y AUTO PORT MENU$c                 |";
echo -e "|                                                          |";
echo -e "|__________________________________________________________|";
echo ""
echo "_______________________________________";
echo -e "|$y A. AUTO NORMAL BOOT$c          |";
echo "______________________________________|";
echo -e "|$m B. AUTO LOS BOOT$c             |"; 
echo "______________________________________|";
echo -e "|$cy C. AUTO TWRP 3.0.2-7$c        |";
echo "______________________________________|";
echo -e "|$y E. BACK$c                      |";
echo "______________________________________|";
echo ""
printf %s "Type your option [A, B, C, E] then press ENTER: ";
read exmenv1;
case $exmenv1 in
 a|A) normal_boot;;
 b|B) cm_boot;;
 c|C) auto_recovery;;
 e|E) main;;
 *) supan1;;
esac
}

normal_boot()
{
clear
echo""
sleep 2
echo "$cy Auto porting normal based boot$c"
echo ""
mkdir stock
mkdir port
ls
echo ""
echo "$y Please..!! copy the boot.img put in stock and port folder$c"
read enter
echo "$y Press enter Please......!!!!!$c"
read enter
clear
if [[ -f /data/local/Xenon54/stock/boot.img ]]; then
mv stock/boot.img .script/
./.script/unpackimg.sh
if [[ -f /data/local/Xenon54/.script/ramdisk/default.prop ]]; then
mv .script/ramdisk stock/
mv .script/split_img stock/
mv .script/boot.img stock/
clear
   if [[ -f /data/local/Xenon54/port/boot.img ]]; then
     mv port/boot.img .script/
     ./.script/unpackimg.sh
     if [[ -f /data/local/Xenon54/.script/ramdisk/default.prop ]]; then
     mv .script/boot.img port/ 
     clear
     rm -r .script/split_img/boot.img-zImage
     cp stock/split_img/boot.img-zImage .script/split_img/  
     clear
     ./.script/repackimg.sh
     if [[ -f /data/local/Xenon54/.script/image-new.img ]]; then
     mv .script/image-new.img boot-new.img  
     clear
     ./.script/cleanup.sh
     mv stock/boot.img boot-stock.img
     mv port/boot.img boot-port.img
     rm -r stock
     rm -r port
clear 
echo ""
sleep 2
echo "$cy Auto porting normal based boot Done...!!!$c"
     else
echo ""
     rm -r .script/ramdisk
     rm -r .script/split_img
	echo -e " $r Repacking  boot.img error...$c";
   fi
    else
echo ""
     rm -r .script/ramdisk
     rm -r .script/split_img
     mv .script/boot.img port/
     mv stock/boot.img boot-stock.img
     mv port/boot.img boot-port.img
     rm -r stock
     rm -r port
	echo -e " $r Unpacking port boot.img error...$c";
   fi 
   else
echo ""
rm -r port
	echo -e " $r no boot.img in /data/local/Xenon54/port...$c";
   fi 
else
echo ""
rm -r .script/ramdisk
rm -r .script/split_img
mv .script/boot.img stock/
mv stock/boot.img boot-stock.img
mv port/boot.img boot-port.img
rm -r stock
rm -r port
	echo -e " $r Unpacking stock boot error..!!$c";
   fi
else
echo ""
rm -r stock
	echo -e " $r no boot.img in /data/local/Xenon54/stock....$c";
fi
echo ""
sleep 2
echo "$y Press Enter to auto port menu$c"
read enterKey
pause;
auto_tools;
}

cm_boot()
{
clear
echo""
sleep 2
echo "$cy Auto porting los based boot$c"
echo ""
mkdir stock
mkdir port
ls
echo ""
echo "$y Please..!! copy the boot.img put in stock and port folder$c"
read enter
echo "$y Press enter Please......!!!!!$c"
read enter
clear
if [[ -f /data/local/Xenon54/stock/boot.img ]]; then
mv stock/boot.img .script/
./.script/unpackimg.sh
if [[ -f /data/local/Xenon54/.script/ramdisk/default.prop ]]; then
mv .script/ramdisk stock/
mv .script/split_img stock/
mv .script/boot.img stock/
clear
   if [[ -f /data/local/Xenon54/port/boot.img ]]; then
     mv port/boot.img .script/
     ./.script/unpackimg.sh
     if [[ -f /data/local/Xenon54/.script/ramdisk/default.prop ]]; then
     mv .script/boot.img port/  
     clear
     rm -r .script/split_img/boot.img-zImage
     rm -r .script/ramdisk/ueventd.rc
     cp stock/split_img/boot.img-zImage .script/split_img/
     cp stock/ramdisk/ueventd.rc .script/ramdisk/   
     clear
     ./.script/repackimg.sh
     if [[ -f /data/local/Xenon54/.script/image-new.img ]]; then
     mv .script/image-new.img boot-new.img     
     clear
     ./.script/cleanup.sh
     mv stock/boot.img boot-stock.img
     mv port/boot.img boot-port.img
     rm -r stock
     rm -r port
clear  
echo ""
sleep 2
echo "$cy Auto porting los based boot Done...!!!$c"
else
echo ""
     rm -r .script/ramdisk
     rm -r .script/split_img
	echo -e " $r Repack  boot.img error...$c";
   fi  
    else
echo ""
     rm -r .script/ramdisk
     rm -r .script/split_img
     mv .script/boot.img port/
     mv stock/boot.img boot-stock.img
     mv port/boot.img boot-port.img
     rm -r stock
     rm -r port
	echo -e " $r Unpacking port boot.img error...$c";
   fi  
   else
echo ""
rm -r port
	echo -e " $r no boot.img in /data/local/Xenon54/port...$c";
   fi
else
echo ""
rm -r .script/ramdisk
rm -r .script/split_img
mv .script/boot.img stock/
mv stock/boot.img boot-stock.img
mv port/boot.img boot-port.img
rm -r stock
rm -r port
	echo -e " $r Unpacking stock boot error..!!$c";
   fi 
else
echo ""
rm -r stock
	echo -e " $r no boot.img in /data/local/Xenon54/stock....$c";
fi
echo ""
sleep 2
echo "$y Press Enter to auto port menu$c"
read enterKey
pause;
auto_tools;
}

auto_recovery()
{
clear
echo""
sleep 2
echo "$cy Auto porting TWRP 3.0.2-7 for your devices$c              "
echo ""
mkdir stock
ls
echo ""
echo "$y Please..!! copy the stock recovery.img put in stock folder$c"
read enter
echo "$y Press enter Please......!!!!!$c"
read enter
clear
if [[ -f /data/local/Xenon54/stock/recovery.img ]]; then
mv stock/recovery.img .script/
./.script/unpackimg.sh
if [[ -f /data/local/Xenon54/.script/ramdisk/default.prop ]]; then
mv .script/ramdisk stock/
mv .script/split_img stock/
mv .script/recovery.img stock/
   clear
   mv .port/twrp.img .script/
   ./.script/unpackimg.sh
   if [[ -f /data/local/Xenon54/.script/ramdisk/file_contexts ]]; then
   mv .script/twrp.img .port/
   clear
   rm -r .script/split_img/twrp.img-zImage
   mv stock/split_img/recovery.img-zImage .script/split_img/twrp.img-zImage
   cp stock/ramdisk/default.prop .script/ramdisk/
   cp stock/ramdisk/ueventd.rc .script/ramdisk/
   if [[ -f /data/local/Xenon54/stock/ramdisk/fstab ]]; then      
     cp stock/ramdisk/fstab .script/ramdisk/ 
     else
     cp stock/ramdisk/fstab.mt* .script/ramdisk/    
   fi 
   if [[ -f /data/local/Xenon54/.script/ramdisk/fstab.mt6580 ]]; then 
     cp .port/recovery.fstab .script/ramdisk/etc/  
   fi
   if [[ -f /data/local/Xenon54/.script/ramdisk/fstab.mt6735 ]]; then  
     cp .port/recovery.fstab .script/ramdisk/etc/  
   fi   
   clear
   ./.script/repackimg.sh
   if [[ -f /data/local/Xenon54/.script/image-new.img ]]; then  
   mv .script/image-new.img recovery-new.img
   clear
   ./.script/cleanup.sh
   mv stock/recovery.img recovery-stock.img
   rm -r stock
   clear
   echo ""
sleep 2
echo "$cy Auto porting TWRP 3.0.2-7 Done...!!!$c"
   else
echo ""
rm -r .script/ramdisk
rm -r .script/split_img
echo ""
	echo -e " $r Repacking recovery error..!!$c";
fi
   else
echo ""
rm -r .script/ramdisk
rm -r .script/split_img
mv .script/twrp.img .port/
mv stock/recovery.img recovery-stock.img
rm -r stock
echo ""
	echo -e " $r Unpacking port recovery error..!!$c";
fi
   else
echo ""
rm -r .script/ramdisk
rm -r .script/split_img
mv .script/recovery.img stock/
mv stock/recovery.img recovery-stock.img
rm -r stock
echo ""
	echo -e " $r Unpack stock recovery error..!!$c";
fi
else
echo ""
rm -r stock
	echo -e " $r no stock recovery.img in /data/local/Xenon54/stock....$c";
fi
sleep 2
echo ""
echo "$y Press Enter to auto port menu$c"
read enterKey
pause;
auto_tools;
}

manually_port()
{
clear;
echo ""
echo -e "____________________________________________________________";
echo -e "|                                                          |";
echo -e "|                   $y MANUALLY PORT MENU$c                |";
echo -e "|                                                          |";
echo -e "|__________________________________________________________|";
echo ""
echo "_______________________________________";
echo -e "|$y   A. UNPACK BOOT$c             |"; 
echo "______________________________________|";
echo -e "|$cy  B. REPACK BOOT$c             |";
echo "______________________________________|";
echo -e "|$y   C. UNPACK RECOVERY$c         |";
echo "______________________________________|";
echo -e "|$cy  D. REPACK RECOVERY$c         |";
echo "______________________________________|";
echo -e "|$y   E. BACK$c                    |";
echo "______________________________________|";
echo ""
printf %s "Type your option [A,B,C,D,E] then press ENTER: ";
read exmenv2;
case $exmenv2 in
 a|A) unpack_boot;;
 b|B) repack_boot;;
 c|C) unpack_recovery;;
 d|D) repack_recovery;;
 e|E) main;;
 *) supan2;;
esac
}

unpack_boot()
{
clear
echo""
sleep 2
echo "$cy Unpackimg boot.img in stock folder and port folder$c"
echo ""
mkdir stock
mkdir port
ls
echo ""
echo "$y Please..!! copy the boot.img put in stock folder and port folder$c"
read enter
echo "$y Press enter Please......!!!!!$c"
read enter
clear
if [[ -f /data/local/Xenon54/stock/boot.img ]]; then
mv stock/boot.img .script/
./.script/unpackimg.sh
if [[ -f /data/local/Xenon54/.script/ramdisk/default.prop ]]; then
mv .script/ramdisk stock/
mv .script/split_img stock/
mv .script/boot.img stock/
clear
if [[ -f /data/local/Xenon54/port/boot.img ]]; then
mv port/boot.img .script/
./.script/unpackimg.sh
if [[ -f /data/local/Xenon54/.script/ramdisk/default.prop ]]; then
mv .script/ramdisk port/
mv .script/split_img port/
mv .script/boot.img port/
echo ""
echo "$cy Unpackimg boot.img Done..!!!$c"
else
echo ""
rm -r .script/ramdisk
rm -r .script/split_img
mv .script/boot.img port/
mv stock/boot.img boot-stock.img
mv port/boot.img boot-port.img
rm -r stock
rm -r port
	echo -e " $r Unpack port boot error..!!$c";
fi
else
echo ""
rm -r port
	echo -e " $r no boot.img in /data/local/Auto-Tool/port....$c";
   fi
else
echo ""
rm -r .script/ramdisk
rm -r .script/split_img
mv .script/boot.img stock/
mv stock/boot.img boot-stock.img
mv port/boot.img boot-port.img
rm -r stock
rm -r port
	echo -e " $r Unpack stock boot error..!!$c";
fi
else
echo ""
rm -r stock
	echo -e " $r no boot.img in /data/local/Xenon54/stock....$c";
fi
echo ""
sleep 2
echo "$y Press Enter to manually port menu$c"
read enterKey
pause;
manually_port;
}

repack_boot()
{
clear
echo""
sleep 2
echo "$cy Repackimg boot from port folder$c"
echo ""
echo "$y Press enter Please......!!!!!$c"
read enter
clear
mv port/ramdisk .script/
mv port/split_img .script
  ./.script/repackimg.sh
  if [[ -f /data/local/Xenon54/.script/image-new.img ]]; then
  mv .script/image-new.img boot-new.img
  clear
  ./.script/cleanup.sh
  mv stock/boot.img boot-stock.img
  mv port/boot.img boot-port.img
  rm -r stock
  rm -r port
clear
echo ""
sleep 2
echo "$cy Repack boot Done...!!!$c"
else
echo ""
     rm -r .script/ramdisk
     rm -r .script/split_img
	echo -e " $r Repack  boot.img error...$c";
   fi
echo ""
sleep 2
echo "$y Press Enter to manually port menu$c"
read enterKey
pause;
manually_port;
}

unpack_recovery()
{
clear
echo""
sleep 2
echo "$cy Unpackimg recovery.img in stock folder and port folder$c"
echo ""
mkdir stock
mkdir port
ls
echo ""
echo "$y Please..!! copy the stock recovery.img put in stock folder and port folder$c"
read enter
echo "$y Press enter Please......!!!!!$c"
read enter
clear
if [[ -f /data/local/Xenon54/stock/recovery.img ]]; then
mv stock/recovery.img .script/
./.script/unpackimg.sh
if [[ -f /data/local/Xenon54/.script/ramdisk/default.prop ]]; then
mv .script/ramdisk stock/
mv .script/split_img stock/
mv .script/recovery.img stock/
clear
  if [[ -f /data/local/Xenon54/port/recovery.img ]]; then
    mv port/recovery.img .script/
    ./.script/unpackimg.sh  
    if [[ -f /data/local/Xenon54/.script/ramdisk/default.prop ]]; then
    mv .script/ramdisk port/
    mv .script/split_img port/
    mv .script/recovery.img port/  
    echo ""
    echo "$cy Unpackimg recovery.img Done..!!!$c"   
   else
echo ""
rm -r .script/ramdisk
rm -r .script/split_img
mv .script/recovery.img port/
mv stock/recovery.img recovery-stock.img
mv port/recovery.img recovery-port.img
rm -r stock
rm -r port
echo ""
	echo -e " $r Unpack stock recovery error..!!$c";
fi  
  else
  echo ""
  rm -r port
	echo -e " $r no recovery.img in /data/local/Xenon54/port....$c";
   fi   
   else
echo ""
rm -r .script/ramdisk
rm -r .script/split_img
mv .script/recovery.img stock/
mv stock/recovery.img recovery-stock.img
mv port/recovery.img recovery-port.img
rm -r stock
rm -r port
echo ""
	echo -e " $r Unpack stock recovery error..!!$c";
fi 
else
echo ""
rm -r stock
	echo -e " $r no recovery.img in /data/local/Xenon54/stock....$c";
fi
echo ""
sleep 2
echo "$y Press Enter to manually port menu$c"
read enterKey
pause;
manually_port;
}

repack_recovery()
{
clear
echo""
sleep 2
echo "$cy Repackimg recovery from port folder$c"
echo ""
echo "$y Press enter Please......!!!!!$c"
read enter
clear
mv port/ramdisk .script/
mv port/split_img .script
./.script/repackimg.sh
if [[ -f /data/local/Xenon54/.script/image-new.img ]]; then
mv .script/image-new.img recovery-new.img
clear
./.script/cleanup.sh
mv stock/recovery.img recovery-stock.img
mv port/recovery.img recovery-port.img
rm -r stock
rm -r port
clear
echo ""
sleep 2
echo "$cy Repack recovery Done...!!!$c"
else
echo ""
rm -r ramdisk
rm -r split_img
echo -e " $r Repack error..!!!$c";
fi
echo ""
sleep 2
echo "$y Press Enter to manually port menu$c"
read enterKey
pause;
manually_port;
}

flash_tool()
{
clear;
echo ""
echo -e "_____________________________________________________________";
echo -e "|                                                           |";
echo -e "|                    $y FLASH TOOLS MENU$c                  |";
echo -e "|                                                           |";
echo -e "|___________________________________________________________|";
echo ""
echo "________________________________________";
echo -e "|$y  A. FLASH BOOT 32BIT$c          |"; 
echo "_______________________________________|";
echo -e "|$cy B. FLASH BOOT 64BIT$c          |"; 
echo "_______________________________________|";
echo -e "|$y  C. FLASH RECOVERY 32BIT$c      |"; 
echo "_______________________________________|";
echo -e "|$cy D. FLASH RECOVERY 64BIT$c      |"; 
echo "_______________________________________|";
echo -e "|$y  E. BACK$c                      |";
echo "_______________________________________|";
echo ""
printf %s "Type your option [A, B, C, D, E] then press ENTER: ";
read exmenv3;
case $exmenv3 in
 a|A) flash_boot_32bit;;
 b|B) flash_boot_32bit;;
 c|C) flash_recovery_32bit;;
 d|D) flash_recovery_64bit;;
 e|E) main;;
 *) supan3;;
esac
}

flash_boot_32bit()
{
clear
echo""
echo ""
sleep 2
echo "$cy Flashing boot 32bit from /data/local/Xenon54$c"
echo ""
echo "$r              ...Warning ..!!!$c"
echo ""
echo "$cy The flash boot not from your phone stock may cause damage.$c"
echo ""
echo "$cy Are you sure? To accept the risk to occur.$c"
echo ""
echo -e "$y Y. YES$c                    "; 
echo ""
echo -e "$y N. NO$c                     ";
echo ""
printf %s "Type your option [Y / N] then press ENTER: ";
read exmenv2;
case $exmenv2 in
 y|Y) ;;
 n|N) flash_tool;;
  *) supan2;;
esac
clear
echo ""
echo ""
echo "$y Please..!! copy boot.img and rename a boot-new.img.$c"
echo ""
echo "$y And put it in /data/local/Xenon54$c"
echo ""
ls
read enter
echo "$y Press enter Please......!!!!!$c"
read enter
clear
echo ""
echo ""
sleep 2
if [[ -f /data/local/Xenon54/boot-new.img ]]; then
dd if=/data/local/Xenon54/boot-new.img of=/dev/bootimg
else
echo ""
echo ""
echo -e " $r no boot-new.img in /data/local/Xenon54/..!!!$c";
echo ""
echo "$y Press Enter to flash tool menu$c"
read enterKey
pause;
flash_tool;
fi
echo ""
sleep 2
echo "$cy Flash boot.img Done..!!$c"
echo ""
sleep 4
auto_reboot2
}

flash_boot_64bit()
{
clear
echo""
echo ""
sleep 2
echo "$cy Flashing boot 64bit from /data/local/Xenon54$c"
echo ""
echo "$r              ...Warning ..!!!$c"
echo ""
echo "$cy The flash boot not from your phone stock may cause damage.$c"
echo ""
echo "$cy Are you sure? To accept the risk to occur.$c"
echo ""
echo -e "$y Y. YES$c                    "; 
echo ""
echo -e "$y N. NO$c                     ";
echo ""
printf %s "Type your option [Y / N] then press ENTER: ";
read exmenv2;
case $exmenv2 in
 y|Y) ;;
 n|N) flash_tool;;
  *) supan2;;
esac
clear
echo ""
echo ""
echo "$y Please..!! copy boot.img and rename a boot-new.img.$c"
echo ""
echo "$y And put it in /data/local/Xenon54$c"
echo ""
ls
read enter
echo "$y Press enter Please......!!!!!$c"
read enter
clear
echo ""
echo ""
sleep 2
if [[ -f /data/local/Xenon54/boot-new.img ]]; then
dd if=/data/local/Xenon54/boot-new.img of=/dev/block/platform/mtk-msdc.0/by-name/boot
else
echo ""
echo ""
echo -e " $r no boot-new.img in /data/local/Xenon54/..!!!$c";
echo ""
echo "$y Press Enter to flash tool menu$c"
read enterKey
pause;
flash_tool;
fi
echo ""
sleep 2
echo "$cy Flash boot.img Done..!!$c"
echo ""
sleep 4
auto_reboot2
}

flash_recovery_32bit()
{
clear
echo""
echo ""
sleep 2
echo "$cy Flashing recovery 32bit from /data/local/Xenon54$c"
echo ""
echo "$r              ...Warning ..!!!$c"
echo ""
echo "$cy The flash recovery not from your phone stock may cause damage.$c"
echo ""
echo "$cy Are you sure? To accept the risk to occur.$c"
echo ""
echo -e "$y Y. YES$c                    "; 
echo ""
echo -e "$y N. NO$c                     ";
echo ""
printf %s "Type your option [Y / N] then press ENTER: ";
read exmenv2;
case $exmenv2 in
 y|Y) ;;
 n|N) flash_tool;;
  *) supan2;;
esac
clear
echo ""
echo ""
echo "$y Please..!! copy recovery.img and rename a recovery-new.img.$c"
echo ""
echo "$y And put it in /data/local/Xenon54$c"
echo ""
ls /data/local/Xenon54
read enter
echo "$y Press enter Please......!!!!!$c"
read enter
clear
echo ""
echo ""
echo "$cy Flashing recovery for 32bit..!!$c"
echo ""
if [[ -f /data/local/Xenon54/recovery-new.img ]]; then
dd if=/data/local/Xenon54/recovery-new.img of=/dev/recovery
sleep 2
else
echo ""
echo -e " $r no recovery-new.img in /data/local/Xenon54..!!!$c";
echo ""
echo "$y Press Enter to flash tool menu$c"
read enterKey
pause;
flash_tool;
fi
echo ""
sleep 2
echo "$cy Flash recovery Done..!!$c"
echo ""
sleep 4
auto_reboot1
}

flash_recovery_64bit()
{
clear
echo""
echo ""
sleep 2
echo "$cy Flashing recovery 64bit from /data/local/Xenon54$c"
echo ""
echo "$r              ...Warning ..!!!$c"
echo ""
echo "$cy The flash recovery not from your phone stock may cause damage.$c"
echo ""
echo "$cy Are you sure? To accept the risk to occur.$c"
echo ""
echo -e "$y Y. YES$c                    "; 
echo ""
echo -e "$y N. NO$c                     ";
echo ""
printf %s "Type your option [Y / N] then press ENTER: ";
read exmenv2;
case $exmenv2 in
 y|Y) ;;
 n|N) flash_tool;;
  *) supan2;;
esac
clear
echo ""
echo ""
echo "$cy Flashing recovery for 64bit..!!$c"
echo ""
if [[ -f /data/local/Xenon54/recovery-new.img ]]; then
dd if=/data/local/Xenon54/recovery-new.img of=/dev/block/platform/mtk-msdc.0/by-name/recovery
sleep 2
else
echo ""
echo -e " $r no recovery-new.img in /data/local/Xenon54..!!!$c";
echo ""
echo "$y Press Enter to flash tool menu$c"
read enterKey
pause;
flash_tool;
fi
echo ""
sleep 2
echo "$cy Flash recovery Done..!!$c"
echo ""
sleep 4
auto_reboot1
}

auto_reboot1()
{
clear
echo ""
echo ""
sleep 2
echo "$cy Auto rebooting...!!! $c"
echo ""
sleep 2
echo "$y             ...3..!!! $c"
echo ""
sleep 2
echo "$y             ...2..!!! $c"
echo ""
sleep 2
echo "$y             ...1..!!! $c"
echo ""
sleep 2
echo "$y             ...0..!!! $c"
echo ""
sleep 2
echo "$cy Reboot to recovery...!!! $c"
sleep 2
reboot recovery
}

auto_reboot2()
{
clear
echo ""
echo ""
sleep 2
echo "$cy Auto rebooting...!!! $c"
echo ""
sleep 2
echo "$y             ...3..!!! $c"
echo ""
sleep 2
echo "$y             ...2..!!! $c"
echo ""
sleep 2
echo "$y             ...1..!!! $c"
echo ""
sleep 2
echo "$y             ...0..!!! $c"
echo ""
sleep 2
echo "$cy Reboot phone...!!! $c"
sleep 2
reboot
}

help()
{
clear;
echo ""
echo -e "________________________________________________________________";
echo -e "|                       $y HOW TO USE$c                        |";
echo -e "|                   $cy Rec-Boot Boot v4.0$c                   |";
echo -e "|______________________________________________________________|";
echo ""
sleep 4
echo "$cy - Install busy box for your devices.$c"
sleep 4
echo "$cy - Rec-boot Bot supports 64/32bit. and must be android 5.0 or higher.$c"
sleep 4
echo "$cy - But can port  for all the latest android recovery.$c"
sleep 4
echo ""
echo "$y ...AUTO PORT menu...$c"
echo ""
sleep 4
echo "$y 1.) AUTO NORMAL BOOT menu$c"
sleep 4
echo "$cy Supports normal boot, cm based boot rom$c"
sleep 4
echo "$cy Stock boot.img should be placed in a folder called stock.$c"
sleep 4
echo "$cy Port boot.img should be placed in a folder called port.$c"
echo ""
sleep 4
echo "$y 2.) AUTO LOS BOOT menu$c"
sleep 4
echo "$cy Support boot as a base LOS rom$c"
sleep 4
echo "$cy Stock boot.img should be placed in a folder called stock.$c"
sleep 4
echo "$cy Port boot.img should be placed in a folder called port.$c"
echo ""
sleep 4
echo "$y 3.) AUTO TWRP 3.0.2-7 menu$c"
sleep 4
echo "$cy Stock recovery.img should be placed in a folder called stock.$c"
sleep 4
echo "$cy TWRP support all bits .$c"
sleep 4
echo "$cy Sample cpu$c"
sleep 4
echo "$cy - mt6582$c"
sleep 4
echo "$cy - mt6572$c"
sleep 4
echo "$cy - mt6592$c"
sleep 4
echo "$cy - mt6580$c"
sleep 4
echo "$cy - mt6735 (The only 32bit)$c"
echo ""
sleep 4
echo "$y ...MANUALLY PROT menu...$c"
sleep 4
echo "$cy Support all SOC,Use your Brain.$c"
sleep 4
echo "$cy 1.) UNPACK BOOT menu$c"
sleep 4
echo "$cy 2.) REPACK BOOT menu$c"
sleep 4
echo "$cy 3.) UNPACK RECOVERY menu$c"
sleep 4
echo "$cy 4.) REPACK RECOVERY menu$c"
echo ""
sleep 4
echo "$y ...FLASH TOOL menu...$c"
sleep 4
echo "$cy Supports flash boot & recovery$c"
sleep 4
echo "$cy Support 32bit$c"
sleep 4
echo "$cy Support 64bit$c"
echo ""
sleep 4
echo "$y ___________________________________________________$c"
sleep 5
clear
echo ""
echo ""
sleep 4
echo "$m          ......GOOD LUCK.....$c"
echo ""
sleep 2
echo "$y If you still don't understand, please read these note again.$c"
sleep 5
echo ""
main;
}

main()
{
clear;
echo ""
echo -e "____________________________________________________________";
echo -e "|                    $y Rec-Boot Bot $c                    |";
echo -e "|                    $cy Auto Port Tool By $c              |";
echo -e "|                      $m XenonTheInertG $c                |";
echo -e "|                   $r Stable Version V4.0  $c             |";
echo -e "|__________________________________________________________|";
echo ""
echo "_______________________________________";
echo -e "|$y    A. AUTO PORT$c              |"; 
echo "______________________________________|";
echo -e "|$cy   B. MANUALLY PORT$c          |";
echo "______________________________________|";
echo -e "|$y    C. FLASH TOOL$c             |"; 
echo "______________________________________|";
echo -e "|$cy   H. HELP$c                   |";
echo "______________________________________|";
echo -e "|$r    Q. EXIT$c                   |";
echo "______________________________________|";
echo ""
printf %s "Type your option [A, B, H, Q] then press ENTER: ";
read exmenv;
case $exmenv in
 a|A) auto_tools;;
 b|B) manually_port;;
 c|C) flash_tool;;
 h|H) help;;
 q|Q) quit;;
 *) supan;;
esac
}

{
while :
do
	main;
done
}

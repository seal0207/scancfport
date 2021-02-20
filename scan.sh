#!/bin/sh
skip=44

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -dt`
else
  gztmpdir=/tmp/gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `echo X | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  echo >&2 "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
�:�0`scan.sh �S[KA~�W�n��f�
�J��7����I�a��ݙ�B[�TkDk^�!Z����ЄF����&O���Κga9��Μ�\��yU��e��}��yꔄ�?�-�+�L��Țԧr��gB�a��;��d�Kj�D�"�a�@�$�t�DJ� ������S_i�A7?�¹�v�
�����~k�0��be@Lv�2C��I�����/t�S��jnڗMw�Ȯ��ۧ,��/��3Z�o-��r��bþ,�r+�%�d-2yҁ~P�Щ�M��BrDh��ZW[t�]ε��r��嗳N~��J+Z��2f8T�p�ߣ?�}��7���g����Uco��Y�cgA�cї�+s~�FG�X�>��MDէ�jx�L�Q5O�Bcc�0�&ɯ�ޛS��]?�W�>�G�H��ܓ5zź����N��%�����^e��A�v�6
��i���K�4(YKCP5��*��b�:R�H�2�&@̰�xm�}G"O!05Y�a&�eU~���#� 1���� �����QAuЕ0ttgA�zp
�t�9�a�����U�q`���zH��n{o0��#�"�ףf��H/���	�h�  
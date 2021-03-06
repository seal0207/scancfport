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
�9=3`scan.sh �T�OI���+��Rq��11�W�����.�uj�lw�f�ʥW�99  %�-b�p�Q
�R$�o��]>�/��lߠ�b�4��<����<3g�[����IA�q�z�G4"�%����#�C��G��ϥ�t�'[��t,C��e!1��!⁪F�dy)o��zd52
�䠾Fko������_��!�{T����c*���=.���$��Bȅt�˛��o����N��1�^?�ME����ßG��g��4]Y�K����%fl���Mg_���w۴����5!�����>^��p	��d�Ơ����{��&@���08h�:��t��!��;{&ؙd͡�CCɤp�툿�
�ͱ;���F���q:SK��ϰ>G�L�=�Am3�\m2����g��g� ���Vc-(�7��Fqs��@%���b���m#�S=����iP����������a+ p-ݴ����(+�o%>n�t�x�P�"**������=:��<����J�4�ߺ�&tk!�~���]Ә!�M��u�1��`���]�m�[�B"��Lό#6D6��i�lg�l�\/�~�>�(�5C�ڀ�2t�W��I<�޺�}P��M��{�/��IVd���4p�%���l�,���7~c���kٕk1���2ף��Ʈ?�N�ng�/��{�
$��[{`Y��O!{<��޸�Qޜ��SJ�?���qR�s)D/�Յx�;f�;+�am��4O�u�"Q���Ʈ5�?�K�����������+�H��.%C'��¶�I��D:)%�PJ�lVJdة9z��|2!%⋖hWC)_�����N��Z��C�^ 2�Ѻ�	>m"8"�!���i�b  
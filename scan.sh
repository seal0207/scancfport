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
�M71`scan.sh �T[OA~���c� ����	�$ƈ�F"o���L�v��lSK Z�p)	#	"H���A�������_pv��Z�&�9��9s�o���[�AY	�8�����9fg�ok���s%UIL���,<�x94�V5�r�!%��qX��@�y�8�� �ฃ���HaA$%T���&)�����/d�=)�S�f�`.O�?������I�����R �kE���Y\v�!q�4��>8��H~�8fo��;X+������X������˓�.����&�k�봵{@
��\����~��񂹶^WB}�\$86@�ր�zAp�l��
�Ak��"�ñpT���a��8*�����,uHe�+�ǣx��6ʥ�G�ρ36O��Z�)r��<��g�mT�1@����	���@���~��7w�{�RFK����ӝ�� ���$]��R3:�AH��x�Q��tt@_A:)�
����R�_d��1`�蠫,��1ꇮ��b<��&^��*�P�yqhaH���y�D�7im�q�e��)��6���v%Q�(���BY%���Z�nr\Bƺ���^��T5Ei�+�t��R����l������Q�Xܧ�=�v�߭P�\���Ezi��ɎH��jz]�5	�ǢR�_s����GBJ\U������H.�ݎ-�IU�Ǚ���|�ޘq5�81�8�\߲����i25�=
�֎�p����/R�@�瞆��30g���'�t�R�Y�V2)N1���)}��p>G
�/�|jU4�:n|��U����}�i����6/mZ�nP߀��Q�>Gm�8¢��
��2a�  
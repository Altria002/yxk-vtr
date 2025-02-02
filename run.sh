#!/bin/sh
skip=49

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

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
��+�bstart.sh }R�k�0���▅���R����H[R�hi���Pd%V+K�tn�����%K�/��޽��|�?��8���ca`�Y��E�&�&��ʠ�"BI��C<������.o��4�r��0&Jk�2-+T, �a'��+�B6���	�Co$U�q�ospU�� �qr%ss� ���p�̚�Z���;S�ڌ��g�0����S��6њ�+�*+�J������ �bj����8�[u�|�i���Q�z'
������^��w:���ͻ�����"8�>S�KWJK�e�KR9��4ɗ��:�Q��d՜Fm��X�{�Cw��2�s�Ժf�w���,���]��nk���;�=N�P��F%� �/�^s���7��ޯ���<	�KNl�o�XY�:]�-�
큗G)  
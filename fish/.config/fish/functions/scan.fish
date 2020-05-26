# Defined in /var/folders/13/fc5j_gys3t16cfgxvcb6187r0000gn/T//fish.Z8orH2/scan.fish @ line 2
function scan --description 'Make a pdf look like scanned' --argument filename
  if test -z $filename; or not test -f $filename
    echo "Usage: `scan filename.pdf`"
    return 1
  end

  convert -density 300 "$argv[1]" \
    -alpha Off \
    -density 300 \
    -colorspace Gray \
    -blur 0.3x0.3 \
    -rotate "0.0"(random 5 9) \
    -attenuate 0.1 +noise Multiplicative \
    -quality 60 -compress jpeg \
    "$argv[1].scanned.pdf"

  echo "[*] File $argv[1].scanned.pdf created"

  if type -q exiftool
    exiftool -ignoreMinorErrors -all:all= "$argv[1].scanned.pdf"
    exiftool -delete_original! "$argv[1].scanned.pdf"
    echo "[*] Metadata removed"

  else
    echo "[-] Install exiftool to remove metadata"
  end
end

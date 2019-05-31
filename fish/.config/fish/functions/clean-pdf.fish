function clean-pdf --argument filename --description "Convert text pdf into images pdf and strip metadata"

	if test -z $filename
		echo "Usage: clean-pdf filename.pdf"
		return 1
	end

	set -l cleanname "clean/$filename"
	mkdir -p clean; and \
	convert -density 200 "$filename" "$cleanname"; and \
	exiftool -ignoreMinorErrors -all:all= "$cleanname"; and \
	exiftool -delete_original! "$cleanname"; and \
	qpdf --linearize "$cleanname" "$cleanname.2"; and \
	mv "$cleanname.2" "$cleanname"

	if test $status -eq 0
		echo -e "\n[$cleanname created]"
		return 0
	else
		echo -e "\n[Error creating file $cleanname]"
		return 1
	end

end

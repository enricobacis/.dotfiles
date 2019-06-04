function clean-pdf --argument filename --description "Converts text pdfs into images pdfs and strips metadata"

	if test -z $filename; or not test -e $filename
		echo "Usage: `clean-pdf filename.pdf` or `clean-pdf dirname`"
		return 1
	end

	if not type -q convert
		echo "Error: convert (imagemagick) not found"
		return 1
	else if not type -q exiftool
		echo "Error: exiftool not found"
		return 1
	else if not type -q qpdf
		echo "Error: qpdf not found"
		return 1
	end

	if test -d $filename
		for f in $filename/*.pdf
			echo "Cleaning $f ..."
			clean-pdf $f
		end

	else if test -f $filename
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

	else
		echo "Error: Unrecognized file $filename"
		return 1
	end

end

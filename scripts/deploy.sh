#!/bin/bash

#aktuellen Pfad abfragen
  cd $(dirname $0)
  currentpath=$(PWD)

#aus aktuellem Pfad den Pfad des Jupyter Notebooks ableiten und dorthin wechseln
  contentpath=${currentpath/scripts/Lessons}/
  publishpath=${currentpath/scripts/content}/
  publishpath=$publishpath"post/"
  cd $contentpath

# alle html Dateien in contentpath abgehen

for file in $contentpath*.ipynb ; do
# Notebooks in html mit basistemplate umwandeln
jupyter nbconvert $file to html --template basic
done

# Datum so umformatieren, dass hugo es erkennt --> Zeitzone +0200 zu +02:00
currenttime=$(date +%Y-%m-%dT%H:%M:%S%z)
currenttime=${currenttime/0200/02:00}
currenttime=${currenttime/0100/01:00}

for file in $contentpath*.html ; do
# Achtung! Die Ableitung von $file failt, wenn die Namen der ipython Notebooks Leerzeichen enthalten
# Datum so umformatieren, dass hugo es erkennt --> Zeitzone +0200 zu +02:00
  currenttime=$(date +%Y-%m-%dT%H:%M:%S%z)
  currenttime=${currenttime/0200/02:00}
  currenttime=${currenttime/0100/01:00}

# Name der aktuellen Datei auslesen und für Titel verwenden
  currentfilename=$(basename "$file")
  currentfilename=${currentfilename/.html/}

# Name und Datum als front matter in die html-datei verschieben
  sed -iold '1i\'$'\n''+++'$'\n' $file
  sed -iold '1i\'$'\n''title = "'$currentfilename'"'$'\n' $file
  sed -iold '1i\'$'\n''draft = true'$'\n' $file
  sed -iold '1i\'$'\n''date = "'$currenttime'"'$'\n' $file
  sed -iold '1i\'$'\n''+++'$'\n' $file
# konvertierte Dateien ins Contentverzeichnis von Hugo schieben

  mv $file $publishpath
# Backupdatei löschen, die sed automatisch anlegt
  backupfile=$file"old"
  rm $backupfile
done

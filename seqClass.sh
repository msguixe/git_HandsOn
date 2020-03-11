#!/bin/bash
# This first part of the script identifies the introduced sequence as DNA or RNA sequences
seq=$1
seq=$(echo $seq | tr a-z A-Z)  # Note we just added this line
if [[ $seq =~ ^[ACGTU]+$ ]]; then
  if [[ $seq =~ T ]] && [[ $seq =~ U ]]; then
    echo "The sequence is not DNA nor DNA"
  elif [[ $seq =~ T ]]; then
    echo "The sequence is DNA"
  elif [[ $seq =~ U ]]; then
    echo "The sequence is RNA"
  else
    echo "The sequence can be DNA or RNA"
  fi
else
  echo "The sequence is not DNA nor RNA"
fi

#This second part finds a motifof interest in the introduced sequence
motif=$(echo $2 | tr a-z A-Z)
if [[ -n $motif ]]; then
  echo -en "Motif search enabled: looking for motif '$motif' in sequence '$seq'... "
  if [[ $seq =~ $motif ]]; then
    echo "FOUND_modified3"
  else
    echo "NOT FOUND_modified"
  fi
fi

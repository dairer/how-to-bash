#! /bin/bash
# itterate over a sequence
for i in $(seq 0 4); do
   echo $i
done

# itterate over a sequence with a specific step
for i in $(seq 0 0.25 1); do
   echo $i
done

# itterate over a explicit sequence
for i in here are some words; do
   echo $i
done

# itterate over a range (another possible syntax)
for i in {1..5}; do
  echo $i
done
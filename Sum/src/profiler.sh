#!/bin/bash
count=$1;
command=$2;
sum=0;
mean=0;
diff={};
scale=10;

for i in `seq 1 $count`;
do
	start=$(date +%s.%N);
	eval $command;
	end=$(date +%s.%N);

	diff[$i]=$(echo "$end - $start" | bc);
	echo "Round $i: ${diff[$i]}";
	sum=$(echo "$sum + ${diff[$i]}" | bc);
done

mean=$(echo "scale=$scale; $sum/$count.0" | bc);
std_dev=0;

for i in `seq 1 $count`;
do
	std_dev=$(echo "scale=$scale; std_dev + (${diff[$i]} - $mean)^2" | bc);
done

std_dev=$(echo "scale=$scale; sqrt($std_dev / $count.0)" | bc);

echo "Mean execution time: $mean;";
echo "Sum: $sum"; 
echo "Std Deviation: $std_dev";

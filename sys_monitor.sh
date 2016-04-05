#!/bin/bash
# -------------------------------------
# Filename:    monitor.sh
# Revision:    0.1
# Author:      Ma Shuang
# Description: 监视整个系统CPU和内存占用
# -------------------------------------

echo "TIME,CPU(used),MEM(free)" > moni.csv
while true; do
  MYTOP=`top -n 1`
  MYTIME=`echo -e "${MYTOP}" | awk 'NR==1{print $3}'`
  CPU=`echo -e "${MYTOP}" | awk 'NR==3{print $8}' | awk -F "." '{print $1}'`
  MEM=`echo -e "${MYTOP}" | awk 'NR==4{print $8}'`
  TCPU=$((100 - ${CPU}))
  echo "${MYTIME},${TCPU}%,${MEM}KB" >> moni.csv
  sleep 1
done

	
	



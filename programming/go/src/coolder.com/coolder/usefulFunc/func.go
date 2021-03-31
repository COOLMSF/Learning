package main

func AverageData(nThread int, dataArray []string) [][]string {
	resultArray := make([][]string, nThread)
	for i := 0; i < nThread; i++ {
		resultArray[i] = dataArray[(len(dataArray) / nThread) * i: (len(dataArray) / nThread) * (i + 1)]
		// Assign the left data to the last thread
		if i == nThread - 1 {
			resultArray[i] = dataArray[(len(dataArray) / nThread) * i:]
		}
	}
	return resultArray
}


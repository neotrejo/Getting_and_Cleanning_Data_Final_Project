# Code Book

This code book presents the description of the variables and data contained in 
the tidy data set.
 
The features selected for this data set come from averaged measurements of 
accelerometer and gyroscope 3-axial mead and std signals.

## Tidy Data Set File Name

"tidy_dataset.txt"

## Tidy Data Set Variables

The data of each varibale in the tidy dataset is calculated as the average of the
variables that represent the mean and std of the original measurements taken.
The computed average for each variable in the tidy data set was broken down by
subject and activity name.

### Identfier variables (Groups)

* subjectid: Test subject identifier. The measurements come from 30 test subjects. 
* activityname: Type of activity performed for the corresponding gyroscope and 
accelerometer measurements.

### Activity Labels

The following are the values the 'activityname' variable can take. 

* (1) WALKING : The measurements come from a walking test subject.
* (2) WALKING_UPSTAIRS (2): The measurements come from a test subject walking up stairs.
* (3) WALKING_DOWNSTAIRS: The measurements come from a test subject walking down stairs.
* (4) SITTING: The measurements come from a sitting test subject.
* (5) STANDING: The measurements come from a standing test subject.
* (6) LAYING: The measurements come from a lying test subject.

## Measurment Variables

The following are the variables of the tidy dataset, which were extracted
only the measurements on the mean and standard deviation for each measurement.

The names of the variables are similar to those of the raw data; however, all 
letters are lower case and any special characters and symbols were removed.
 
The variables prefixed with 'time' represent values in time domain.
The variables prefixed with 'freq' represent values in frequency domain.
 

1) 	timebodyaccmeanx 
2) 	timebodyaccmeany 
3) 	timebodyaccmeanz
4) 	timebodyaccstdx 
5) 	timebodyaccstdy 
6) 	timebodyaccstdz
7) 	timegravityaccmeanx 
8) 	timegravityaccmeany 
9) 	timegravityaccmeanz 
10) 	timegravityaccstdx 
11) 	timegravityaccstdy 
12) 	timegravityaccstdz 
13) 	timebodyaccjerkmeanx 
14) 	timebodyaccjerkmeany 
15) 	timebodyaccjerkmeanz 
16) 	timebodyaccjerkstdx 
17) 	timebodyaccjerkstdy 
18) 	timebodyaccjerkstdz 
19) 	timebodygyromeanx
20) 	timebodygyromeany 
21) 	timebodygyromeanz 
22) 	timebodygyrostdx 
23) 	timebodygyrostdy 
24) 	timebodygyrostdz 
25) 	timebodygyrojerkmeanx 
26) 	timebodygyrojerkmeany 
27) 	timebodygyrojerkmeanz 
28) 	timebodygyrojerkstdx 
29) 	timebodygyrojerkstdy 
30) 	timebodygyrojerkstdz 
31) 	timebodyaccmagmean 
32) 	timebodyaccmagstd 
33) 	timegravityaccmagmean 
34) 	timegravityaccmagstd 
35) 	timebodyaccjerkmagmean
36) 	timebodyaccjerkmagstd 
37) 	timebodygyromagmean 
38) 	timebodygyromagstd 
39) 	timebodygyrojerkmagmean 
40) 	timebodygyrojerkmagstd 
41) 	freqbodyaccmeanx 
42) 	freqbodyaccmeany 
43) 	freqbodyaccmeanz 
44) 	freqbodyaccstdx 
45) 	freqbodyaccstdy 
46) 	freqbodyaccstdz 
47) 	freqbodyaccmeanfreqx 
48) 	freqbodyaccmeanfreqy 
49) 	freqbodyaccmeanfreqz 
50) 	freqbodyaccjerkmeanx 
51) 	freqbodyaccjerkmeany 
52) 	freqbodyaccjerkmeanz 
53) 	freqbodyaccjerkstdx 
54) 	freqbodyaccjerkstdy 
55) 	freqbodyaccjerkstdz 
56) 	freqbodyaccjerkmeanfreqx 
57) 	freqbodyaccjerkmeanfreqy 
58) 	freqbodyaccjerkmeanfreqz
59) 	freqbodygyromeanx 
60) 	freqbodygyromeany 
61) 	freqbodygyromeanz 
62) 	freqbodygyrostdx 
63) 	freqbodygyrostdy 
64) 	freqbodygyrostdz 
65) 	freqbodygyromeanfreqx 
66) 	freqbodygyromeanfreqy 
67) 	freqbodygyromeanfreqz 
68) 	freqbodyaccmagmean
69) 	freqbodyaccmagstd 
70) 	freqbodyaccmagmeanfreq 
71) 	freqbodyaccjerkmagmean 
72) 	freqbodyaccjerkmagstd 
73) 	freqbodyaccjerkmagmeanfreq 
74) 	freqbodygyromagmean 
75) 	freqbodygyromagstd 
76) 	freqbodygyromagmeanfreq 
77) 	freqbodygyrojerkmagmean 
78) 	freqbodygyrojerkmagstd 
79) 	freqbodygyrojerkmagmeanfreq 
80) 	angletbodyaccmeangravity 
81) 	angletbodyaccjerkmeangravitymean 
82) 	angletbodygyromeangravitymean 
83) 	angletbodygyrojerkmeangravitymean 
84) 	anglexgravitymean 
85) 	angleygravitymean 
86) 	anglezgravitymean


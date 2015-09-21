
$ export HADOOP_CLASSPATH=${JAVA_HOME}/lib/tools.jar

$ mkdir build
$ hadoop com.sun.tools.javac.Main TitleCount.java -d build
$ jar -cvf TitleCount.jar -C build/ .


$ hadoop fs -ls /mp2/misc/
$ hadoop fs -cat /mp2/misc/stopwords.txt
$ hadoop fs -cat /mp2/misc/delimiters.txt

$ hadoop fs -ls /mp2/
$ hadoop fs -cat /mp2/titles

$ hadoop jar TitleCount.jar TitleCount -D stopwords=/mp2/misc/stopwords.txt -D delimiters=/mp2/misc/delimiters.txt /mp2/titles /mp2/A-output-test

$ hadoop fs -ls /mp2/A-output-test/
$ hadoop fs -cat /mp2/A-output-test/part-r-00000


$ hadoop fs -rm -r /mp2/A-output-test/




$ rm -fr build/*
$ hadoop fs -rm -r /mp2/B-output-test
$ hadoop com.sun.tools.javac.Main TopTitles.java -d build
$ jar -cvf TopTitles.jar -C build/ .
$ hadoop jar TopTitles.jar TopTitles -D stopwords=/mp2/misc/stopwords.txt -D delimiters=/mp2/misc/delimiters.txt -D N=5 /mp2/titles /mp2/B-output-test
$ hadoop fs -cat /mp2/B-output-test/part-r-00000



TopTitleStatistics.java

$ rm -fr build/*
$ hadoop fs -rm -r /mp2/C-output-test
$ hadoop com.sun.tools.javac.Main TopTitleStatistics.java -d build
$ jar -cvf TopTitleStatistics.jar -C build/ .
$ hadoop jar TopTitleStatistics.jar TopTitleStatistics -D stopwords=/mp2/misc/stopwords.txt -D delimiters=/mp2/misc/delimiters.txt -D N=5 /mp2/titles /mp2/C-output-test
$ hadoop fs -cat /mp2/C-output-test/part-r-00000

OrphanPages.java

$ rm -fr build/*
$ hadoop fs -rm -r /mp2/D-output-test
$ hadoop com.sun.tools.javac.Main OrphanPages.java -d build
$ jar -cvf OrphanPages.jar -C build/ .
$ hadoop jar OrphanPages.jar OrphanPages /mp2/links /mp2/D-output-test
$ hadoop fs -cat /mp2/D-output-test/part-r-00000


TopPopularLinks.java
$ rm -fr build/*
$ hadoop fs -rm -r /mp2/E-output-test
$ hadoop com.sun.tools.javac.Main TopPopularLinks.java -d build
$ jar -cvf TopPopularLinks.jar -C build/ .
$ hadoop jar TopPopularLinks.jar TopPopularLinks -D N=5 /mp2/links /mp2/E-output-test
$ hadoop fs -cat /mp2/E-output-test/part-r-00000

PopularityLeague.java
$ rm -fr build/*
$ hadoop fs -rm -r /mp2/F-output-test
$ hadoop com.sun.tools.javac.Main PopularityLeague.java -d build
$ jar -cvf PopularityLeague.jar -C build/ .
$ hadoop jar PopularityLeague.jar PopularityLeague -D league=/mp2/misc/league.txt /mp2/links /mp2/F-output-test
$ hadoop fs -cat /mp2/F-output-test/part-r-00000

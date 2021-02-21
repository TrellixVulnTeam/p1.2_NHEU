#!/bin/bash

################################################################################
##                       Cloud Computing Course                               ##
##                    Runner Script for Project 1                             ##
##                                                                            ##
##            Copyright 2018-2019: Cloud Computing Course                     ##
##                     Carnegie Mellon University                             ##
##   Unauthorized distribution of copyrighted material, including             ##
##  unauthorized peer-to-peer file sharing, may subject the students          ##
##  to the fullest extent of Carnegie Mellon University copyright policies.   ##
################################################################################

################################################################################
##                      README Before You Start                               ##
################################################################################
# Fill in the functions below for each question.
# You may use any programming language(s) in any question.
# You may use other files or scripts in these functions as long as they are in
# the submission folder.
# All files MUST include source code (e.g. do not just submit jar or pyc files).
#
# We will suggest tools or libraries in each question to enrich your learning.
# You are allowed to solve questions without the recommended tools or libraries.
#
# The colon `:` is a POSIX built-in basically equivalent to the `true` command,
# REPLACE it with your own command in each function.
# Before you fill your solution,
# DO NOT remove the colon or the function will break because the bash functions
# may not be empty!


################################################################################
##                          Setup & Cleanup                                   ##
################################################################################

setup() {
  # Fill in this helper function to do any setup if you need to.
  #
  # This function will be executed once at the beginning of the grading process.
  # Other functions may be executed repeatedly in arbitrary order.
  # Make use of this function to reduce unnecessary overhead and to make your
  # code behave consistently.
  #
  # e.g. You should compile Java code in this function.
  #
  # However, DO NOT use this function to solve any question or
  # generate any intermediate output.
  # Please DO NOT install any Python libraries in this section by
  # by running pip install or similar commands.
  #
  #
  # Standard output format:
  # No standard output needed

  # convert the notebook into an executable Python script (DO NOT remove)
  jupyter nbconvert data_analysis.ipynb --to python --TagRemovePreprocessor.remove_input_tags='{"excluded_from_script"}'
}

cleanup() {
  # Fill this helper function to clean up if you need to.
  #
  # This function will be executed once at the end of the grading process
  # Other functions might be executed repeatedly in arbitrary order.
  #
  # Examples:
  # mvn clean
  #
  # Standard output format:
  # No standard output needed
  :
}

################################################################################
##                      Remote Debugging Basics                               ##
################################################################################
# Debugging a distributed application remotely is not as straightforward as
# debugging a local application. The following questions will demonstrate some
# basic methods to search information from logs and debug remotely with GNU
# tools. Suppose the log file is obtained after enabling the log aggregation
# property in configuration.

q1() {
  # (1 points) search a substring in a file with grep
  #
  # Scenario:
  # Suppose you wrote a Java program on a Hadoop MapReduce framework but the
  # program failed with error code 1.
  # This error code indicated that your program was likely to have bugs.
  # You connected to the master core nodes, obtained the log file with
  # `yarn logs -applicationId <application_Id> > mapreduce_log`.
  #
  # Question:
  # Search the log file and print the lines that contain "Exception" as a substring.
  #
  # `grep`, named after "Global/Regular Expression/Print", prints lines that
  # contain a match for a pattern.
  # Try searching the options of GNU grep from the manual page,
  # e.g. by using grep itself: `man grep | grep recursive`.
  #
  # Now you can solve the question using:
  # grep options pattern input_file
  #
  # Standard output format:
  # <matched_line>
  # <matched_line>
  # ...
  :
}

q2() {
  # (2 points) options in grep
  #
  # Scenario:
  # A MapReduce Program, as its distributed feature, often produces duplicate
  # error messages among containers.
  # The previous solution can produce a large output as the size of the
  # logs grows, and you are more interested in unique exceptions.
  #
  # Question:
  # Print the unique exceptions in `mapreduce_log` in byte-wise order.
  # We ASSUME the exception format is a contiguous non-empty sequence of word
  # characters or dots(.), followed by exactly "Exception"
  # i.e. "(at least 1 word character or dot)Exception(a word boundary)"
  # e.g. "java.lang.NullPointerException"
  #
  # Search the options of GNU grep that:
  # 1. print only the matched parts instead of whole matching lines
  # 2. interpret the pattern as a Perl regex for additional functionality
  #
  # Here are some clues related to the syntax of regular expressions in Perl:
  # 1. find the regex operator that represents word characters, which is
  # supported by Perl regex
  # 2. explore the concept of word boundaries and find its regex operator
  #
  # Finally, sort the `grep` output by piping the StdOut to `sort` with its
  # option that indicates "unique" to remove duplicates:
  # grep options 'regex' input_file | sort options
  #
  # Standard output format:
  # <package.ExceptionName>
  # <package.ExceptionName>
  # ...
  :
}

q3() {
  # (3 points) search with context
  #
  # Scenario:
  # Among the exceptions you found, "java.lang.NullPointerException" is the most
  # likely root cause of error in MR jobs.
  # You want to look into the context, i.e. the Java stack trace.
  #
  # A stack trace is a list of the names of the classes and methods that were
  # called at the point when the exception occurred.
  #
  # For example:
  # Exception in thread "main" java.lang.NullPointerException
  # 	at INeverCareAboutEdgeCases.whyBother(INeverCareAboutEdgeCases.java:241)
  #     (tens of trace elements omitted)
  # 	at MarsClimateOrbiter.move(MarsClimateOrbiter.java:96)
  # 	at MarsClimateOrbiter.main(MarsClimateOrbiter.java:72)
  #
  # You want to find the lines containing "java.lang.NullPointerException" with
  # the trailing lines to get the full stack trace.
  #
  # Question:
  # Print the lines that contain "java.lang.NullPointerException" in the log,
  # along with the next 8 lines of trailing context after each group of matches.
  # Separate contiguous groups of matches with a line containing a group
  # separator (--).
  #
  # Search the options of GNU grep that:
  # Print N lines of trailing context after matching lines, and places a line
  # containing a group separator (--) between contiguous groups of matches.
  #
  # Standard output format:
  # <the matching line of NullPointerException>
  # <the 1st line of context>
  # <the 2nd line of context>
  # ...
  # <the 8th line of context>
  # --
  # <the matching line of NullPointerException>
  # <the 1st line of context>
  # <the 2nd line of context>
  # ...
  # <the 8th line of context>
  # ...
  :
}

################################################################################
##                           Data Analysis                                    ##
################################################################################
# The data analysis section (q4-q7) should be done in data_analysis.ipynb using 
# Jupyter notebook. Detail of the questions is provided in data_analysis.ipynb

# Note: the input file in the data analysis questions should be `mapred_output`
# for submission

################################################################################
##                    DO NOT MODIFY ANYTHING BELOW                            ##
################################################################################

q4() {
  PYTHONIOENCODING=UTF-8 python3 data_analysis.py -r q4
}

q5() {
  PYTHONIOENCODING=UTF-8 python3 data_analysis.py -r q5
}

q6() {
  PYTHONIOENCODING=UTF-8 python3 data_analysis.py -r q6
}

q7() {
  PYTHONIOENCODING=UTF-8 python3 data_analysis.py -r q7
}

declare -ar questions=( "q1" "q2" "q3" "q4" "q5" "q6" "q7" )
declare -ar mapred=( "map" "reduce" )

readonly usage="This program is used to execute your solution.
Usage:
./runner.sh to run all the questions
./runner.sh -r <question_id> to run one single question
./runner.sh -s to run setup() function
./runner.sh -c to run cleanup() function
Example:
./runner.sh -r q1 to run q1"

contains() {
  local e
  for e in "${@:2}"; do
    [[ "$e" == "$1" ]] && return 0;
  done
  return 1
}

while getopts ":hr:sc" opt; do
  case ${opt} in
    h)
      echo "$usage" >&2
      exit
    ;;
    s)
      setup
      echo "setup() function executed" >&2
      exit
    ;;
    c)
      cleanup
      echo "cleanup() function executed" >&2
      exit
    ;;
    r)
      question=$OPTARG
      if contains "$question" "${questions[@]}"; then
        answer=$("$question")
        echo -n "$answer"
      else
        if contains "$question" "${mapred[@]}"; then
          "$question"
        else
          echo "Invalid question id" >&2
          echo "$usage" >&2
          exit 2
        fi
      fi
      exit
    ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      echo "$usage" >&2
      exit 2
    ;;
  esac
done

if [ -z "$1" ]; then
  setup 1>&2
  echo "setup() function executed" >&2
  echo "The answers generated by executing your solution are: " >&2

  for question in "${questions[@]}"; do
    echo "$question:"
    result="$("$question")"
    if [[ "$result" ]]; then
      echo "$result"
    else
      echo ""
    fi
  done
  cleanup 1>&2
  echo "cleanup() function executed" >&2
  echo "If you feel these values are correct please run:" >&2
  echo "./submitter" >&2
else
  echo "Invalid usage" >&2
  echo "$usage" >&2
  exit 2
fi

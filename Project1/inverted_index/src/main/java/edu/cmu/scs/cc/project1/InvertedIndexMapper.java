package edu.cmu.scs.cc.project1;

import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.lib.input.FileSplit;

import java.io.IOException;
import java.lang.String;
import java.util.StringTokenizer;

/**
 * Mapper Utility for inverted index.
 */
public class InvertedIndexMapper
        extends Mapper<Object, Text, Text, Text> {

    /**
     * Map function for inverted index job.
     *
     * TODO: Implement the map method.
     *
     * Output (word, inputFileName) key/value pair.
     *
     * Hint:
     * StringTokenizer is faster than String.split()
     * Use getInputFileName to get the name of the input file
     *
     * @param key     input key of mapper
     * @param value   input value of mapper
     * @param context output key/value pair of mapper
     */
    public void map(Object key, Text value, Context context) throws IOException, InterruptedException {
        Text file_str = new Text(getInputFileName(context));
        StringTokenizer itr = new StringTokenizer(value.toString());

        while(itr.hasMoreTokens()) {
            value.set(itr.nextToken());
            context.write(value, file_str);
        }

    }

    /**
     * Utility method to get the input filename
     *
     * @param context the context from map function
     * @return the input file name
     */
    private String getInputFileName(Context context) {
        FileSplit fileSplit = (FileSplit) context.getInputSplit();
        return fileSplit.getPath().getName();
    }
}
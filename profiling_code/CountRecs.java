/*
Author: Diego Lopez
NetID: dtl310
Date: 09/20/2021
This file contains the Neighborhood class and main function for the WordCount MapReduce job for HW4
*/
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;

public class CountRecs {

    public static void main(String[] args) throws Exception {
        if (args.length != 2) {
            System.err.println("Usage: CountRecs <input path> <output path>");
            System.exit(-1);
        }
    
        Job job = new Job();
        job.setJarByClass(CountRecs.class);
        job.setJobName("Record Counter");
        
        FileInputFormat.addInputPath(job, new Path(args[0]));
        FileOutputFormat.setOutputPath(job, new Path(args[1]));

        job.setMapperClass(CountRecsMapper.class);
        job.setReducerClass(CountRecsReducer.class);
        
        job.setOutputKeyClass(Text.class);
        job.setOutputValueClass(IntWritable.class);
        job.setNumReduceTasks(1);
        System.exit(job.waitForCompletion(true) ? 0 : 1);
    }
}

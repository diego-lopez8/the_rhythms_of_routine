/*
Author: Diego Lopez
NetID: dtl310
Date: 09/26/2021
This file contains part 1 for HW4, the neighborhood counter mapper. 
*/
import java.io.IOException;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

public class CountRecsMapper
    extends Mapper<LongWritable, Text, Text, IntWritable> {
    @Override
    public void map(LongWritable key, Text value, Context context)
            throws IOException, InterruptedException {
		String line = value.toString();
		context.write(new Text("line"), new IntWritable(1));
    }
}

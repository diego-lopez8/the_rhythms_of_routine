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
import org.apache.hadoop.io.NullWritable;
public class CleanMapper
    extends Mapper<LongWritable, Text, Text, NullWritable> {
    private static final String DELIMETER = ",";
    
    @Override
    public void map(LongWritable key, Text value, Context context)
            throws IOException, InterruptedException {
        String line = value.toString();
        String artistID     = "";
        String artistName   = "";
        String albumID      = "";
        String trackName    = "";
        String trackID      = "";
        String albumName    = "";
        boolean albumRefsFound  = false;
        boolean albumIdFound    = false;
        boolean artistNameFound = false;
        boolean artistIdFound   = false;
        boolean insideList      = false;
        int commaCounter        = 0;
        int i                   = 0;
        while (i < line.length()) {
        // loop through the string
            if (line.substring(i, i+1).equals("[")) {
                insideList = true;
            }
            if (line.substring(i, i+1).equals("]")) {
                insideList = false;
            }
            if (insideList == false && line.substring(i, i+1).equals(",")) {
                commaCounter++;
            }
            if (commaCounter == 13) {
                i++;
                int j = i;
                while (!(line.substring(i, i+1).equals(","))) {
                    /*
                    Note: this wont work if there is a "," in the actual field itself, like the album name
                    I could instead use the ending ' as the ending character to searcch for, but this just transfers the problem
                    because the field can also have a ' in the field name as well. So I'm choosing to stick with failing the comma case
                    but either case is equally likely to cause a failure of the algorithm
                    */
                    i++;
                }
                albumID = line.substring(j,i);
                // System.out.println("AlbumID: " + albumID);
                i++;
                commaCounter++;                    
            }
            if (commaCounter == 15) {
                i++;
                int j = i;
                while (!(line.substring(i, i+1).equals(","))) {
                    i++;
                }
                albumName = line.substring(j,i);
                // System.out.println("album name: " + albumName);
                i++;
                commaCounter++;                    
            }
            if (commaCounter == 30) {
                i++;
                int j = i;
                while (!(line.substring(i, i+1).equals(","))) {
                    i++;
                }
                trackID = line.substring(j,i);
                // System.out.println("track ID: " + trackID);
                i++;
                commaCounter++;            
            }
            if (commaCounter == 32) {
                i++;
                int j = i;
                while (!(line.substring(i, i+1).equals(","))) {
                    i++;
                }
                trackName = line.substring(j,i);
                // System.out.println("track name: " + trackName);
                i++;
                commaCounter++;            
            }
            if (albumRefsFound == false && line.substring(i, i+1).equals("[")) {
            // if we enter the 10th column (artist name, artist ID, album ID)
                albumRefsFound = true;
                while (!(line.substring(i, i+1).equals("]"))) {
                    // while we are still in column 10
                    if (artistIdFound == false && line.substring(i, i+2).equals("id")) {
                        // if we see id field
                        i += 6; // looking at the first number of the id
                        int j = i;
                        while (!(line.substring(i, i+1).equals("\'"))) {
                            // find index of the end of the id
                            i++;
                        }
                        artistID = line.substring(j, i);
                        artistIdFound = true;
                        // System.out.println("artistID: " + artistID);
                    }
                    if (artistNameFound == false && line.substring(i, i+4).equals("name")) {
                        // if we see the name field
                        i += 8; // looking at the first letter of the name
                        int j = i;
                        while (!(line.substring(i, i+1).equals("\'"))) {
                            // find index of the end of the id
                            i++;
                        }
                        artistName = line.substring(j, i);
                        artistNameFound = true;
                        // System.out.println("Artist name: " + artistName);
                    }
                    i++;
                }
            }
            i++;
        }
	if (trackID.length() == 22 && albumID.length() == 22 && artistID.length() == 22) {  
        /*
        Spotify IDs are all 22 in length. If for some reason they are not length() == 22, then something messed up and we dont write the column
        If the trackID is not valid, then we cannot perform a join with the features dataset because the key is the trackID
        */
		String newLine = String.join(",", artistName, artistID, albumName, albumID, trackName, trackID);
      		context.write(new Text(newLine), NullWritable.get());
	}
    }

}

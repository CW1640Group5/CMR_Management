/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package simpleDateFormat;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author Nguyen
 */
public class demoDateFormat {

    public static void main(String[] args) {
        // (1) create a SimpleDateFormat object with the desired format.
        // this is the format/pattern we're expecting to receive.
        String expectedPattern = "MM/dd/yyyy";
//        String expectedPattern = "yyyy/MM/dd HH/mm/ss";
        SimpleDateFormat formatter = new SimpleDateFormat(expectedPattern);
        try {
            // (2) give the formatter a String that matches the SimpleDateFormat pattern
            String userInput = "09/22/2009";
            Date date = formatter.parse(userInput);

            // (3) prints out "Tue Sep 22 00:00:00 EDT 2009"
            System.out.println(date);
        } catch (ParseException e) {
            // execution will come here if the String that is given
            // does not match the expected format.
            e.printStackTrace();
        }
    }
}

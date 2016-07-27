using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/*This class is used to break down a users full name down into first name, middle initial, 
and last name. There are 3 constuctors the first creates a empty name object; the second
creates a name with a first, mi, and last name; the last creates a name with just a first 
and last name filled in.
This class has 2 functions in it a toSting that takes a Name object as a parameter. The
other is ToName that takes a string and parrses though it to generate a name.
*/
 
    public class Name
    {
        public string firstName;
        public string middleInt;
        public string lastName;
        public Name()
        {

        }
        public Name(String Fst, String Mid, String Lst)
        {
            firstName = Fst;
            middleInt = Mid;
            lastName = Lst;
        }
        public Name(String Fst, String Lst)
        {
            firstName = Fst;
            lastName = Lst;
        }
        //toString has 1 parameter a Name object and returns a string
        public override string ToString()
        {
            //The string set is used to store the three parts of the name object
            // 
            
            return firstName+" "+middleInt+" "+lastName;
        }
        //toName takes a string and breaks it down to first and last name or first and last and middle intital
        public Name toName(String fullname)
        {
            Name parsName = new Name("", "");
            int postionOfSpace, postionOfPeriod;
            string space = " ";
            string period = ".";
 
            postionOfPeriod = fullname.IndexOf(period);
            //this statement runs only if there is no Middle Initail in the string
            if (postionOfPeriod < 0)
            {
                postionOfSpace = fullname.IndexOf(space);
                parsName.firstName = fullname.Substring(0, postionOfSpace);
                parsName.lastName = fullname.Substring(postionOfSpace + 1);
                parsName.middleInt = " ";
            }
            else
            {
                postionOfSpace = fullname.IndexOf(space);
                parsName.firstName = fullname.Substring(0, postionOfSpace);
                parsName.middleInt = fullname.Substring(postionOfSpace + 1, postionOfPeriod - postionOfSpace);
                parsName.lastName = fullname.Substring(postionOfPeriod + 2);
            }

            return parsName;
        }
    }

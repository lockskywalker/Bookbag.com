using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


    /*
    phoneNumber is used for the ease of editing phone numbers limiting the ammount of characters a user can input into the txt boxs.
    phoneNumber has 2 constructors 1 empty and the other that has 3 parameters. It also has 2 functions a toString and a toPhoneNumber.
    */
    public class phoneNumber
    {
        public int areaCode;
        public int firstThree;
        public int Last;
        public phoneNumber()
        {

        }
        public phoneNumber(int AC, int FT, int LF)
        {
            areaCode = AC;
            firstThree = FT;
            Last = LF;

        }
        public override string ToString()
        {
            String contactNumber;
            contactNumber = "(" + areaCode.ToString() + ")-" +firstThree.ToString()
                + "-" + Last.ToString();
            return contactNumber;
        }

        public phoneNumber toPhoneNumber(String num)
        {
            phoneNumber Num;
            String remove = "(", remove2 = "-", remove3 = ")";
            num = num.Replace(remove, "");
            num = num.Replace(remove3, "");
            num = num.Replace(remove2, " ");

            String sub;
            int area, frst, last, pos1, pos2;
            pos1 = num.IndexOf(" ");
            pos2 = num.LastIndexOf(" ");
            sub = num.Substring(0, pos1);
            area = Convert.ToInt32(sub);
            sub = num.Substring(pos1 + 1, pos1);
            frst = Convert.ToInt32(sub);
            sub = num.Substring(pos2 + 1);
            last = Convert.ToInt32(sub);
            Num = new phoneNumber(area, frst, last);
            return Num;
        }
    }

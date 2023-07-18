// slickedit macros are programmed w/ SLICK-C language
// - SLICK-C GUIDE = https://www.slickedit.com/images/stories/product_documentation/SlickC/slick-c_guide_1202.pdf


#include "slick.sh"
_command RetainIndents() name_info(','VSARG2_MACRO|VSARG2_MARK|VSARG2_REQUIRES_MDI_EDITORCTL)
{
   // PURPOSE = from my plaintext notes, format such that I can retain the indentations when pasting into Microsoft Onenote 2013.

   _macro('R',1);
   select_all();
   replace("        ", "\t", "IUP*");                    //replaces [8x consecutive space chars] w/ [1x tab char]
   replace("- ","", "IUP*");                             //replaces [hyphen chars] w/ [space char]
   replace("^(?:[\t ]*(?:\r?\n|\r))+", "\t\n", "IUP*");  //replaces [various types of newline chars] w/ [\t\n]
   // regarding 3rd arg of replace() function, R == SlickEdit regex; P == wrap if not found)
   _message_box("DONE");
   //NOTE: saving vusrmacs.e isn't enough. must hit "F12" to load the macro before running it, otherwise it will run last version that was loaded..
   //REASON = Closing the macro window doesn't do anything special. You need to invoke load. (SlickEdit code is compiled, not interpreted.) With the CUA emulation (the default) you can invoke load by pressing F12 when the macro code is in the current buffer
}

_command RemoveDoubleLines() name_info(','VSARG2_MACRO|VSARG2_MARK|VSARG2_REQUIRES_MDI_EDITORCTL)
{
   // PURPOSE = if 2 consecutive blank lines exist in entire page of text, delete both of them.
   // I created this to clean up text copied from Excel where it inserted a ton of extra blank lines
   _macro('R',1);
   select_all();
   replace("^(?:[\t ]*(?:\r?\n|\r))+", "\t\n", "IUP*");  //replaces [various types of newline chars] w/ [\t\n]; makes all end-of-lines uniform in preparation for next step
   replace("\t\n", "", "IUP*");                          //deletes all [\t\n] 
   _message_box("DONE");
}



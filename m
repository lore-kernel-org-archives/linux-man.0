From: Jon Grant <jg-hus3n9K41k0@public.gmane.org>
Subject: Common way of explaining null-terminated strings
Date: Tue, 27 Sep 2011 21:26:56 +0100
Message-ID: <4E823190.1070100@jguk.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Michael

I noticed there are a few different ways of explaining the 
null-terminating '\0' character.  Just thinking if this could be 
standardised, and the same description of this used across all the 
string functions (and wide string):

e.g.:

http://man7.org/linux/man-pages/online/pages/man3/strnlen.3.html

"terminating '\0' character"

and also:

"if there is no '\0' character"


My opinion would be that the phrase "null terminator '\0'" could be used 
for the first mention, and then later references could just say "if 
there is no null terminator".


To give an example of a page with a different way of explaining:

http://man7.org/linux/man-pages/online/pages/man3/strncat.3.html

"plus the terminating null byte"

http://man7.org/linux/man-pages/online/pages/man3/strcpy.3.html
"including the terminating null byte ('\0')"

"If there is no null byte"

Perhaps this could even be worth adding to the overview section:
http://man7.org/linux/man-pages/online/dir_section_7.html

Let me know what you think!

Best regards, Jon
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

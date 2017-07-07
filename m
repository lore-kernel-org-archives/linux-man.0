From: Jonny Grant <jg-hus3n9K41k0@public.gmane.org>
Subject: null byte ('\0')
Date: Fri, 7 Jul 2017 14:49:14 -0700
Message-ID: <54ce3cae-59aa-50be-8698-813c194175d7@jguk.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-GB
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Michael

Could I ask to take a look at into this please.

http://man7.org/linux/man-pages/man3/printf.3.html


I saw there is a mix though the text:

null byte ('\0')
null byte


My opinion: probably the first form should be used consistent, to make 
it clear. Although it's called NUL in the ASCII set
https://en.wikipedia.org/wiki/Null_character



BUGS         top

        Because sprintf() and vsprintf()

^ Better to not use "Because" as first word of a sentence, "As" is 
suitable in this instance.


Regards, Jonny
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

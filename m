From: Jon Grant <jg-hus3n9K41k0@public.gmane.org>
Subject: index.3 wcsnlen.3  proposals
Date: Wed, 21 Sep 2011 00:03:14 +0100
Message-ID: <4E791BB2.4040809@jguk.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello

Some feedback below. Great new release!

I saw in index.3:

http://man7.org/linux/man-pages/online/pages/man3/index.3.html

Some use of "NULL" to mean the Nul terminating byte. I suggest to change 
from NULL, as that means (void*)0;

Current text:
"The terminating NULL character is considered to be a part of the strings."

Proposal:

"The terminating NUL character '\0' is considered to be a part of the 
strings. A user call with c=0 to find the end of the string."


http://man7.org/linux/man-pages/online/pages/man3/wcsnlen.3.html

I think worth clarifying "maxlen" is in wide-char units, not bytes.

Current text:

"but at most maxlen"

Proposal:
"but at most maxlen wide characters (note, this parameter is not a byte 
count)"


Best regards, Jon
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

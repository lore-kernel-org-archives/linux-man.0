From: Alain <alainb06-GANU6spQydw@public.gmane.org>
Subject: Typo in scanf
Date: Fri, 18 Nov 2011 08:43:22 +0100
Message-ID: <4EC60C9A.2030201@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

/** Sorry, sent again as mimetype plain text (1st mail rejected) **/

There is a typo in the example given under "Note" section.

Sorry I saw just now that there is a very easy way to report that by
mail... I already files the report (and details such as version used =
Ubuntu 10.04.3) here :

https://bugs.launchpad.net/ubuntu/+source/man-db/+bug/891854

Typo is:

fprintf(stderr, "No matching characters\n"):

Should be instead

fprintf(stderr, "No matching characters\n");


( ';' semicolon terminates an C instruction, and not ':' colon )

I also made a suggestion (see bug report), to change the example using
the 'm' modifier as 'a' seems rather dangerous and obsolete.
This second part is just a suggestion (subject to discussion) whereas
the typo is really there and makes compiling without errors impossible.

Best regards.
Alain BENEDETTI

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

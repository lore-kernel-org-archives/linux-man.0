From: Christophe Lohr <Christophe.Lohr-+sCGM1tQGJejRLBOWInFB+yrfmlZI2zM@public.gmane.org>
Subject: Bug about UNIX_PATH_MAX in the manpage of Unix(7)
Date: Wed, 03 Nov 2010 15:38:10 +0100
Message-ID: <4CD173D2.8020003@telecom-bretagne.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

File: /usr/share/man/man7/unix.7.gz
Version: 3.25-1
System: debian testing


Hi,
   Manpage of Unix(7) says:

---------------------------------
|    SYNOPSIS
|           #include <sys/socket.h>
|           #include <sys/un.h>
(../..)
|    DESCRIPTION
(../..)
|
|       Address Format
|           A Unix domain socket address is represented in the following 
structure:
|
|               #define UNIX_PATH_MAX    108
|
|               struct sockaddr_un {
|                   sa_family_t sun_family;               /* AF_UNIX */
|                   char        sun_path[UNIX_PATH_MAX];  /* pathname */
|               };
---------------------------------


However, UNIX_PATH_MAX is not defined in the mentioned include <sys/un.h>.
In fact, these definitions come from <linux/un.h>.

There is a confusion between the two includes (sys/un.h and linux/un.h).

Maybe they should be merged, but today it is not the case... :-(

Regards,
Christophe

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

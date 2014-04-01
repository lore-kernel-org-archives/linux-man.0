From: =?ISO-8859-1?Q?T=F6r=F6k_Edwin?= <edwin-VR+441gm9a+sTnJN9+BGXg@public.gmane.org>
Subject: manpage should say that fwrite/fread  sets errno
Date: Tue, 01 Apr 2014 21:05:25 +0300
Message-ID: <533AFFE5.4040207@etorok.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

'man 3 fwrite' doesn't say anything about errno, OTOH 'man 3p fwrite', and 'man 3 fclose' does.

The comment about 'fread'  in 'man 3 fread' could make someone believe that it doesn't set errno.

I don't know what C89 has to say about errno, hence I'm just reporting this to you without sending an actual patch.

This is manpages 3.61-1 from Debian unstable, and bottom of the manpage says it is:
GNU                                                       2012-03-30                                                 FREAD(3)

I've checked man-pages.git, and it is the same situation there.

Best regards,
--Edwin
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

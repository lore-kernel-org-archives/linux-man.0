From: Simone Piccardi <piccardi-TuvemuYfxVQ1GQ1Ptb7lUw@public.gmane.org>
Subject: times (2) man page
Date: Sun, 15 Apr 2012 18:39:27 +0200
Message-ID: <4F8AF9BF.3010007@truelite.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi, as found here:

http://www.kernel.org/doc/man-pages/online/pages/man2/times.2.html

at the end of the page, at the end of the BUGS section, there is:

The same problem can occur when the return value wraps
passed the maximum value that can be stored in clockid_t.

But the return value is defined ad clock_t. I believe is a typo, but I'd
like to be sure.

Regards
Simone
-- 
Simone Piccardi - KeyID:2A972F9D - JabberID:piccardi-TuvemuYfxVQ1GQ1Ptb7lUw@public.gmane.org
http://piccardi.gnulinux.it - http://www.fountainpen.it
Prima ti ignorano, poi ti deridono, poi ti combattono.  Poi vinci.
                                                 M. K. Ghandi
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

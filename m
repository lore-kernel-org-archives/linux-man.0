From: Simone Piccardi <piccardi-TuvemuYfxVQ1GQ1Ptb7lUw@public.gmane.org>
Subject: still on times (2) man page
Date: Sun, 15 Apr 2012 18:53:59 +0200
Message-ID: <4F8AFD27.2000004@truelite.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

I have another little issue about errors. In the RETURN VALUE section is
written:

On error, (clock_t) -1 is returned, and errno is set appropriately.

but no value for errno is specified.  From what I found digging kernel
sources the only error value returned seems to be EFAULT, if tms address
make fail copy_to_user. Should be specified?


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

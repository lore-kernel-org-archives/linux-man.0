From: Jan Engelhardt <jengelh-nopoi9nDyk+ELgA04lAiVw@public.gmane.org>
Subject: pthread_self.3: arith type or structure
Date: Fri, 6 Nov 2009 01:59:55 +0100 (CET)
Message-ID: <alpine.LSU.2.00.0911060158001.12689@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,


in man-pages 3.23, one can read in pthread_self.3:


"POSIX.1 allows an implementation wide freedom in choosing the type
used to represent a thread ID; for example, representation using
either an arithmetic type or a structure is permitted."

http://opengroup.org/onlinepubs/007908799/xsh/systypes.h.html
however mentions "all of the types are defined as arithmetic types".
Would you know which of the two documentations (linux-man-pages,
opengroup's website) is correct?

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

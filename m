From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Misspelling in pthread_getattr_np man page
Date: Thu, 9 Sep 2010 08:12:46 +0200
Message-ID: <AANLkTi=XTJDCMd4H88Rp=M31hB5x1Qov5NFCmdvZO6SK@mail.gmail.com>
References: <4B054758.8000602@ispras.ru>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=KOI8-R
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4B054758.8000602-ufN2psIa012HXe+LvDLADg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Denis Silakov <silakov-ufN2psIa012HXe+LvDLADg@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Denis

2009/11/19 Denis Silakov <silakov-ufN2psIa012HXe+LvDLADg@public.gmane.org>:
> Man pthread_getattr_np, 'CONFORMING TO' section - "... GNU extension.
> hence the ..." - replace '.' with ';' after 'extension'.

Fixed for man-pages-3.27.

> Additionally, it probably makes sense to add the sentence 'hence the
> suffix "_np" (non-portable) in the name' to
> pthread_kill_other_threads_np man page. All other mans for pthread_*_np
> functions contain this note.

Also fixed for man-pages-3.27.

Thanks,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

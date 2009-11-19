From: Denis Silakov <silakov-ufN2psIa012HXe+LvDLADg@public.gmane.org>
Subject: Misspelling in pthread_getattr_np man page
Date: Thu, 19 Nov 2009 16:25:44 +0300
Message-ID: <4B054758.8000602@ispras.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Man pthread_getattr_np, 'CONFORMING TO' section - "... GNU extension. 
hence the ..." - replace '.' with ';' after 'extension'.

Additionally, it probably makes sense to add the sentence 'hence the
suffix "_np" (non-portable) in the name' to
pthread_kill_other_threads_np man page. All other mans for pthread_*_np
functions contain this note.

-- 
Regards,
Denis.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

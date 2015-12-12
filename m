From: =?UTF-8?B?5byg5rW3?= <dreaming.in.code.zh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: rp should be ep in PTHREAD_COND_DESTROY(3P)
Date: Sat, 12 Dec 2015 17:04:42 +0800
Message-ID: <CAFwAk1pF_cfbbD_+ao6K1sqZjcVF1Ck+TB=GQmNE6tRcLozCNQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

In the EXAMPLES section of PTHREAD_COND_DESTROY(3P), there are the
following piece of code:

(A) pthread_cond_broadcast(&ep->notbusy);
    pthread_mutex_unlock(&lp->lm);
(B) pthread_cond_destroy(&rp->notbusy);

However according to the context, the rp in (B) should be ep, as in
(A), and there are no other occurrence of rp within the page. Key e
and r are close to each other anyway.

I'm referring to a man-pages 4.02-4 on Arch Linux.

(I'm sending this again because vger.kernel.org rejected my previous
email sent from Google Inbox for having HTML content which cannot be
turned off within it.)
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

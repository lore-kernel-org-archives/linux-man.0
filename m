From: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Subject: Re: [PATCH] Fix ppoll example
Date: Sun, 27 Dec 2009 01:44:22 +0100
Message-ID: <20091227004422.GA8673@basil.fritz.box>
References: <20091227004007.GA8638@basil.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20091227004007.GA8638-u0/ZJuX+froe6aEkudXLsA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Sun, Dec 27, 2009 at 01:40:07AM +0100, Andi Kleen wrote:
> 
> The ppoll replacement example gets the timeout argument
> wrong. Fix that.

Sorry, the first version was still wrong. This one
should be correct.

-Andi


--- man-pages-3.23/man2/poll.2	2009-09-30 03:36:44.000000000 +0200
+++ man-pages-3.23-hacked/man2/poll.2	2009-12-27 01:43:31.000000000 +0100
@@ -27,6 +27,7 @@
 .\" 2006-03-13, mtk, Added ppoll() + various other rewordings
 .\" 2006-07-01, mtk, Added POLLRDHUP + various other wording and
 .\"	formatting changes.
+.\" 2009-12, ak, Fix ppoll example.
 .\"
 .TH POLL 2 2009-09-15 "Linux" "Linux Programmer's Manual"
 .SH NAME
@@ -193,7 +194,7 @@
 call:
 .nf
 
-    ready = ppoll(&fds, nfds, timeout, &sigmask);
+    ready = ppoll(&fds, nfds, ts, &sigmask);
 
 .fi
 is equivalent to
@@ -204,7 +205,7 @@
     sigset_t origmask;
 
     sigprocmask(SIG_SETMASK, &sigmask, &origmask);
-    ready = poll(&fds, nfds, timeout);
+    ready = poll(&fds, nfds, ts ? ts.tv_sec : -1);
     sigprocmask(SIG_SETMASK, &origmask, NULL);
 .fi
 .PP
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

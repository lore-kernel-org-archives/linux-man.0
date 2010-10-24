From: Lucian Adrian Grijincu <lucian.grijincu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] unshare.2: Document CLONE_NEWNET
Date: Sun, 24 Oct 2010 19:06:31 +0300
Message-ID: <AANLkTi=bfGP-6tadn5GHGuz3YVyUnTLGU2A=DMp-DRYG@mail.gmail.com>
References: <1287105955-32499-1-git-send-email-lucian.grijincu@gmail.com> <AANLkTimJrGJywCSNQKuP0p_hx9icbnXGcqRr600e5SY-@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTimJrGJywCSNQKuP0p_hx9icbnXGcqRr600e5SY--JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Michael,

On Sun, Oct 24, 2010 at 5:35 PM, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8@public.gmane.org=
m> wrote:
> +Unshare the network namespace,
> +so that the calling process has a private copy of the
> +network namespace

That's not exactly right. This is not a private copy of the network
namespace, as that would mean I'd have all devices available in the
new network namespace, but changes done in my private copy will not be
visible to others. This creates a new network namespace from scratch.
You don't have anything from the old network namespace in the new one.
Even the loopback device is new.


> which is not shared with any other process.

It's not shared with previously existing processes. Child processes
will, by default, inherit the network namespace.


How does this one look?

diff --git a/man2/unshare.2 b/man2/unshare.2
index 051ebf5..49377c5 100644
--- a/man2/unshare.2
+++ b/man2/unshare.2
@@ -76,6 +76,22 @@ or umask attributes with any other process.
 or
 .BR umask (2)
 .TP
+.BR CLONE_NEWNET " (since Linux 2.6.24)
+This flag has the
+.I same
+effect as the
+.BR clone (2)
+.B CLONE_NEWNET
+flag.
+Unshare the network namespace,
+so that the calling process is moved into a
+new network namespace which is not shared
+with any previous process.
+.BR CLONE_NEWNET
+requires the
+.BR CAP_SYS_ADMIN
+capability.
+.TP
 .B CLONE_NEWNS
 .\" These flag name are inconsistent:
 .\" CLONE_NEWNS does the same thing in clone(), but CLONE_VM,

--=20
=C2=A0.
=2E.: Lucian
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

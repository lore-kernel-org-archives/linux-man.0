From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] namespaces.7: tfix
Date: Fri, 23 Sep 2016 14:30:52 +0200
Message-ID: <CAKgNAkiEWSKRXKX8s8ZxB+jBUi4hDMVxAVevGfm_tq661ZSitQ@mail.gmail.com>
References: <1474630307.2788.1.camel@redhat.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1474630307.2788.1.camel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Nikola_Forr=C3=B3?= <nforro-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 23 September 2016 at 13:31, Nikola Forr=C3=B3 <nforro-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> lsns manual page is in section 8, not 1

Thanks for the heads up Nikola

I instead applied the patch below.

Cheers,

Michael

--- a/man7/namespaces.7
+++ b/man7/namespaces.7
@@ -327,7 +327,6 @@ Namespaces are a Linux-specific feature.
 See
 .BR user_namespaces (7).
 .SH SEE ALSO
-.BR lsns (1),
 .BR nsenter (1),
 .BR readlink (1),
 .BR unshare (1),
@@ -341,4 +340,5 @@ See
 .BR credentials (7),
 .BR pid_namespaces (7),
 .BR user_namespaces (7),
+.BR lsns (8),
 .BR switch_root (8)
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

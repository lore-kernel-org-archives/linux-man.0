From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] shutdown.2: POSIX compliant since version 3.7-rc1
Date: Tue, 21 Apr 2015 15:18:16 +0200
Message-ID: <55364E18.4060005@gmail.com>
References: <CAKgNAkhO47NwYqECEiw2zap5LSzi1z-HiSja6GjSCseaP_jb2A@mail.gmail.com> <1424996516-10470-1-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1424996516-10470-1-git-send-email-saulery-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: saulery-GANU6spQydw@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello St=C3=A9phane,

On 02/27/2015 01:21 AM, saulery-GANU6spQydw@public.gmane.org wrote:
> From: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
>=20
> Synchronizing the manpage with the new POSIX compliant behavior of sh=
utdown().
> A warning message is kept to indicate possible problems with the old =
behavior
> of UNIX domain sockets.
>=20
> See bug report: https://bugzilla.kernel.org/show_bug.cgi?id=3D47111
>
> Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
> ---
>  man2/shutdown.2 | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
>=20
> diff --git a/man2/shutdown.2 b/man2/shutdown.2
> index ab39cfd..2174de3 100644
> --- a/man2/shutdown.2
> +++ b/man2/shutdown.2
> @@ -102,14 +102,11 @@ respectively, and are defined in
>  .I <sys/socket.h>
>  since glibc-2.1.91.
>  .SH BUGS
> -As currently implemented,
> -checks for the validity of
> -.I how
> -are done in domain-specific code, and not all domains perform these =
checks.
> -.\" FIXME .
> -.\" https://bugzilla.kernel.org/show_bug.cgi?id=3D47111
> -Most notably, UNIX domain sockets simply ignore invalid values;
> -this may change in the future.
> +This implementation is POSIX compliant since version 3.7-rc1. Previo=
usly, UNIX
> +domain and DECnet sockets simply ignored invalid values of
> +.IR how ,
> +due to a domain-specific code. Applications that used invalid values=
 to
> +circumvent this lack should be corrected.
>  .SH SEE ALSO
>  .BR connect (2),
>  .BR socket (2),

I think the above patch probably goes into a little too much detail.
I think few people care about DECnet these days, so I'd prefer not
to clutter the page with mention of it.

I instead applied the patch below. Thanks for spotting that this kernel
bug had been fixed!

Cheers,

Michael

--- a/man2/shutdown.2
+++ b/man2/shutdown.2
@@ -102,14 +102,16 @@ respectively, and are defined in
 .I <sys/socket.h>
 since glibc-2.1.91.
 .SH BUGS
-As currently implemented,
-checks for the validity of
+Checks for the validity of
 .I how
-are done in domain-specific code, and not all domains perform these ch=
ecks.
-.\" FIXME .
+are done in domain-specific code,
+and before Linux 3.7 not all domains performed these checks.
 .\" https://bugzilla.kernel.org/show_bug.cgi?id=3D47111
-Most notably, UNIX domain sockets simply ignore invalid values;
-this may change in the future.
+Most notably, UNIX domain sockets simply ignored invalid values.
+This problem was fixed for UNIX domain sockets
+.\" commit fc61b928dc4d72176cf4bd4d30bf1d22e599aefc
+.\" and for DECnet sockets in commit 46b66d7077b89fb4917ceef19b3f7dd86=
055c94a
+in Linux 3.7.
 .SH SEE ALSO
 .BR connect (2),
 .BR socket (2),

=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

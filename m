From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] resolver.3: RES_DEBUG not accessible with default build
Date: Tue, 5 Mar 2013 07:47:00 +0100
Message-ID: <CAKgNAki7Ro_nYc82FQaon8XREgm1Wfs+Oi7er+XdUb3H+-dPbQ@mail.gmail.com>
References: <1362437119-28677-1-git-send-email-spaillard@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1362437119-28677-1-git-send-email-spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, Mar 4, 2013 at 11:45 PM, Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wrote:
> See http://bugs.debian.org/692136
>
> For the record, it seems this has been the case in glibc since a while
> committer       Roland McGrath <roland-mXXj517/zsQ@public.gmane.org>
> Sat, 18 Feb 1995 01:27:10 +0000 (01:27 +0000)
> commit  28f540f45bbacd939bfd07f213bcad2bf730b1bf
> http://repo.or.cz/w/glibc.git/blob/28f540f45bbacd939bfd07f213bcad2bf730b1bf:/resolv/res_init.c
> ---
>  man3/resolver.3 |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/man3/resolver.3 b/man3/resolver.3
> index af532f7..390d51b 100644
> --- a/man3/resolver.3
> +++ b/man3/resolver.3
> @@ -184,7 +184,8 @@ True if
>  has been called.
>  .TP
>  .B RES_DEBUG
> -Print debugging messages.
> +Print debugging messages.  This option needs glibc to be build with debugging
> +enabled, which is not the default.
>  .TP
>  .B RES_AAONLY
>  Accept authoritative answers only.

Thanks Simon,

I've applied the patch below.

Cheers,

Michael

diff --git a/man3/resolver.3 b/man3/resolver.3
index 991b263..f659325 100644
--- a/man3/resolver.3
+++ b/man3/resolver.3
@@ -185,6 +185,10 @@ has been called.
 .TP
 .B RES_DEBUG
 Print debugging messages.
+This option is only available if glibc was built with debugging enabled,
+.\" See resolv/README.
+.\" Support for RES_DEBUG was made conditional in glibc 2.2.
+which is not the default.
 .TP
 .B RES_AAONLY
 Accept authoritative answers only.
diff --git a/man5/resolv.conf.5 b/man5/resolv.conf.5
index 9a3ca54..1358b73 100644
--- a/man5/resolv.conf.5
+++ b/man5/resolv.conf.5
@@ -133,7 +133,9 @@ where \fIoption\fP is one of the following:
 sets
 .BR RES_DEBUG
 in
-.IR _res.options .
+.IR _res.options
+(only effective if glibc was built with debug support; see
+.BR resolver (3)).
 .TP
 .BI ndots: n
 .\" Since glibc 2.2
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

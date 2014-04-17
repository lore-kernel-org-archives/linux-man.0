From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] inotify.7 exfix
Date: Thu, 17 Apr 2014 07:50:35 +0200
Message-ID: <534F6BAB.9010407@gmail.com>
References: <1397689249-2743-1-git-send-email-taffit@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1397689249-2743-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks for catching all of those, David! Applied.

Cheers,

Michael


On 04/17/2014 01:00 AM, David Pr=E9vot wrote:
> ---
>  man7/inotify.7 | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/man7/inotify.7 b/man7/inotify.7
> index 6579a59..17462c6 100644
> --- a/man7/inotify.7
> +++ b/man7/inotify.7
> @@ -416,13 +416,13 @@ and
>  Suppose an application is watching the directories
>  .I dir1
>  and
> -.IR dir ,
> +.IR dir2 ,
>  and the file
>  .IR dir1/myfile .
>  The following examples show some events that may be generated.
>  .RS 4
>  .TP
> -link("dir/myfile", "dir2/new");
> +link("dir1/myfile", "dir2/new");
>  Generates an
>  .B IN_ATTRIB
>  event for
> @@ -469,7 +469,7 @@ the following events:
>  .RS 4
>  .TP
>  unlink("dir2/yy");
> -Generates
> +Generates an
>  .BR IN_ATTRIB
>  event for
>  .IR xx
> @@ -489,7 +489,7 @@ events for
>  .IR xx ,
>  and an
>  .BR IN_DELETE
> -for
> +event for
>  .IR dir1 .
>  .RE
>  .PP
> @@ -506,7 +506,7 @@ Generates an
>  event for
>  .IR dir .
>  .TP
> -rmdir("dir/sub");
> +rmdir("dir/subdir");
>  Generates
>  .B IN_DELETE_SELF
>  and
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

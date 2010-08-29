From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] eventfd.2: correction on preserving across execve(2)
Date: Sun, 29 Aug 2010 07:35:00 +0200
Message-ID: <AANLkTimDQHFNYZybBJ8MaK1uhqfpUKFjQVgffmqg9pBq@mail.gmail.com>
References: <1282307443-28511-1-git-send-email-virtuoso@slind.org> <1282307443-28511-2-git-send-email-virtuoso@slind.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1282307443-28511-2-git-send-email-virtuoso-0lOfPCoBze7YtjvyW6yDsg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Shishkin <virtuoso-0lOfPCoBze7YtjvyW6yDsg@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Alexander,

On Fri, Aug 20, 2010 at 2:30 PM, Alexander Shishkin <virtuoso-0lOfPCoBze7YtjvyW6yDsg@public.gmane.org=
> wrote:
> Signed-off-by: Alexander Shishkin <virtuoso-0lOfPCoBze7YtjvyW6yDsg@public.gmane.org>
> ---
> =A0man2/eventfd.2 | =A0 =A05 ++++-
> =A01 files changed, 4 insertions(+), 1 deletions(-)
>
> diff --git a/man2/eventfd.2 b/man2/eventfd.2
> index 2071e48..1b4f752 100644
> --- a/man2/eventfd.2
> +++ b/man2/eventfd.2
> @@ -186,7 +186,10 @@ eventfd object.
> =A0File descriptors created by
> =A0.BR eventfd ()
> =A0are preserved across
> -.BR execve (2).
> +.BR execve (2)
> +unless
> +.BR EFD_CLOEXEC

I applied the patch, but used the words "the close-on-exec" here.


> +flag has been used.

And I changed "used" to "set".

Changes applied for man-pages 3.26.

Thanks,

Michael
> =A0.SH "RETURN VALUE"
> =A0On success,
> =A0.BR eventfd ()
> --
> 1.7.2.1.45.gb66c2
>
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

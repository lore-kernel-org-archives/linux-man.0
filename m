From: Stefan Puiu <stefan.puiu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RESEND][PATCH] sendfile.2: Fix description of the out_fd
Date: Fri, 16 Sep 2011 09:24:17 +0300
Message-ID: <CACKs7VDNboqj7XFSkwfzBMazzhSbGGTjt6+M642CgLk5UofXVw@mail.gmail.com>
References: <4D771705.1020408@rs.jp.nec.com>
	<CAKgNAkiSkgjEKDwk6R6RPhGDfJayXZGnxrfRVFcQ9t7K_S3eZQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkiSkgjEKDwk6R6RPhGDfJayXZGnxrfRVFcQ9t7K_S3eZQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Akira Fujita <a-fujita-cUW4a6blu5N8UrSeD/g0lQ@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

HI,

On Sun, Sep 11, 2011 at 7:00 PM, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8@public.gmane.org=
m> wrote:
[...]
>
> For 3.33 I applied a slightly modified version of you patch; see belo=
w.
>
> Cheers,
>
> Michael
>
> --- a/man2/sendfile.2
> +++ b/man2/sendfile.2
> @@ -92,10 +92,14 @@ The
> =A0argument must correspond to a file which supports
> =A0.BR mmap (2)-like
> =A0operations
> -(i.e., it cannot be a socket);
> -and
> +(i.e., it cannot be a socket).
> +In Linux kernels before 2.6.33,
> =A0.I out_fd
> =A0must refer to a socket.
> +Since Linux 2.6.33 it can be any file.
> +If it is a regular file, then
> +.BR sendfile()
> +changes the file offset offset appropriately.

You wrote 'offset' twice here, I guess it's a typo, unless I'm missing
something...

Thanks,
Stefan.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

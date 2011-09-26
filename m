From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Typo in hsearch.3
Date: Mon, 26 Sep 2011 19:30:53 +0200
Message-ID: <CAKgNAki6CtmmhQsZHoj-t=Tf6UHTLMR+UBhzhWBj7adN2q3LNA@mail.gmail.com>
References: <CAMqf4EHJgM7Usuirj3P86TLgFVXKv8QMRf9CHf5coTT182b3mQ@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMqf4EHJgM7Usuirj3P86TLgFVXKv8QMRf9CHf5coTT182b3mQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "D. Barbier" <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Denis,

On Sun, Sep 25, 2011 at 10:23 PM, D. Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hello Michael,
>
> Here is a patch against current master.

Thanks.

Applied for 3.35.

Cheers,

Michael


> diff --git a/man3/hsearch.3 b/man3/hsearch.3
> index 2fef68d..a939b46 100644
> --- a/man3/hsearch.3
> +++ b/man3/hsearch.3
> @@ -247,7 +247,7 @@
> =A0The
> =A0.BR hdestroy ()
> =A0and
> -.BR hdestroy _r ()
> +.BR hdestroy_r ()
> =A0functions do not free the buffers pointed to by the
> =A0.I key
> =A0and
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

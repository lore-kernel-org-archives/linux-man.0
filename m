From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: rp should be ep in PTHREAD_COND_DESTROY(3P)
Date: Sat, 26 Dec 2015 08:46:58 +0100
Message-ID: <567E45F2.4080403@gmail.com>
References: <CAFwAk1pF_cfbbD_+ao6K1sqZjcVF1Ck+TB=GQmNE6tRcLozCNQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAFwAk1pF_cfbbD_+ao6K1sqZjcVF1Ck+TB=GQmNE6tRcLozCNQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?5byg5rW3?= <dreaming.in.code.zh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 12/12/2015 10:04 AM, =E5=BC=A0=E6=B5=B7 wrote:
> In the EXAMPLES section of PTHREAD_COND_DESTROY(3P), there are the
> following piece of code:
>=20
> (A) pthread_cond_broadcast(&ep->notbusy);
>     pthread_mutex_unlock(&lp->lm);
> (B) pthread_cond_destroy(&rp->notbusy);
>=20
> However according to the context, the rp in (B) should be ep, as in
> (A), and there are no other occurrence of rp within the page. Key e
> and r are close to each other anyway.
>=20
> I'm referring to a man-pages 4.02-4 on Arch Linux.
>=20
> (I'm sending this again because vger.kernel.org rejected my previous
> email sent from Google Inbox for having HTML content which cannot be
> turned off within it.)

Thanks. This is a bug in the text of the standard, which apparently
has already been fixed:

http://austingroupbugs.net/view.php?id=3D910

I probably won't fix this page, but one day in the future we'll=20
upgrade the 3p pages to latest version from The Open Group.

Thanks,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

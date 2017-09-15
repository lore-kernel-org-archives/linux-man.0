From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Web repository still contains old pages deleted from upstream
Date: Fri, 15 Sep 2017 14:35:26 +0200
Message-ID: <CAKgNAkhc5pbu7mRF733MirwH2uF8wUb98WvW3tFJpSEq256=2w@mail.gmail.com>
References: <20170908221850.GK3633@jlknb>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170908221850.GK3633@jlknb>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Jakub_Klinkovsk=C3=BD?= <j.l.k-KK0ffGbhmjU@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Jakub,

On 9 September 2017 at 00:18, Jakub Klinkovsk=C3=BD <j.l.k-KK0ffGbhmjU@public.gmane.org> wrote:
> For example, console(4) was deleted from upstream in March 2016 [1], but =
it
> is still available [2] and its colophon section says that it comes from
> version 4.05 (the last before it was deleted). On the other hand,
> console_codes(4) has the same upstream and its colophon section says that
> it comes from the 4.12 version. So pages seem to be updated correctly, bu=
t
> deletions are not propagated to the web repository.
>
> [1] https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/commit/?i=
d=3D0f9e6478e403b26c24ecaa6761bc53d05cf04265
> [2] http://man7.org/linux/man-pages/man4/console.4.html
> [3] http://man7.org/linux/man-pages/man4/console_codes.4.html

Thanks for the note. This problem is fixed now.

Cheers,

Michael

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

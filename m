From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Manpage typo in posix_spawn(3)
Date: Fri, 3 Mar 2017 15:43:53 +0100
Message-ID: <CAKgNAkh8NBfKy4sLEL+AD6=DU2ZZmrfLM9Ts2Ktic7Ez+Mj4OA@mail.gmail.com>
References: <CAJYtZH=ZFuOuyBX2NDz4XNKuLe=8DDNf4Rnh3YrrwtMnsD8vKA@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAJYtZH=ZFuOuyBX2NDz4XNKuLe=8DDNf4Rnh3YrrwtMnsD8vKA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Fee <paul.f.fee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Paul,

On 3 March 2017 at 14:00, Paul Fee <paul.f.fee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi Michael and co.
>
> http://man7.org/linux/man-pages/man3/posix_spawn.3.html
>
> Same results on Fedora 25, man-pages-4.06-4.fc25.noarch.
>
>
> Current text:
> For the remainder of this page, the discussion is phrased in terms of
> posix_spawn(), with the
> understanding that posix_spawn() differs only on the point just described.
>
> I suspect the second reference to posix_spawn() should instead be to
> posix_spawnp().
>
> Suggested text:
> For the remainder of this page, the discussion is phrased in terms of
> posix_spawn(), with the
> understanding that posix_spawnp() differs only on the point just described.

Thanks! Fixed now.

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

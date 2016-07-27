From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Typo in cgroups(7)
Date: Wed, 27 Jul 2016 14:36:26 +0200
Message-ID: <CAKgNAki4FSYwkKdrm5KOCNccNrWUArR_HSKQ4ZDx5pZV81ygiw@mail.gmail.com>
References: <5797D557.9020608@blackhillsinfosec.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5797D557.9020608-K1x14pM+r/KyE3HCFnH8D3xStJ4P+DSV@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: logan <logan-K1x14pM+r/KyE3HCFnH8D3xStJ4P+DSV@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Logan,

On 26 July 2016 at 23:25, logan <logan-K1x14pM+r/KyE3HCFnH8D3xStJ4P+DSV@public.gmane.org> wrote:
> There is a small typo in cgroups(7)
>
> Under Tasks versus processes:
>
> "In cgroups v1, it is possible independently manipulate the cgroup
> memberships of the tasks in a process."
>
> This should read
>
> "In cgroups v1, it is possible *to* independently manipulate the cgroup
> memberships of the tasks in a process."

Thanks! Fixed.

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

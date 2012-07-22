From: Sean Silva <silvas-olO2ZdjDehc3uPMLIKxrzw@public.gmane.org>
Subject: Re: mount(2): MS_SLAVE et al missing
Date: Sun, 22 Jul 2012 16:05:03 -0600
Message-ID: <CAHnXoanRUtAaN2mmFCXt2qZY5ZOp5W4UaDhZ13DEaqXBPYy47g@mail.gmail.com>
References: <CAHnXoamKU2ds7kv7Ffn8fQ_XHxS4u_ub_nPW=UJZ=GXvq8xAtQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAHnXoamKU2ds7kv7Ffn8fQ_XHxS4u_ub_nPW=UJZ=GXvq8xAtQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

s/mount(1)/mount(8)/. I thought "command line utility" and typed 1.

--Sean Silva

On Sun, Jul 22, 2012 at 4:01 PM, Sean Silva <silvas-olO2ZdjDehc3uPMLIKxrzw@public.gmane.org> wrote:
> Hi, I saw MS_SLAVE used in the source code of systemd, but I couldn't
> find information about it in the manpage for mount(2).
>
> The mount(1) manpage does point to
> `Documentation/filesystems/sharedsubtree.txt` which describes it
> (although doesn't explicitly mention MS_SLAVE).
>
> After a bit of digging, it seems that MS_SLAVE is one of four related
> flags which also include MS_SLAVE, MS_PRIVATE, and MS_UNBINDABLE which
> are also missing.
>
> Manpage version is 3.35 according to the colophon. On Ubuntu Precise.
> Online versions seem to be missing a description for this flag as
> well.
>
> Thanks for your time,
> --Sean Silva
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

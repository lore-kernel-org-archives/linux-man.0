From: Nikolaus Rath <Nikolaus-BTH8mxji4b0@public.gmane.org>
Subject: Re: [PATCH] fuse.4: Add new file describing /dev/fuse
Date: Sat, 10 Dec 2016 13:13:45 -0800
Message-ID: <87vaurbi7q.fsf@vostro.rath.org>
References: <20161210072018.GA5267@juliacomputing.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161210072018.GA5267-9DCaDmOhoh+8M3too/+dENBPR1lH4CV8@public.gmane.org> (Keno Fischer's
        message of "Sat, 10 Dec 2016 02:20:18 -0500")
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Keno Fischer <keno-9DCaDmOhoh+8M3too/+dENBPR1lH4CV8@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Miklos Szeredi <miklos-sUDqSbJrdHQHWmgEVkV9KA@public.gmane.org>, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

On Dec 10 2016, Keno Fischer <keno-9DCaDmOhoh+8M3too/+dENBPR1lH4CV8@public.gmane.org> wrote:
> This is my writeup of a basic description of /dev/fuse after playing with
> it for a few hours today. It is of course woefully incomplete, and since
> I neither have a use case nor am working on this code, I will not be
> in a position to expand it in the near future. However, I'm hoping this
> could still serve as a handy reference for others looking at this interfa=
ce.

That's great! It makes me wonder:

At the moment, libfuse ships a mount.fuse(8) manpage that documents both
the mount options that can be passed to the kernel, and the pseudo-mount
options that can be used when using libfuse (but that are actually
implemented in userspace).

Would it make sense to remove everything kernel related from
mount.fuse(8) and move it into linux-manpages?

Here's the manpage I'm talking about:
https://github.com/libfuse/libfuse/blob/master/doc/mount.fuse.8

Best,
-Nikolaus

--=20
GPG encrypted emails preferred. Key id: 0xD113FCAC3C4E599F
Fingerprint: ED31 791B 2C5C 1613 AF38 8B8A D113 FCAC 3C4E 599F

             =C2=BBTime flies like an arrow, fruit flies like a Banana.=C2=
=AB
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

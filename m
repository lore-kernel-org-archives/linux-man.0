From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: fcntl(2) error: pipe-size-max vs pipe-max-size
Date: Sat, 24 Mar 2012 16:24:47 +1300
Message-ID: <CAKgNAkg1-0N3Za_VLJdpOG-QXw9z2tOW+ytYtCaRqSh6ka-7mg@mail.gmail.com>
References: <20120214000441.GF15858@flim.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120214000441.GF15858-QufbIeIr5AY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthew Gregan <kinetik-QufbIeIr5AY@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Matthew,

On Tue, Feb 14, 2012 at 1:04 PM, Matthew Gregan <kinetik-QufbIeIr5AY@public.gmane.org> wrot=
e:
> Hi,
>
> In the man page for fcntl(2), within the paragraph discussing F_SETPI=
PE_SZ,
> it is claimed that the maximum size for a pipe is determined by the v=
alue of
> /proc/sys/fs/pipe-size-max. =A0The proc path is incorrect--on my curr=
ent
> machine (2.6.35.14-106.fc14.x86_64) and in the latest kernel source
> (http://git.kernel.org/?p=3Dlinux/kernel/git/torvalds/linux-2.6.git;a=
=3Dblob;f=3Dkernel/sysctl.c;h=3Df487f257e05e4f1dc8836ded96ca36556b04870=
6;hb=3DHEAD#l1523),
> the proc path is /proc/sys/fs/pipe-max-size.

Thanks for the report. Of course you are right, and this is fixed for
man-pages-3.38.

Cheers,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

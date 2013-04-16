From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] man2 : syscall.2 : document syscall calling conventions
Date: Tue, 16 Apr 2013 08:01:25 +0200
Message-ID: <CAKgNAkgmD7DQ61QLVS2TDgtu=uBoczJLpE34G29wv3BVLSmi-A@mail.gmail.com>
References: <1364361092-5948-1-git-send-email-ch0.han@lge.com>
 <BLU0-SMTP986B123D17DB8B88214F797C40@phx.gbl> <CAKgNAkhv6tovvnucoofDR-eOe4H7xeFZDam9+iaVVndEqbuoXg@mail.gmail.com>
 <201304112140.18506.vapier@gentoo.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201304112140.18506.vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Fri, Apr 12, 2013 at 3:40 AM, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wrote:
> On Monday 08 April 2013 05:20:07 Michael Kerrisk (man-pages) wrote:
>>        arch/ABI   instruction          syscall #   retval  Notes
>
> i was thinking it also might be useful to mention the register where the
> syscall # is kept for syscall_restart, but we can do that in a follow up

That sounds like a useful addition! Yu can see the current version of
the page in Git. Further patches welcome...

>>        ia64       break 0x100000       r15         r10/r8C
>
> looks like you added a typo :).  it's "r8", not "r8C".

Fixed.

Cheers,

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

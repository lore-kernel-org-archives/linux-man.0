From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] prctl: Add PR_SET_MM option description
Date: Sun, 15 Apr 2012 22:13:51 +1200
Message-ID: <CAKgNAkjMpjmKCD3oQa7qTeH5gXydDgMj5TjmKKtyXYzV9f--fA@mail.gmail.com>
References: <1330518197-12825-1-git-send-email-gorcunov@openvz.org>
 <1330518197-12825-2-git-send-email-gorcunov@openvz.org> <CAKgNAkgwapZXw5gR_sSGyfufybY52S4qD1MjPDKs+6tBcgFJUg@mail.gmail.com>
 <20120415065401.GA25380@moon>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120415065401.GA25380@moon>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Cyrill Gorcunov <gorcunov-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
Cc: Pavel Emelyanov <xemul-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Sun, Apr 15, 2012 at 6:54 PM, Cyrill Gorcunov <gorcunov-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org> =
wrote:
> On Sun, Apr 15, 2012 at 03:48:18PM +1200, Michael Kerrisk (man-pages)=
 wrote:
>> Cyrill,
>>
>> While reviewing your patch to the prctl() manual page, I noticed the
>> following code inkernel/sys.c::prctl_set_mm():
>>
>> =A0 =A0 =A0 =A0 if (opt !=3D PR_SET_MM_START_BRK && opt !=3D PR_SET_=
MM_BRK) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* It must be existing VMA */
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!vma || vma->vm_start > addr)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out;
>> =A0 =A0 =A0 =A0 }
>>
>> At this point, the code causes an exit with error set to zero (i.e.,
>> success). This looks unintended to me. Is the code correct? I suspec=
t
>> a return of -EFAULT or -ENOMEM is warranted.
>
> Hi Michael, yup, -EINVAL escaped (I think EFAULT or ENOMEM is not rea=
lly
> good here). I'll fix and send update. Thanks!

=46or what it's worth (I am no expert), it looks to me as though EFAULT
or ENOMEM is more usual after a failed find_vma(). Furthermore, EINVAL
is already heavily used, so not very informative as an error.

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

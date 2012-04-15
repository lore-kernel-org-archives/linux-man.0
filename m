From: Cyrill Gorcunov <gorcunov-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] prctl: Add PR_SET_MM option description
Date: Mon, 16 Apr 2012 02:10:28 +0400
Message-ID: <20120415221028.GE25380@moon>
References: <1330518197-12825-1-git-send-email-gorcunov@openvz.org>
 <1330518197-12825-2-git-send-email-gorcunov@openvz.org>
 <CAKgNAkgwapZXw5gR_sSGyfufybY52S4qD1MjPDKs+6tBcgFJUg@mail.gmail.com>
 <20120415065401.GA25380@moon>
 <CAKgNAkjMpjmKCD3oQa7qTeH5gXydDgMj5TjmKKtyXYzV9f--fA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAkjMpjmKCD3oQa7qTeH5gXydDgMj5TjmKKtyXYzV9f--fA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Pavel Emelyanov <xemul-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Sun, Apr 15, 2012 at 10:13:51PM +1200, Michael Kerrisk (man-pages) w=
rote:
> On Sun, Apr 15, 2012 at 6:54 PM, Cyrill Gorcunov <gorcunov-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org=
> wrote:
> > On Sun, Apr 15, 2012 at 03:48:18PM +1200, Michael Kerrisk (man-page=
s) wrote:
> >> Cyrill,
> >>
> >> While reviewing your patch to the prctl() manual page, I noticed t=
he
> >> following code inkernel/sys.c::prctl_set_mm():
> >>
> >> =A0 =A0 =A0 =A0 if (opt !=3D PR_SET_MM_START_BRK && opt !=3D PR_SE=
T_MM_BRK) {
> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* It must be existing VMA */
> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!vma || vma->vm_start > addr)
> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out;
> >> =A0 =A0 =A0 =A0 }
> >>
> >> At this point, the code causes an exit with error set to zero (i.e=
=2E,
> >> success). This looks unintended to me. Is the code correct? I susp=
ect
> >> a return of -EFAULT or -ENOMEM is warranted.
> >
> > Hi Michael, yup, -EINVAL escaped (I think EFAULT or ENOMEM is not r=
eally
> > good here). I'll fix and send update. Thanks!
>=20
> For what it's worth (I am no expert), it looks to me as though EFAULT
> or ENOMEM is more usual after a failed find_vma(). Furthermore, EINVA=
L
> is already heavily used, so not very informative as an error.

Would not ENOMEM be decoded by glibc as "no-memory" usually associated
with lack of free memory?

You know, I'm starting to think this checks for existing vmas might be
redundant completely. I tried to make this prctl codes to look somehow
close to elf loading procedure, where start|end_code/data do correspond
vmas loaded by kernel while parsing pt-load sections, but now I think
this is not needed, because start|end_code/data is not changed after
file is loaded but when we do checkpoint (and then restore) the program
map might be seriously changed (the program may unmap original areas,al=
ocate
new vmas, put there code/data or whatever) thus there might be no corre=
spond
vma at all when we setup this addresses for memory map (if only I'm not
missing something). So I guess I could drop this "existing vmas"
requirements. Need to think more :)

	Cyrill
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: pivot_root(".", ".") and the fchdir() dance
Date: Tue, 6 Aug 2019 14:03:13 +0200
Message-ID: <CAKgNAkjS+x7aMVUiVSgCRwgi8rnukqJv=svtTARE-tt-oxQxWw@mail.gmail.com>
References: <CAKgNAki0bR5zZr+kp_xjq+bNUky6-F+s2ep+jnR0YrjHhNMB1g@mail.gmail.com>
 <20190805103630.tu4kytsbi5evfrhi@mikami> <3a96c631-6595-b75e-f6a7-db703bf89bcf@gmail.com>
 <da747415-4c7a-f931-6f2e-2962da63c161@philippwendler.de>
Reply-To: mtk.manpages@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <da747415-4c7a-f931-6f2e-2962da63c161@philippwendler.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Wendler <ml@philippwendler.de>
Cc: Aleksa Sarai <asarai@suse.de>, linux-man <linux-man@vger.kernel.org>, Containers <containers@lists.linux-foundation.org>, lkml <linux-kernel@vger.kernel.org>, Andy Lutomirski <luto@amacapital.net>, Jordan Ogas <jogas@lanl.gov>, werner@almesberger.net, Al Viro <viro@ftp.linux.org.uk>
List-Id: linux-man@vger.kernel.org

Hello Philipp,

On Tue, 6 Aug 2019 at 10:12, Philipp Wendler <ml@philippwendler.de> wrote:
>
> Hello Michael, hello Aleksa,
>
> Am 05.08.19 um 14:29 schrieb Michael Kerrisk (man-pages):
>
> > On 8/5/19 12:36 PM, Aleksa Sarai wrote:
> >> On 2019-08-01, Michael Kerrisk (man-pages) <mtk.manpages@gmail.com> wrote:
> >>> I'd like to add some documentation about the pivot_root(".", ".")
> >>> idea, but I have a doubt/question. In the lxc_pivot_root() code we
> >>> have these steps
> >>>
> >>>         oldroot = open("/", O_DIRECTORY | O_RDONLY | O_CLOEXEC);
> >>>         newroot = open(rootfs, O_DIRECTORY | O_RDONLY | O_CLOEXEC);
> >>>
> >>>         fchdir(newroot);
> >>>         pivot_root(".", ".");
> >>>
> >>>         fchdir(oldroot);      // ****
> >>>
> >>>         mount("", ".", "", MS_SLAVE | MS_REC, NULL);
> >>>         umount2(".", MNT_DETACH);
> >>
> >>>         fchdir(newroot);      // ****
> >>
> >> And this one is required because we are in @oldroot at this point, due
> >> to the first fchdir(2). If we don't have the first one, then switching
> >> from "." to "/" in the mount/umount2 calls should fix the issue.
> >
> > See my notes above for why I therefore think that the second fchdir()
> > is also not needed (and therefore why switching from "." to "/" in the
> > mount()/umount2() calls is unnecessary.
> >
> > Do you agree with my analysis?
>
> If both the second and third fchdir are not required,
> then we do not need to bother with file descriptors at all, right?

Exactly.

> Indeed, my tests show that the following seems to work fine:
>
> chdir(rootfs)
> pivot_root(".", ".")
> umount2(".", MNT_DETACH)

Thanks for the confirmation, That's also exactly what I tested.

> I tested that with my own tool[1] that uses user namespaces and marks
> everything MS_PRIVATE before, so I do not need the mount(MS_SLAVE) here.
>
> And it works the same with both umount2("/") and umount2(".").

Yes.

> Did I overlook something that makes the file descriptors required?

No.

> If not, wouldn't the above snippet make sense as example in the man page?

I have exactly that snippet in a pending change for the manual page :-).

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/

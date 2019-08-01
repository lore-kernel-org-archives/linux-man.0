From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: pivot_root(".", ".") and the fchdir() dance
Date: Thu, 1 Aug 2019 15:38:54 +0200
Message-ID: <CAKgNAki0bR5zZr+kp_xjq+bNUky6-F+s2ep+jnR0YrjHhNMB1g@mail.gmail.com>
Reply-To: mtk.manpages@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Serge E. Hallyn" <serge@hallyn.com>
Cc: Andy Lutomirski <luto@amacapital.net>, Containers <containers@lists.linux-foundation.org>, =?UTF-8?Q?St=C3=A9phane_Graber?= <stgraber@ubuntu.com>, Christian Brauner <christian@brauner.io>, Al Viro <viro@ftp.linux.org.uk>, lkml <linux-kernel@vger.kernel.org>, linux-man <linux-man@vger.kernel.org>, Jordan Ogas <jogas@lanl.gov>
List-Id: linux-man@vger.kernel.org

Hi Serge, Andy, et al,

I've been looking at doing some updates for the rather inaccurate
pivot_root(2) manual page, and I noticed this 2014 commit in LXC

[[commit 2d489f9e87fa0cccd8a1762680a43eeff2fe1b6e
Author: Serge Hallyn <serge.hallyn@ubuntu.com>
Date:   Sat Sep 20 03:15:44 2014 +0000

    pivot_root: switch to a new mechanism (v2)

    This idea came from Andy Lutomirski.  Instead of using a
    temporary directory for the pivot_root put-old, use "." both
    for new-root and old-root.  Then fchdir into the old root
    temporarily in order to unmount the old-root, and finally
    chdir back into our '/'.
]]

I'd like to add some documentation about the pivot_root(".", ".")
idea, but I have a doubt/question. In the lxc_pivot_root() code we
have these steps

        oldroot = open("/", O_DIRECTORY | O_RDONLY | O_CLOEXEC);
        newroot = open(rootfs, O_DIRECTORY | O_RDONLY | O_CLOEXEC);

        fchdir(newroot);
        pivot_root(".", ".");

        fchdir(oldroot);      // ****

        mount("", ".", "", MS_SLAVE | MS_REC, NULL);
        umount2(".", MNT_DETACH);

        fchdir(newroot);      // ****

My question: are the two fchdir() calls marked "****" really
necessary? I suspect not. My reasoning:
1. By this point, both the CWD and root dir of the calling process are
in newroot (and so do not keep newroot busy, and thus don't prevent
the unmount).
2. After the pivot_root() operation, there are two mount points
stacked at "/": oldroot and newroot, with oldroot a child mount
stacked on top of newroot (I did some experiments to verify that this
is so, by examination of /proc/self/mountinfo).
3. The umount(".") operation unmounts the topmost mount from the pair
of mounts stacked at "/".

At least, in some separate tests that I've done, things seem to work
as I describe above without the use of the marked fchdir() calls. (My
tests omit the mount(MS_SLAVE) piece, since in my tests I do a
more-or-less equivalent step at an earlier point.

Am I missing something?

Thanks,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/

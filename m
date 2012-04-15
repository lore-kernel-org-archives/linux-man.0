From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: [PATCH 1/2] prctl: Add PR_SET_MM option description
Date: Sun, 15 Apr 2012 15:48:18 +1200
Message-ID: <CAKgNAkgwapZXw5gR_sSGyfufybY52S4qD1MjPDKs+6tBcgFJUg@mail.gmail.com>
References: <1330518197-12825-1-git-send-email-gorcunov@openvz.org> <1330518197-12825-2-git-send-email-gorcunov@openvz.org>
Reply-To: mtk.manpages@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1330518197-12825-2-git-send-email-gorcunov@openvz.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Cyrill Gorcunov <gorcunov@openvz.org>
Cc: Pavel Emelyanov <xemul@parallels.com>, linux-man@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Tejun Heo <tj@kernel.org>
List-Id: linux-man@vger.kernel.org

Cyrill,

While reviewing your patch to the prctl() manual page, I noticed the
following code inkernel/sys.c::prctl_set_mm():

        if (opt != PR_SET_MM_START_BRK && opt != PR_SET_MM_BRK) {
                /* It must be existing VMA */
                if (!vma || vma->vm_start > addr)
                        goto out;
        }

At this point, the code causes an exit with error set to zero (i.e.,
success). This looks unintended to me. Is the code correct? I suspect
a return of -EFAULT or -ENOMEM is warranted.

Cheers,

Michael
-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/

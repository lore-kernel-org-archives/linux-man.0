From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Bad error return after find_vma() in PR_SET_MM code
Date: Sun, 15 Apr 2012 16:00:17 +1200
Message-ID: <CAKgNAkjWdy_SYaJsNXUOv7cNL2xwZNW7FCdRsT6wiRFb0dmetw@mail.gmail.com>
Reply-To: mtk.manpages@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Cyrill Gorcunov <gorcunov@openvz.org>
Cc: Pavel Emelyanov <xemul@parallels.com>, linux-man@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@osdl.org>, Michael Kerrisk <mtk.manpages@gmail.com>
List-Id: linux-man@vger.kernel.org

[Bother! Resending with corrected subject line (was "[PATCH 1/2]
prctl: Add PR_SET_MM option description")]

Cyrill,

While reviewing your patch to the prctl() manual page, I noticed the
following code in kernel/sys.c::prctl_set_mm():

=A0 =A0 =A0 =A0if (opt !=3D PR_SET_MM_START_BRK && opt !=3D PR_SET_MM_B=
RK) {
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* It must be existing VMA */
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (!vma || vma->vm_start > addr)
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto out;
=A0 =A0 =A0 =A0}

At this point, the code causes an exit with error set to zero (i.e.,
success). This looks unintended to me. Is the code correct? I suspect
a return of -EFAULT or -ENOMEM is warranted.

Cheers,

Michael

--
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/

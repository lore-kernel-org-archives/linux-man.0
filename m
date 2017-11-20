From: Miklos Szeredi <mszeredi@redhat.com>
Subject: Re: Improving documentation of parent-ID field in /proc/PID/mountinfo
Date: Mon, 20 Nov 2017 10:22:20 +0100
Message-ID: <CAOssrKdELFCZdvhcE356swgGg=aFc6guUo5yD77ekLv8WQG4cA@mail.gmail.com>
References: <CAKgNAkhz8TWY5DpS4SHiapxC2903KdtBydNAG476_edun2oeLw@mail.gmail.com>
 <20171113075537.GG5546@ram.oc3035372033.ibm.com> <CAOssrKeOcuQqEksvc_hgiZiLHHCHCJ_kt+__4BvQvLMDqGcqpw@mail.gmail.com>
 <CAKgNAki_8xKG0Ky2phAHbKi=Ta7QYZRW4hr3hgu3rZ=gG-AHvA@mail.gmail.com>
 <CAOssrKfW3yTEa7Wq0MeGkQd+sSpZft+PRjH6ymQEoFHFVpuk-w@mail.gmail.com> <CAKgNAkjX20TbvvVEcqK+TqG995f4T6eYKp0ujGpJgh_Z7fQsRQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAKgNAkjX20TbvvVEcqK+TqG995f4T6eYKp0ujGpJgh_Z7fQsRQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc: Ram Pai <linuxram@us.ibm.com>, lkml <linux-kernel@vger.kernel.org>, linux-man <linux-man@vger.kernel.org>, Alexander Eder <alexander.eder@harman.com>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

On Mon, Nov 20, 2017 at 10:07 AM, Michael Kerrisk (man-pages)
<mtk.manpages@gmail.com> wrote:

> But, the problem is that the existing description is at best misleading:
>
>               (2)  parent  ID: the ID of the parent mount (or of self for
>                    the top of the mount tree).
>
> That implies that we'll find one line in the list where field 1 and
> field 2 are the same. But we don't, because the mountns rootfs entry
> is not shown in mountinfo. On top of that, the reader is left
> confused, because when they look at mountinfo, they see one entry
> where the parent-ID doesn't exist in the list. So, something more than
> the current text is required. After digging around in the kernel
> source and noticing that chroot() will also cause this scenario, and
> taking into account your comments, I revised the text to:
>
>               (2)  parent ID: the ID of the parent mount (or of self  for
>                    the root of this mount namespace's mount tree).
>
>                    If  the  parent mount point lies outside the process's
>                    root directory (see  chroot(2)),  the  ID  shown  here
>                    won't  have  a corresponding record in mountinfo whose
>                    mount ID  (field  1)  matches  this  parent  mount  ID
>                    (because  mount  points that lie outside the process's
>                    root directory are not shown in mountinfo).  As a spe‐
>                    cial  case  of  this  point,  the process's root mount
>                    point may have  a  parent  mount  (for  the  initramfs
>                    filesystem)  that  lies  outside  the  process's  root
>                    directory, and an entry for that mount point will  not
>                    appear in mountinfo.
>
> How does that seem?

Perfect.

Thanks,
Miklos

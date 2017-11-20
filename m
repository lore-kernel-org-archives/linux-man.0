From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: Improving documentation of parent-ID field in /proc/PID/mountinfo
Date: Mon, 20 Nov 2017 10:07:29 +0100
Message-ID: <CAKgNAkjX20TbvvVEcqK+TqG995f4T6eYKp0ujGpJgh_Z7fQsRQ@mail.gmail.com>
References: <CAKgNAkhz8TWY5DpS4SHiapxC2903KdtBydNAG476_edun2oeLw@mail.gmail.com>
 <20171113075537.GG5546@ram.oc3035372033.ibm.com> <CAOssrKeOcuQqEksvc_hgiZiLHHCHCJ_kt+__4BvQvLMDqGcqpw@mail.gmail.com>
 <CAKgNAki_8xKG0Ky2phAHbKi=Ta7QYZRW4hr3hgu3rZ=gG-AHvA@mail.gmail.com> <CAOssrKfW3yTEa7Wq0MeGkQd+sSpZft+PRjH6ymQEoFHFVpuk-w@mail.gmail.com>
Reply-To: mtk.manpages@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <CAOssrKfW3yTEa7Wq0MeGkQd+sSpZft+PRjH6ymQEoFHFVpuk-w@mail.gmail.com>
Sender: linux-fsdevel-owner@vger.kernel.org
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: Ram Pai <linuxram@us.ibm.com>, lkml <linux-kernel@vger.kernel.org>, linux-man <linux-man@vger.kernel.org>, Alexander Eder <alexander.eder@harman.com>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

Hi Miklos,

Sorry for the slow follow-up.

On 14 November 2017 at 17:16, Miklos Szeredi <mszeredi@redhat.com> wrote:
> On Tue, Nov 14, 2017 at 8:08 AM, Michael Kerrisk (man-pages)
> <mtk.manpages@gmail.com> wrote:
>> Hi Miklos, Ram
>>
>> Thanks for your comments. A question below.
>>
>> On 13 November 2017 at 09:11, Miklos Szeredi <mszeredi@redhat.com> wrote=
:
>>> On Mon, Nov 13, 2017 at 8:55 AM, Ram Pai <linuxram@us.ibm.com> wrote:
>>>> On Mon, Nov 13, 2017 at 07:02:21AM +0100, Michael Kerrisk (man-pages) =
wrote:
>>>>> Hello Ram,
>>>>>
>>>>> Long ago (2.6.29) you added the /proc/PID/mountinfo file and
>>>>> associated documentation in Documentation/filesystems/proc.txt. Later=
,
>>>>> I pasted much of that documentation into the proc(5) manual page.
>>>>>
>>>>> That documentation says of the second field in the file:
>>>>>
>>>>> [[
>>>>> This file contains lines of the form:
>>>>>
>>>>> 36 35 98:0 /mnt1 /mnt2 rw,noatime master:1 - ext3 /dev/root rw,errors=
=3Dcontinue
>>>>> (1)(2)(3)   (4)   (5)      (6)      (7)   (8) (9)   (10)         (11)
>>>>>
>>>>> (1) mount ID:  unique identifier of the mount (may be reused after um=
ount)
>>>>> (2) parent ID:  ID of parent (or of self for the top of the mount tre=
e)
>>>>> ...
>>>>> ]]
>>>>>
>>>>> The last piece of the description of field (2) doesn't seem to be
>>>>> correct, or is at least rather unclear. I take this to be saying that
>>>>> that for the root mount point, /, field (2) will have the same value
>>>>> as field (1). I never actually looked at this detail closely, but
>>>>> Alexander pointed out that this is obviously not so, as one can
>>>>> immediately verify:
>>>>>
>>>>> $ grep '/ / ' /proc/$$/mountinfo
>>>>> 65 0 8:2 / / rw,relatime shared:1 - ext4 /dev/sda2 rw,seclabel,data=
=3Dorder
>>>>>
>>>>> I dug around in the kernel source for a bit. I do not have an exact
>>>>> handle on the details, but I can see roughly what is going on.
>>>>> Internally, there seems to be one ("hidden") mount ID reserved to eac=
h
>>>>> mount namespace, and that ID is the parent of the root mount point.
>>>>>
>>>>> Looking through the (4.14) kernel source, mount IDs are allocated by
>>>>> mnt_alloc_id() (in fs/namespace.c), which is in turn called by
>>>>> alloc_vfsmnt() which is in turn called by clone_mnt().
>>>>>
>>>>> A new mount namespace is created by the kernel function copy_mnt_ns()
>>>>> (in fs/namespace.c, called by create_new_namespaces() in
>>>>> kernel/nsproxy.c). The copy_mnt_ns() function calls copy_tree() (in
>>>>> fs/namespace.c), and copy_tree() calls clone_mnt() in *two* places.
>>>>> The first of these is the call that creates the "hidden" mount ID tha=
t
>>>>> becomes the parent of the root mount point. (I verified this by
>>>>> instrumenting the kernel with a few printk() calls to display the
>>>>> IDs.)  The second place where copy_tree() calls clone_mnt() is in a
>>>>> loop that replicates each of the mount points (including the root
>>>>> mount point) in the source mount namespace.
>>>>
>>>> We used to report that mount, ones upon a time.  Something has changed
>>>> the behavior since then and its not reported any more, thus making it
>>>> hidden.
>>>
>>> The hidden one is the initramfs, I believe.  That's the root of the
>>> mount namespace, and the when a namespace is cloned, the tree is
>>> copied from the namespace root.
>>>
>>> It is "hidden" because no process has its root there.  Note the
>>> difference between namespace root and process root: the first is the
>>> real root of the mount tree and is unchangeable, the second is
>>> pointing to some place in a mount tree and can be changed (chroot).
>>>
>>> So there's nothing special in this rootfs, it is just hidden because
>>> it's not the root of any task.
>>>
>>> The description of  field (2) is correct, it just does not make it
>>> clear what it means by "root".
>>
>> Sorry -- do you mean the old description is correct, or my new
>> description (below)?
>
> Well, both are correct, yours just describes the same thing at the
> higher level.  But I think rootfs is an implementation detail, so is
> the fact that it gets a zero mount ID, so I think the original
> description better captures the essence of the interface.  Except it
> needs to clarify what "top of the mount tree" means.  It doesn't mean
> current process's root, rather it means the root of the mount tree in
> the current mount namespace.

Thanks for the further info.

But, the problem is that the existing description is at best misleading:

              (2)  parent  ID: the ID of the parent mount (or of self for
                   the top of the mount tree).

That implies that we'll find one line in the list where field 1 and
field 2 are the same. But we don't, because the mountns rootfs entry
is not shown in mountinfo. On top of that, the reader is left
confused, because when they look at mountinfo, they see one entry
where the parent-ID doesn't exist in the list. So, something more than
the current text is required. After digging around in the kernel
source and noticing that chroot() will also cause this scenario, and
taking into account your comments, I revised the text to:

              (2)  parent ID: the ID of the parent mount (or of self  for
                   the root of this mount namespace's mount tree).

                   If  the  parent mount point lies outside the process's
                   root directory (see  chroot(2)),  the  ID  shown  here
                   won't  have  a corresponding record in mountinfo whose
                   mount ID  (field  1)  matches  this  parent  mount  ID
                   (because  mount  points that lie outside the process's
                   root directory are not shown in mountinfo).  As a spe=E2=
=80=90
                   cial  case  of  this  point,  the process's root mount
                   point may have  a  parent  mount  (for  the  initramfs
                   filesystem)  that  lies  outside  the  process's  root
                   directory, and an entry for that mount point will  not
                   appear in mountinfo.

How does that seem?

Cheers,

Michael

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/

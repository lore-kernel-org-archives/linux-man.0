From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Improving documentation of parent-ID field in /proc/PID/mountinfo
Date: Tue, 14 Nov 2017 08:08:36 +0100
Message-ID: <CAKgNAki_8xKG0Ky2phAHbKi=Ta7QYZRW4hr3hgu3rZ=gG-AHvA@mail.gmail.com>
References: <CAKgNAkhz8TWY5DpS4SHiapxC2903KdtBydNAG476_edun2oeLw@mail.gmail.com>
 <20171113075537.GG5546@ram.oc3035372033.ibm.com> <CAOssrKeOcuQqEksvc_hgiZiLHHCHCJ_kt+__4BvQvLMDqGcqpw@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOssrKeOcuQqEksvc_hgiZiLHHCHCJ_kt+__4BvQvLMDqGcqpw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Miklos Szeredi <mszeredi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Ram Pai <linuxram-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexander Eder <alexander.eder-dasnjmbS2urQT0dZR+AlfA@public.gmane.org>, "linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Miklos, Ram

Thanks for your comments. A question below.

On 13 November 2017 at 09:11, Miklos Szeredi <mszeredi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> On Mon, Nov 13, 2017 at 8:55 AM, Ram Pai <linuxram-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org> wrote:
>> On Mon, Nov 13, 2017 at 07:02:21AM +0100, Michael Kerrisk (man-pages) wr=
ote:
>>> Hello Ram,
>>>
>>> Long ago (2.6.29) you added the /proc/PID/mountinfo file and
>>> associated documentation in Documentation/filesystems/proc.txt. Later,
>>> I pasted much of that documentation into the proc(5) manual page.
>>>
>>> That documentation says of the second field in the file:
>>>
>>> [[
>>> This file contains lines of the form:
>>>
>>> 36 35 98:0 /mnt1 /mnt2 rw,noatime master:1 - ext3 /dev/root rw,errors=
=3Dcontinue
>>> (1)(2)(3)   (4)   (5)      (6)      (7)   (8) (9)   (10)         (11)
>>>
>>> (1) mount ID:  unique identifier of the mount (may be reused after umou=
nt)
>>> (2) parent ID:  ID of parent (or of self for the top of the mount tree)
>>> ...
>>> ]]
>>>
>>> The last piece of the description of field (2) doesn't seem to be
>>> correct, or is at least rather unclear. I take this to be saying that
>>> that for the root mount point, /, field (2) will have the same value
>>> as field (1). I never actually looked at this detail closely, but
>>> Alexander pointed out that this is obviously not so, as one can
>>> immediately verify:
>>>
>>> $ grep '/ / ' /proc/$$/mountinfo
>>> 65 0 8:2 / / rw,relatime shared:1 - ext4 /dev/sda2 rw,seclabel,data=3Do=
rder
>>>
>>> I dug around in the kernel source for a bit. I do not have an exact
>>> handle on the details, but I can see roughly what is going on.
>>> Internally, there seems to be one ("hidden") mount ID reserved to each
>>> mount namespace, and that ID is the parent of the root mount point.
>>>
>>> Looking through the (4.14) kernel source, mount IDs are allocated by
>>> mnt_alloc_id() (in fs/namespace.c), which is in turn called by
>>> alloc_vfsmnt() which is in turn called by clone_mnt().
>>>
>>> A new mount namespace is created by the kernel function copy_mnt_ns()
>>> (in fs/namespace.c, called by create_new_namespaces() in
>>> kernel/nsproxy.c). The copy_mnt_ns() function calls copy_tree() (in
>>> fs/namespace.c), and copy_tree() calls clone_mnt() in *two* places.
>>> The first of these is the call that creates the "hidden" mount ID that
>>> becomes the parent of the root mount point. (I verified this by
>>> instrumenting the kernel with a few printk() calls to display the
>>> IDs.)  The second place where copy_tree() calls clone_mnt() is in a
>>> loop that replicates each of the mount points (including the root
>>> mount point) in the source mount namespace.
>>
>> We used to report that mount, ones upon a time.  Something has changed
>> the behavior since then and its not reported any more, thus making it
>> hidden.
>
> The hidden one is the initramfs, I believe.  That's the root of the
> mount namespace, and the when a namespace is cloned, the tree is
> copied from the namespace root.
>
> It is "hidden" because no process has its root there.  Note the
> difference between namespace root and process root: the first is the
> real root of the mount tree and is unchangeable, the second is
> pointing to some place in a mount tree and can be changed (chroot).
>
> So there's nothing special in this rootfs, it is just hidden because
> it's not the root of any task.
>
> The description of  field (2) is correct, it just does not make it
> clear what it means by "root".

Sorry -- do you mean the old description is correct, or my new
description (below)?

Cheers,

Michael


> Thanks,
> Miklos
>
>>
>>>
>>> With these details in mind, I propose to patch the man page to read as
>>> below. Perhaps you have some corrections or improvements to suggest
>>> for this text?
>>>
>>> [[
>>>               (2)  parent ID: the ID of the parent mount.  For  the  ro=
ot
>>>                    mount  point,  the  ID shown here is a hidden mount =
ID
>>>                    associated with the mount namespace.  That ID is  di=
s=E2=80=90
>>>                    tinct  from  any  of the IDs shown in field (1) of t=
he
>>>                    records shown in the  mountinfo  file,  and  does  n=
ot
>>>                    appear in field (1) in the mountinfo file in any oth=
er
>>>                    mount namespace.  (In  the  initial  mount  namespac=
e,
>>>                    this hidden ID has the value 0.)
>>
>> It captures the current semantics correctly.
>>
>> RP
>>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

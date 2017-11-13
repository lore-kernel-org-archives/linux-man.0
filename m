From: Ram Pai <linuxram@us.ibm.com>
Subject: Re: Improving documentation of parent-ID field in /proc/PID/mountinfo
Date: Sun, 12 Nov 2017 23:55:37 -0800
Message-ID: <20171113075537.GG5546@ram.oc3035372033.ibm.com>
References: <CAKgNAkhz8TWY5DpS4SHiapxC2903KdtBydNAG476_edun2oeLw@mail.gmail.com>
Reply-To: Ram Pai <linuxram@us.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAkhz8TWY5DpS4SHiapxC2903KdtBydNAG476_edun2oeLw@mail.gmail.com>
Sender: linux-fsdevel-owner@vger.kernel.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc: lkml <linux-kernel@vger.kernel.org>, linux-man <linux-man@vger.kernel.org>, Alexander Eder <alexander.eder@harman.com>, Miklos Szeredi <mszeredi@redhat.com>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

On Mon, Nov 13, 2017 at 07:02:21AM +0100, Michael Kerrisk (man-pages) wrote:
> Hello Ram,
> 
> Long ago (2.6.29) you added the /proc/PID/mountinfo file and
> associated documentation in Documentation/filesystems/proc.txt. Later,
> I pasted much of that documentation into the proc(5) manual page.
> 
> That documentation says of the second field in the file:
> 
> [[
> This file contains lines of the form:
> 
> 36 35 98:0 /mnt1 /mnt2 rw,noatime master:1 - ext3 /dev/root rw,errors=continue
> (1)(2)(3)   (4)   (5)      (6)      (7)   (8) (9)   (10)         (11)
> 
> (1) mount ID:  unique identifier of the mount (may be reused after umount)
> (2) parent ID:  ID of parent (or of self for the top of the mount tree)
> ...
> ]]
> 
> The last piece of the description of field (2) doesn't seem to be
> correct, or is at least rather unclear. I take this to be saying that
> that for the root mount point, /, field (2) will have the same value
> as field (1). I never actually looked at this detail closely, but
> Alexander pointed out that this is obviously not so, as one can
> immediately verify:
> 
> $ grep '/ / ' /proc/$$/mountinfo
> 65 0 8:2 / / rw,relatime shared:1 - ext4 /dev/sda2 rw,seclabel,data=order
> 
> I dug around in the kernel source for a bit. I do not have an exact
> handle on the details, but I can see roughly what is going on.
> Internally, there seems to be one ("hidden") mount ID reserved to each
> mount namespace, and that ID is the parent of the root mount point.
> 
> Looking through the (4.14) kernel source, mount IDs are allocated by
> mnt_alloc_id() (in fs/namespace.c), which is in turn called by
> alloc_vfsmnt() which is in turn called by clone_mnt().
> 
> A new mount namespace is created by the kernel function copy_mnt_ns()
> (in fs/namespace.c, called by create_new_namespaces() in
> kernel/nsproxy.c). The copy_mnt_ns() function calls copy_tree() (in
> fs/namespace.c), and copy_tree() calls clone_mnt() in *two* places.
> The first of these is the call that creates the "hidden" mount ID that
> becomes the parent of the root mount point. (I verified this by
> instrumenting the kernel with a few printk() calls to display the
> IDs.)  The second place where copy_tree() calls clone_mnt() is in a
> loop that replicates each of the mount points (including the root
> mount point) in the source mount namespace.

We used to report that mount, ones upon a time.  Something has changed
the behavior since then and its not reported any more, thus making it
hidden.

> 
> With these details in mind, I propose to patch the man page to read as
> below. Perhaps you have some corrections or improvements to suggest
> for this text?
> 
> [[
>               (2)  parent ID: the ID of the parent mount.  For  the  root
>                    mount  point,  the  ID shown here is a hidden mount ID
>                    associated with the mount namespace.  That ID is  dis‐
>                    tinct  from  any  of the IDs shown in field (1) of the
>                    records shown in the  mountinfo  file,  and  does  not
>                    appear in field (1) in the mountinfo file in any other
>                    mount namespace.  (In  the  initial  mount  namespace,
>                    this hidden ID has the value 0.)

It captures the current semantics correctly.

RP

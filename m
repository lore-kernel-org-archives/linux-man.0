From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 120671] missing info about userns restrictions
Date: Tue, 21 Jun 2016 11:54:47 +0000
Message-ID: <bug-120671-11311-NefOlNFsab@https.bugzilla.kernel.org/>
References: <bug-120671-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-120671-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D120671

Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
-----------------------------------------------------------------------=
-----
             Status|REOPENED                    |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #9 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Micha=C5=82 Zegan from comment #8)
> Reopening because I confirmed the fact about filesystems not being
> mountable, at least ext2. As I do not know kernel well enough to read
> sources, it would be useful to have a list of filesystems that are mo=
untable
> but I cannot write it, I only know at least proc, devpts? tmpfs and c=
groupv2
> at least if cgroup namespaces are enabled. All my words have to be ve=
rified
> to make sure i am not wrong. Also someone should find any other restr=
ictions
> user namespaces impose if they exist because I do not know any.

Ahhh -- now I'm with you. I was a bit confused in my thinking before. S=
earching
for FS_USERNS_MOUNT tells us which filesystems can be mounted with
CAP_SYS_ADMIN in a (noninitial) userns. I added the following text to t=
he page:

       Holding  CAP_SYS_ADMIN  within  a  (noninitial)  user namespace
       allows the creation of bind mounts, and mounting of the follow=E2=
=80=90
       ing types of filesystems:

           * /proc (since Linux 3.8)
           * /sys (since Linux 3.8)
           * devpts (since Linux 3.9)
           * tmpfs (since Linux 3.9)
           * ramfs (since Linux 3.9)
           * mqueue (since Linux 3.9)
           * bpf (since Linux 4.4)

       Note however, that mounting block-based filesystems can be done
       only by a process that holds CAP_SYS_ADMIN in the initial  user
       namespace.

> One comment: not sure why I can losetup from userns, like is it becau=
se I
> have rw on loop0 as root is mapped to new userns root, or does it che=
ck
> CAP_SYS_ADMIN in the new userns, or both?

Not sure. But if you work out all the details, let me know.

Thanks,

Michael

--=20
You are receiving this mail because:
You are watching the assignee of the bug.--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

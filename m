From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 120671] missing info about userns restrictions
Date: Tue, 21 Jun 2016 09:25:01 +0000
Message-ID: <bug-120671-11311-zAzX942tYr@https.bugzilla.kernel.org/>
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

Micha=C5=82 Zegan <webczat_200-wo4oW1Pw1HF3vZ0LZ0W7Rg@public.gmane.org> changed:

           What    |Removed                     |Added
-----------------------------------------------------------------------=
-----
             Status|RESOLVED                    |REOPENED
         Resolution|CODE_FIX                    |---

--- Comment #8 from Micha=C5=82 Zegan <webczat_200-wo4oW1Pw1HF3vZ0LZ0W7Rg@public.gmane.org> ---
Reopening because I confirmed the fact about filesystems not being moun=
table,
at least ext2. As I do not know kernel well enough to read sources, it =
would be
useful to have a list of filesystems that are mountable but I cannot wr=
ite it,
I only know at least proc, devpts? tmpfs and cgroupv2 at least if cgrou=
p
namespaces are enabled. All my words have to be verified to make sure i=
 am not
wrong. Also someone should find any other restrictions user namespaces =
impose
if they exist because I do not know any.
To make you confident I tested filesystem mounting properly, I will pas=
te my
terminal session after changing to english locale. :)
Logged in as my server's root and making user/mount/pid namespace.
[root@webczatnet ~]# unshare -rUpmf
[root@webczatnet ~]# fallocate -l 1M test
[root@webczatnet ~]# losetup /dev/loop0 test
[root@webczatnet ~]# mke2fs /dev/loop0
mke2fs 1.42.13 (17-May-2015)
Discarding device blocks: done                           =20
Creating filesystem with 1024 1k blocks and 128 inodes
Allocating group tables: done                           =20
Writing inode tables: done                           =20
Writing superblocks and filesystem accounting information: done
[root@webczatnet ~]# mkdir x
[root@webczatnet ~]# mount /dev/loop0 x
mount: permission denied
[root@webczatnet ~]# exit
logout
[root@webczatnet ~]# mount /dev/loop0 x
[root@webczatnet ~]# umount x
[root@webczatnet ~]# rmdir x
[root@webczatnet ~]# losetup -d /dev/loop0
[root@webczatnet ~]# rm test

One comment: not sure why I can losetup from userns, like is it because=
 I have
rw on loop0 as root is mapped to new userns root, or does it check
CAP_SYS_ADMIN in the new userns, or both?

--=20
You are receiving this mail because:
You are watching the assignee of the bug.--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

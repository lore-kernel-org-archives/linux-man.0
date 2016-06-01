From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 118671] mkfifo(3) & mknod(2) and EPERM
Date: Wed, 01 Jun 2016 04:53:20 +0000
Message-ID: <bug-118671-11311-wXU6zr3Bqv@https.bugzilla.kernel.org/>
References: <bug-118671-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-118671-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=118671

Navin <navinp1912-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |navinp1912-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

--- Comment #1 from Navin <navinp1912-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Works for me.Maybe samba configuration issue. You need to have a writeable user
.
The below tells that issue is not with cifs driver.

root@junk-foo:/mnt/3# touch foo
root@junk-foo:/mnt/3# ls -l foo
-rw-r--r--+ 1 root root 0 Jun  1 10:20 foo
root@junk-foo:/mnt/3# mknod foo b 4 3
mknod: foo: File exists
root@junk-foo:/mnt/3# mknod devfoo b 4 3
root@junk-foo:/mnt/3# mkfifo pipe
root@junk-foo:/mnt/3# ls -l
total 0
brw-r--r-- 1 root root 4, 3 Jun  1 10:21 devfoo
-rw-r--r-- 1 root root    0 Jun  1 10:20 foo
prw-r--r-- 1 root root    0 Jun  1 10:21 pipe
root@junk-foo:/mnt/3# uname -a
Linux junk-foo 4.7.0-rc1+ #1 SMP Tue May 31 21:24:09 IST 2016 x86_64 x86_64
x86_64 GNU/Linux
root@junk-foo:/mnt/3# mount | grep /mnt/3
//192.168.0.103/xyz on /mnt/3 type cifs
(rw,relatime,vers=1.0,cache=strict,username=root,domain=JUNK-FOO,uid=0,noforceuid,gid=0,noforcegid,addr=192.168.0.103,unix,posixpaths,serverino,mapposix,acl,rsize=1048576,wsize=65536,echo_interval=60,actimeo=1)
root@junk-foo:/mnt/3#

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

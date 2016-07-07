From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 120671] missing info about userns restrictions
Date: Thu, 07 Jul 2016 12:33:29 +0000
Message-ID: <bug-120671-11311-1EQS97AeE7@https.bugzilla.kernel.org/>
References: <bug-120671-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-120671-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=120671

--- Comment #17 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Ahhh -- I see now that I missed a detail when reading the kernel source code
(in kernel/cgroup.c::cgroup_mount()):

        /*
         * We know this subsystem has not yet been bound.  Users in a non-init
         * user namespace may only mount hierarchies with no bound subsystems,
         * i.e. 'none,name=user1'
         */
        if (!opts.none && !capable(CAP_SYS_ADMIN)) {
                ret = -EPERM;
                goto out_unlock;
        }


I've updated this piece of the user_namespaces(7) page to read:

       Holding  CAP_SYS_ADMIN within the user namespace associated with a
       process's cgroup namespace allows (since Linux 4.6)  that  process
       to  the  mount  cgroup  version  2 filesystem and cgroup version 1
       named hierarchies  (i.e.,  cgroup  filesystems  mounted  with  the
       "none,name=" option).

I've tested both cgroup v2 mounts and cgroup v1 'name=' mounts successfully on
kernel 4.7-rc2.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

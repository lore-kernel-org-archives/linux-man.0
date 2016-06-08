From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 118671] mkfifo(3) & mknod(2) and EPERM
Date: Wed, 08 Jun 2016 15:06:37 +0000
Message-ID: <bug-118671-11311-CULNB1OqEJ@https.bugzilla.kernel.org/>
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

--- Comment #2 from Nadav Har'El <nyh-TS7m/3hpY0sOpacJJkBjfT4kX+cae0hd@public.gmane.org> ---
I don't know why it worked for you and not for me, but I did paste the exact
error message ("operation not permitted") I got from mkfifo ;-)

Looking at the Linux source code, fs/cifs/dir.c, the cifs_mknod function, I see
the lines causing this EPERM::

        int rc = -EPERM;
        ...
        if (!(cifs_sb->mnt_cifs_flags & CIFS_MOUNT_UNX_EMUL))
                goto mknod_out;
        ...
        mknod_out:
        ...
        return rc;

So it appears that if this "CIFS_MOUNT_UNX_EMUL" flag is not turned on, indeed
an EPERM is being returned. I'm not sure who is supposed to turn on this flag
(does it come from the server? is it a mount-time flag?), but I guess it can be
off, and mknod() would result in EPERM.

I'm not sure why the CIFS guys decided to return EPERM in this case (and not
something else, like ENOSYS), but perhaps this decision has precedent in other
drivers as well. I didn't check.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

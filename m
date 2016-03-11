From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 104601] Description of getname-related syscalls wrong
Date: Fri, 11 Mar 2016 20:42:09 +0000
Message-ID: <bug-104601-11311-FOARzk2Fxd@https.bugzilla.kernel.org/>
References: <bug-104601-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-104601-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=104601

--- Comment #2 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
See also this code in net/socket.c

static int move_addr_to_user(struct sockaddr_storage *kaddr, int klen,
                             void __user *uaddr, int __user *ulen)
{
        int err;
        int len;

        BUG_ON(klen > sizeof(struct sockaddr_storage));
        err = get_user(len, ulen);
        if (err)
                return err;
        if (len > klen)
                len = klen;
        if (len < 0)
                return -EINVAL;
        if (len) {
                if (audit_sockaddr(klen, kaddr))
                        return -ENOMEM;
                if (copy_to_user(uaddr, kaddr, len))
                        return -EFAULT;
        }
        /*
         *      "fromlen shall refer to the value before truncation.."
         *                      1003.1g
         */
        return __put_user(klen, ulen);
}

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

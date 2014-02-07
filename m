From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 70141] getxattr(2): #include <attr/xattr.h> problem
Date: Fri, 07 Feb 2014 12:08:44 +0000
Message-ID: <bug-70141-11311-m29YSwHu3I@https.bugzilla.kernel.org/>
References: <bug-70141-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-70141-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=70141

--- Comment #5 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Mike Frysinger from comment #4)
> (In reply to Fabrice Bauzac from comment #2)
> 
> ok, but i didn't say sys/xattr.h, i said attr/xattr.h
> 
> (In reply to Michael Kerrisk from comment #3)
> 
> i think these manpages were originally imported from the attr project ?

Yes, that's my recollection.

> the "standard" funcs have been provided by glibc for a long time:
>  - {l,f,}getxattr
>  - {l,f,}listxattr
>  - {l,f,}removexattr
>  - {l,f,}setxattr
> 
> the attr package provides more funcs than those, and it provides command
> line utils for interacting with file xattrs, so it's not a completely
> obsolete package (at least for Linux)

Yup.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 120061] unix.7: Extend notes about ignored permissions for UNIX
 domain sockets
Date: Mon, 20 Jun 2016 13:04:38 +0000
Message-ID: <bug-120061-11311-QJnMcohQjp@https.bugzilla.kernel.org/>
References: <bug-120061-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-120061-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=120061

--- Comment #2 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
For now, I have applied the patch below. Maybe I will do more, depending on
further info that you can supply.

--- a/man7/unix.7
+++ b/man7/unix.7
@@ -232,7 +232,7 @@ connecting to a stream socket object requires write
permission on that socket;
 sending a datagram to a datagram socket likewise
 requires write permission on that socket.
 POSIX does not make any statement about the effect of the permissions
-on a socket file, and on many systems (e.g., several BSD derivatives),
+on a socket file, and on some systems (e.g., older BSDs),
 the socket permissions are ignored.
 Portable programs should not rely on
 this feature for security.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

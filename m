From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 86001] Errors in sendfile man page
Date: Tue, 05 May 2015 10:41:42 +0000
Message-ID: <bug-86001-11311-lUv3eDUtkE@https.bugzilla.kernel.org/>
References: <bug-86001-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-86001-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=86001

Askar Safin <safinaskar-JGs/UdohzUI@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|CODE_FIX                    |---

--- Comment #2 from Askar Safin <safinaskar-JGs/UdohzUI@public.gmane.org> ---
"The Linux-specific splice(2) call supports transferring data between arbitrary
files (e.g., a pair of sockets)"

"pair of sockets" part is wrong. See splice(2). Also, I just tested this,
splice doesn't work on pair of sockets (tested on Linux 3.16). So, please,
change this phrase to (for example):

"The Linux-specific splice(2) call supports transferring data between arbitrary
file descriptors provided one of them (or both) is a pipe".

(Also, where is your change? I don't see it in current head [
https://git.kernel.org/cgit/docs/man-pages/man-pages.git/tree/man2/sendfile.2?id=beb9356fdc3d377f27eec6fd2cb07b97bb1927d4
])

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

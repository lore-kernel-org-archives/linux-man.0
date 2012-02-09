From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 42705] ioctl prototype is incorrect
Date: Thu, 9 Feb 2012 05:46:43 GMT
Message-ID: <201202090546.q195khGV024688@bugzilla.kernel.org>
References: <bug-42705-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-42705-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=42705


David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org




--- Comment #1 from David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>  2012-02-09 05:46:42 ---
I just discovered this one too.  Some more information:

As the submitter pointed out glibc uses unsigned long, the kernel's sys_ioctl()
prototype uses unsigned int.  In addition the kernel _IOC_ macros which are
used to construct ioctl numbers result in unsigned expressions, and these
macros are exposed to userland via the headers.  There _are_ a number of
already used ioctls numbers which have bit 31 set, and so are negative as an
'int'.  Specifically IOC_READ ioctls will have bit 31 set on x86, and IOC_WRITE
ones will have bit 31 set on powerpc, I haven't checked other archs.

This discepancy can cause real userspace bugs or compile failures: because the
ioctl number macros are unsigned, if IOCTL is one of the standard ioctl number
#defines based on these macros then the following code fragment:
        int x = IOCTL;
        if (x == IOCTL)
                /* ... */
Will generate a "comparison always false due to limited range of data type"
warning from gcc, and presumably will indeed compare false, which is clearly
not the expected result.

POSIX states that the ioctl number should be 'int', but clearly the kernel and
libc treat it as unsigned.  Apparently most existing user code must treat it
that way too, since we haven't noticed this problem before.  *BSD also appear
to have it as unsigned long.  Changing the kernel prototype could result in
similar bugs but the other way around for existing code, which would be bad.

Therefore, we should update the man pages to reflect reality, rather than
POSIX.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

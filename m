From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 82531] Nondumpable processes that are sandboxed with
 CLONE_NEWUSER can be ptraced from outside.
Date: Thu, 21 Aug 2014 19:05:29 +0000
Message-ID: <bug-82531-11311-BBBA3cQ8E7@https.bugzilla.kernel.org/>
References: <bug-82531-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-82531-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=82531

Alan <alan-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|Other                       |man-pages
           Assignee|other_other-ztI5WcYan/vzT1o0prF9pg@public.gmane.org |documentation_man-pages@ker
                   |l.org                       |nel-bugs.osdl.org
            Product|Other                       |Documentation

--- Comment #3 from Alan <alan-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org> ---
If I am outside the sandbox then I can equally patch the kernel if I have all
the rights I need.

You either need everything sandboxed or you need a trusted element (TPM,
smartcard etc) to do the crunching and keep the secrets.


I don't think the docs are unclear but I'll move it to man pages

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

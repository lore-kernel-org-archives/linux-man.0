From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 43300] ::prctl(PR_SET_PDEATHSIG, SIGKILL) uses parent thread
 death to signal instead of parent process death.
Date: Thu, 19 Feb 2015 21:47:01 +0000
Message-ID: <bug-43300-11311-eOoOjkmhMs@https.bugzilla.kernel.org/>
References: <bug-43300-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-43300-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=43300

Alan <alan-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
          Component|Other                       |man-pages
         Resolution|OBSOLETE                    |---
           Assignee|process_other@kernel-bugs.o |documentation_man-pages@ker
                   |sdl.org                     |nel-bugs.osdl.org
            Product|Process Management          |Documentation

--- Comment #24 from Alan <alan-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org> ---
Ok so lets move it to documentation if the docs are in error

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

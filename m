From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 82531] Nondumpable processes that are sandboxed with
 CLONE_NEWUSER can be ptraced from outside.
Date: Sat, 13 Jun 2015 18:56:57 +0000
Message-ID: <bug-82531-11311-FRnP0FHoMD@https.bugzilla.kernel.org/>
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

Jann Horn <jann+kernelbugzilla-XZ1E9jl8jIdeoWH0uzbU5w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jann+kernelbugzilla@thejh.n
                   |                            |et

--- Comment #5 from Jann Horn <jann+kernelbugzilla-XZ1E9jl8jIdeoWH0uzbU5w@public.gmane.org> ---
This is documented. See user_namespaces.7:

       3. When a user namespace is created, the kernel records the effective
          user ID of the creating process as being the "owner" of the
          namespace.  A process that resides in the parent of the user
          namespace and whose effective user ID matches the owner of the
          namespace has all capabilities in the namespace.

So, a process outside the namespace with the same EUID as the process that
moved itself into a new namespace has CAP_SYS_PTRACE inside the namespace. And
as capabilities.7 documents:

       CAP_SYS_PTRACE
              *  Trace arbitrary processes using ptrace(2);

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

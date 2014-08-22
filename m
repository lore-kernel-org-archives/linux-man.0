From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 82531] Nondumpable processes that are sandboxed with
 CLONE_NEWUSER can be ptraced from outside.
Date: Fri, 22 Aug 2014 20:12:18 +0000
Message-ID: <bug-82531-11311-V6auvQdRZj@https.bugzilla.kernel.org/>
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

--- Comment #4 from Steven Stewart-Gallus <sstewartgallus00-QKvm5KDIoDa7M0a00MdBSQ@public.gmane.org> ---
Actually, certain system configurations prevent patching the kernel as
root.  As well, most processes should not be run as root or with the
system capabilities that allow one to patch the kernel.

But the situation I am thinking of is that a normal user (let us call
him "bob") connects to a remote server using private information.
This private information is somehow protected (perhaps it is owned by
a user or is stored on an external device).  bob's SSH program has the
capability or permissions to connect to or retrieve the protected
secrets and once it has acquired the secrets sets itself nondumpable
and then lowers it's capabilities to normal user permissions (to
prevent a hacker infecting the process and gaining access to the
secrets). This situation works fine but currently if the additional
step of sandboxing subprograms of the SSH process is added in then
normal processes of bob can ptrace and otherwise attack the sandboxed
SSH processes and possibly gain access to the private secrets.  From
there, those normal bob owned processes can gain access to the server
bob is connecting to.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 14328] Consistent the size type. New logic to use.
Date: Tue, 6 Oct 2009 08:54:14 GMT
Message-ID: <200910060854.n968sE00004988@demeter.kernel.org>
References: <bug-14328-11311@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-14328-11311-V0hAGp6uBxO456/isadD/XN4h3HLQggn@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=14328


Victor Mineev <vik-cfgfcfnPGrx6k2ZkT/Rh8A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Severity|normal                      |enhancement




--- Comment #1 from Victor Mineev <vik-cfgfcfnPGrx6k2ZkT/Rh8A@public.gmane.org>  2009-10-06 08:54:14 ---
Lazy algorithm is the right thing to do. Do user space read a lot better. Let
protect high half of memory region as read/write disabled. So data begin can go
to user space fast soon. And lazy detect of negative size value become true. Is
the kernel do read syncronicly? It is so fantastic to test where is a kvm guest
do the last access.

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

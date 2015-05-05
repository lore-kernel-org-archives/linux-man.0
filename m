From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 55371] printf: a conversion specifier doesn't necessarily ask
 for an argument
Date: Tue, 05 May 2015 16:05:17 +0000
Message-ID: <bug-55371-11311-xpBxffMZF9@https.bugzilla.kernel.org/>
References: <bug-55371-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-55371-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=55371

Filipus Klutiero <chealer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|CODE_FIX                    |---

--- Comment #6 from Filipus Klutiero <chealer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Please do not close this ticket until the issue has been solved.

A simple patch for this issue is trivial - just rectify that only some
conversion specifiers ask for the next arguments, for example:

By default, the arguments are used in the order given, where each '*' and each
conversion specifier (except for some) asks for the next argument (and it is an
error if insufficiently many arguments are given).


A patch which would keep the current sentence's precision would have to list
the exceptions.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

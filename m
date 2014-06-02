From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 48641] [TRIVIAL]splice can return EAGAIN
Date: Mon, 02 Jun 2014 07:08:01 +0000
Message-ID: <bug-48641-11311-lAE5niNKjD@https.bugzilla.kernel.org/>
References: <bug-48641-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-48641-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=48641

--- Comment #5 from sakshi.april5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
I have found these files where the changes need to be made:
man2/splice.2
man2/vmsplice.2
man2/tee.2

I suppose change in any one file would reflect changes in the other?
How exactly do we need to make the chnage to get the above mentioned output?

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 23282] vsnprintf(3) example promotes code which ignores error
 return code
Date: Mon, 25 Feb 2013 06:44:02 +0000 (UTC)
Message-ID: <20130225064402.5BBFC11FC85@bugzilla.kernel.org>
References: <bug-23282-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-23282-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=23282





--- Comment #12 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2013-02-25 06:44:02 ---
@Graham: Thanks for the review Graham.

@Marshel: Thanks for the revised patch. I appreciate that you're keen to get
your patch reviewed, but everyone's on private time here, so things can be
slow. As such, it's best to space your pings out a bit. I'm inclined to agree
with Graham's comment that the first piece of text that you added probably
isn't needed. But, otherwise, if you can fix the rest of the patch up as per
Graham's comments, I'm happy to apply it.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

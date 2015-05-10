From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 50151] glibc 2.16 included a new function __ppc_get_timebase
Date: Sun, 10 May 2015 11:56:33 +0000
Message-ID: <bug-50151-11311-GD7rERXicp@https.bugzilla.kernel.org/>
References: <bug-50151-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-50151-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=50151

--- Comment #5 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Michael Kerrisk from comment #1)
> Hello Tulio,
> 
> What's the significance of the __" prefix in this function name? Is this
> function really intended for userspace?
> 
> Also, what about __ppc_get_timebase_freq(). Does it likewise need to be
> documented?

Hello Tulio,

Okay -- this fell on the ground for a very long time. Sorry about that. But
your patch is applied now. What shall we do about __ppc_get_timebase_freq()? (I
see there is documentation in the glibc manual.)

Thanks,

Michael

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

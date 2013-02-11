From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 23282] vsnprintf(3) example promotes code which ignores error
 return code
Date: Mon, 11 Feb 2013 15:09:29 +0000 (UTC)
Message-ID: <20130211150929.3AEEC11FF35@bugzilla.kernel.org>
References: <bug-23282-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-23282-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=23282





--- Comment #4 from Marshel Abraham <Marshel.Abraham-Mykyq1cwIDpWk0Htik3J/w@public.gmane.org>  2013-02-11 15:09:28 ---
Created an attachment (id=93121)
 --> (https://bugzilla.kernel.org/attachment.cgi?id=93121)
handle error code 

Okay this time I have tried to address the backward compatibility issue.I have
made the change in NOTES section of the Documentation.I have gone through the
entire Documentation and could find only two places where it is mentioned.

Regarding the return value I couldn't figure out what to return :-) apart from
NULL.

I have kept the code simple and also test it.Though the codes have been changed
comments are not felt like they fit perfectly.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

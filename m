From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 55371] printf: a conversion specifier doesn't necessarily ask
 for an argument
Date: Tue, 05 May 2015 18:01:47 +0000
Message-ID: <bug-55371-11311-gHVXvDjuy6@https.bugzilla.kernel.org/>
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

Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|REOPENED                    |RESOLVED
         Resolution|---                         |WILL_NOT_FIX

--- Comment #7 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
So, I've stepped back from this a little, to think about it more. I don't agree
with the characterization of this problem as an error. The sentence you refer
to is a generalization. The exceptions are clarified later. I don't think it
help comprehensibility, nor readability, to clutter the initial discussion with
a note that there are some exceptions. By the time folk get to the point in the
page where %% is discussed, it's also noted as an exception to the general
rule; problem solved. printf() is a complex API. It's reasonable to expect that
people should read the documentation with some care.

Summary: there's nothing to fix here, so I'm not fixing it.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

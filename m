From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 55371] printf: a conversion specifier doesn't necessarily ask
 for an argument
Date: Tue, 05 May 2015 18:57:14 +0000
Message-ID: <bug-55371-11311-guEeeLueUO@https.bugzilla.kernel.org/>
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

--- Comment #8 from Filipus Klutiero <chealer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Few students will be given man printf to read in school. The vast majority of
consultations will happen when people try to interpret or write a call to
printf(). It is unlikely that these readers will read the entire page at once.

If the documentation says each conversion specifier asks for the next argument,
it is reasonable to expect that readers - whether careful or not - will
conclude that each conversion specifier asks for the next argument, unless they
read up to the point where this is contradicted.

If you think a note about exceptions would clutter, terminology can be used,
for example "regular conversion specifier" versus "special conversion
specifier".

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
